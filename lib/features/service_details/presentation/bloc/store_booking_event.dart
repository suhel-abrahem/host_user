part of 'store_booking_bloc.dart';

@freezed
class StoreBookingEvent with _$StoreBookingEvent {
  const factory StoreBookingEvent.started() = StoreBookingEventStarted;
  const factory StoreBookingEvent.storeBooking({
    required StoreBookingModel? storeBookingModel,
  }) = StoreBookingEventStoreBooking;
}
