part of 'store_booking_bloc.dart';

@freezed
class StoreBookingState with _$StoreBookingState {
  const factory StoreBookingState.initial() = StoreBookingStateInitial;
  const factory StoreBookingState.loading() = StoreBookingStateLoading;
  const factory StoreBookingState.success() = StoreBookingStateSuccess;
  const factory StoreBookingState.error({required String message}) =
      StoreBookingStateError;
  const factory StoreBookingState.sessionExpired() =
      StoreBookingStateSessionExpired;
  const factory StoreBookingState.noInternet() = StoreBookingStateNoInternet;
}
