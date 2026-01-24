import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hosta_user/config/app/app_preferences.dart';
import 'package:hosta_user/core/data_state/data_state.dart';
import 'package:hosta_user/core/dependencies_injection.dart';
import 'package:hosta_user/features/login_page/domain/entities/login_state_entity.dart';
import 'package:hosta_user/features/refresh_token/data/models/refresh_token_model.dart';
import 'package:hosta_user/features/refresh_token/domain/usecases/refresh_token_usecase.dart';

import '../../data/model/rate_model.dart';
import '../../domain/usecase/sent_rate_usecase.dart';

part 'rate_event.dart';
part 'rate_state.dart';
part 'rate_bloc.freezed.dart';

class RateBloc extends Bloc<RateEvent, RateState> {
  final RefreshTokenUsecase _refreshTokenUsecase;
  final SentRateUsecase _sentRateUsecase;
  RateBloc(this._refreshTokenUsecase, this._sentRateUsecase)
    : super(const RateState.initial()) {
    int? rate = 0;
    on<RateEventStarted>((event, emit) {
      rate = 0;
      emit(const RateState.initial());
    });
    on<RateEventSentRate>((event, emit) async {
      emit(const RateState.loading());
      LoginStateEntity? loginStateEntity = getItInstance<AppPreferences>()
          .getUserInfo();
      await _refreshTokenUsecase
          .call(
            params: RefreshTokenModel(
              token: loginStateEntity?.access_token,
              refresh_token: loginStateEntity?.refresh_token,
            ),
          )
          .then((refreshTokenOnValue) async {
            if (refreshTokenOnValue is DataSuccess) {
              await _sentRateUsecase
                  .call(
                    params: event.rateModel.copyWith(
                      token: refreshTokenOnValue?.data?.access_token,
                    ),
                  )
                  .then((sentRateOnValue) {
                    if (sentRateOnValue is DataSuccess) {
                      emit(const RateState.success());
                    } else if (sentRateOnValue is UnauthenticatedDataState) {
                      emit(
                        RateState.unauthenticated(
                          error: sentRateOnValue?.error ?? "",
                        ),
                      );
                    } else if (sentRateOnValue is DataError) {
                      emit(
                        RateState.failure(error: sentRateOnValue?.error ?? ""),
                      );
                    } else if (sentRateOnValue is NOInternetDataState) {
                      emit(const RateState.noInternet());
                    } else {
                      emit(
                        RateState.failure(error: sentRateOnValue?.error ?? ""),
                      );
                    }
                  });
            } else if (refreshTokenOnValue is UnauthenticatedDataState) {
              emit(
                RateState.unauthenticated(
                  error: refreshTokenOnValue?.error ?? "",
                ),
              );
            } else if (refreshTokenOnValue is DataError) {
              emit(RateState.failure(error: refreshTokenOnValue?.error ?? ""));
            } else if (refreshTokenOnValue is NOInternetDataState) {
              emit(const RateState.noInternet());
            } else {
              emit(RateState.failure(error: refreshTokenOnValue?.error ?? ""));
            }
          });
    });
    on<RateEventSetRate>((event, emit) {
      rate = event.rate;
      emit(RateState.getRateSuccess(rate: rate));
    });
    on<RateEventGetRate>((event, emit) {
      emit(RateState.getRateSuccess(rate: rate));
    });
  }
}
