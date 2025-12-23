part of 'get_sliders_bloc.dart';

@freezed
class GetSlidersState with _$GetSlidersState {
  const factory GetSlidersState.initial() = GetSlidersStateInitial;
  const factory GetSlidersState.loading() = GetSlidersStateLoading;
  const factory GetSlidersState.loaded({List<SliderEntity?>? sliders}) =
      GetSlidersStateLoaded;
  const factory GetSlidersState.noData() = GetSlidersStateNoData;
  const factory GetSlidersState.error({required String? message}) =
      GetSlidersStateError;
  const factory GetSlidersState.noInternet() = GetSlidersStateNoInternet;
  const factory GetSlidersState.unauthenticated() =
      GetSlidersStateUnauthenticated;
}
