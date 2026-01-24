part of 'rate_bloc.dart';

@freezed
class RateEvent with _$RateEvent {
  const factory RateEvent.started() = RateEventStarted;
  const factory RateEvent.sentRate({required RateModel rateModel}) =
      RateEventSentRate;
  const factory RateEvent.getRate() = RateEventGetRate;
  const factory RateEvent.setRate({int? rate}) = RateEventSetRate;
}
