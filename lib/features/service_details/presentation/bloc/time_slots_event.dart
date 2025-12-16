part of 'time_slots_bloc.dart';

@freezed
class TimeSlotsEvent with _$TimeSlotsEvent {
  const factory TimeSlotsEvent.started() = TimeSlotsEventStarted;
  const factory TimeSlotsEvent.getTimeSlots({
    required TimeSlotsModel? timeSlotsModel,
  }) = TimeSlotsEventGetTimeSlots;
}
