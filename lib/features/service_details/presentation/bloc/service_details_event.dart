part of 'service_details_bloc.dart';

@freezed
class ServiceDetailsEvent with _$ServiceDetailsEvent {
  const factory ServiceDetailsEvent.started() = ServiceDetailsEventStarted;
  const factory ServiceDetailsEvent.getServiceDetails({
    required ServiceDetailsModel? serviceDetailsModel,
  }) = ServiceDetailsEventGetServiceDetails;
}
