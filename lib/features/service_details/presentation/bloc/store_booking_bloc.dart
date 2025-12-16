import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hosta_user/config/app/app_preferences.dart';
import 'package:hosta_user/core/dependencies_injection.dart';
import 'package:hosta_user/features/login_page/domain/entities/login_state_entity.dart';
import 'package:hosta_user/features/refresh_token/domain/usecases/refresh_token_usecase.dart';

import '../../../../core/data_state/data_state.dart';
import '../../../refresh_token/data/models/refresh_token_model.dart';
import '../../data/models/store_booking_model.dart';
import '../../domain/usecases/store_booking_usecase.dart';

part 'store_booking_event.dart';
part 'store_booking_state.dart';
part 'store_booking_bloc.freezed.dart';

class StoreBookingBloc extends Bloc<StoreBookingEvent, StoreBookingState> {
  final RefreshTokenUsecase _refreshTokenUsecase;
  final StoreBookingUseCase _storeBookingUseCase;
  StoreBookingBloc(this._refreshTokenUsecase, this._storeBookingUseCase)
    : super(StoreBookingStateInitial()) {
    on<StoreBookingEventStarted>((event, emit) {
      emit(StoreBookingStateInitial());
    });
    on<StoreBookingEventStoreBooking>((event, emit) async {
      LoginStateEntity? loginStateEntity = getItInstance<AppPreferences>()
          .getUserInfo();
      emit(StoreBookingStateLoading());
      await _refreshTokenUsecase
          .call(
            params: RefreshTokenModel(
              token: loginStateEntity?.access_token ?? '',
              refresh_token: loginStateEntity?.refresh_token ?? '',
            ),
          )
          .then((refreshTokenOnValue) async {
            print("Refresh Token Success: ${refreshTokenOnValue}");
            if (refreshTokenOnValue is DataSuccess) {
              await _storeBookingUseCase
                  .call(
                    params: event.storeBookingModel?.copyWith(
                      authToken: refreshTokenOnValue?.data?.access_token,
                    ),
                  )
                  .then((storeBookingOnValue) {
                    print("StoreBookingOnValue: $storeBookingOnValue");
                    if (storeBookingOnValue is DataSuccess) {
                      emit(StoreBookingStateSuccess());
                    } else if (storeBookingOnValue is NOInternetDataState) {
                      emit(StoreBookingStateNoInternet());
                    } else if (storeBookingOnValue
                        is UnauthenticatedDataState) {
                      emit(StoreBookingStateSessionExpired());
                    } else {
                      emit(
                        StoreBookingStateError(
                          message: storeBookingOnValue?.error ?? '',
                        ),
                      );
                    }
                  });
            } else if (refreshTokenOnValue is NOInternetDataState) {
              emit(StoreBookingStateNoInternet());
            } else {
              emit(StoreBookingState.sessionExpired());
            }
          });
    });
  }
}
