import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hosta_user/config/app/app_preferences.dart';
import 'package:hosta_user/core/data_state/data_state.dart';
import 'package:hosta_user/core/dependencies_injection.dart';
import 'package:hosta_user/features/login_page/domain/entities/login_state_entity.dart';
import 'package:hosta_user/features/refresh_token/data/models/refresh_token_model.dart';
import 'package:hosta_user/features/refresh_token/domain/usecases/refresh_token_usecase.dart';
import 'package:hosta_user/features/service_details/domain/entities/time_slots_entity.dart';

import '../../data/models/time_slots_model.dart';
import '../../domain/usecases/time_slots_usecase.dart';

part 'time_slots_event.dart';
part 'time_slots_state.dart';
part 'time_slots_bloc.freezed.dart';

class TimeSlotsBloc extends Bloc<TimeSlotsEvent, TimeSlotsState> {
  final RefreshTokenUsecase _refreshTokenUsecase;
  final TimeSlotsUsecase _timeSlotsUsecase;
  TimeSlotsBloc(this._refreshTokenUsecase, this._timeSlotsUsecase)
    : super(TimeSlotsState.initial()) {
    on<TimeSlotsEventStarted>((event, emit) {
      emit(TimeSlotsState.initial());
    });
    on<TimeSlotsEventGetTimeSlots>((event, emit) async {
      LoginStateEntity? loginStateEntity = getItInstance<AppPreferences>()
          .getUserInfo();
      await _refreshTokenUsecase
          .call(
            params: RefreshTokenModel(
              token: loginStateEntity?.access_token ?? '',
              refresh_token: loginStateEntity?.refresh_token ?? '',
            ),
          )
          .then((refreshTokenOnValue) async {
            if (refreshTokenOnValue is DataSuccess) {
              await _timeSlotsUsecase
                  .call(
                    params: event.timeSlotsModel?.copyWith(
                      token: refreshTokenOnValue?.data?.access_token,
                    ),
                  )
                  .then((timeSlotsOnValue) {
                    if (timeSlotsOnValue is DataSuccess) {
                      if (timeSlotsOnValue?.data != null &&
                          (timeSlotsOnValue?.data?.isNotEmpty ?? false)) {
                        emit(
                          TimeSlotsState.loaded(
                            timeSlots: timeSlotsOnValue?.data,
                          ),
                        );
                      } else {
                        emit(TimeSlotsState.noData());
                      }
                    } else if (timeSlotsOnValue is NOInternetDataState) {
                      emit(TimeSlotsState.noInternet());
                    } else if (timeSlotsOnValue is UnauthenticatedDataState) {
                      emit(TimeSlotsState.sessionExpired());
                    } else {
                      emit(
                        TimeSlotsState.error(
                          message: timeSlotsOnValue?.error ?? '',
                        ),
                      );
                    }
                  });
            } else if (refreshTokenOnValue is NOInternetDataState) {
              emit(TimeSlotsState.noInternet());
            } else {
              emit(TimeSlotsState.sessionExpired());
            }
          });
    });
  }
}
