part of 'rate_bloc.dart';

@freezed
class RateState with _$RateState {
  const factory RateState.initial() = RateStateInitial;
  const factory RateState.loading() = RateStateLoading;
  const factory RateState.success() = RateStateSuccess;
  const factory RateState.failure({required String error}) = RateStateFailure;
  const factory RateState.unauthenticated({required String error}) =
      RateStateUnauthenticated;
  const factory RateState.noInternet() = RateStateNoInternet;
  const factory RateState.getRateSuccess({required int? rate}) =
      RateStateGetRateSuccess;
  const factory RateState.setRateSuccess({required int? rate}) =
      RateStateSetRateSuccess;
}
