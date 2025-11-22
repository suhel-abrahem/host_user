part of 'service_details_bloc.dart';

@freezed
class ServiceDetailsState with _$ServiceDetailsState {
  const factory ServiceDetailsState.initial() = ServiceDetailsStateInitial;
  const factory ServiceDetailsState.loading() = ServiceDetailsStateLoading;
  const factory ServiceDetailsState.loaded({
    required List<ServiceDetailsEntity?>? serviceDetailsEntity,
  }) = ServiceDetailsStateLoaded;
  const factory ServiceDetailsState.error({required String error}) =
      ServiceDetailsStateError;
  const factory ServiceDetailsState.unauthenticated({required String error}) =
      ServiceDetailsStateUnauthenticated;
  const factory ServiceDetailsState.noInternet() =
      ServiceDetailsStateNoInternet;
  const factory ServiceDetailsState.noData() = ServiceDetailsStateNoData;
}
