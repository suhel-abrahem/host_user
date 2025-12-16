part of 'time_slots_bloc.dart';

@freezed
class TimeSlotsState with _$TimeSlotsState {
  const factory TimeSlotsState.initial() = TimeSlotsStateInitial;
  const factory TimeSlotsState.loading() = TimeSlotsStateLoading;
  const factory TimeSlotsState.loaded({
    required List<TimeSlotsEntity?>? timeSlots,
  }) = TimeSlotsStateLoaded;
  const factory TimeSlotsState.error({required String message}) =
      TimeSlotsStateError;
  const factory TimeSlotsState.noData() = TimeSlotsStateNoData;
  const factory TimeSlotsState.sessionExpired() = TimeSlotsStateSessionExpired;
  const factory TimeSlotsState.noInternet() = TimeSlotsStateNoInternet;
}
