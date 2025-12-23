part of 'get_sliders_bloc.dart';

@freezed
class GetSlidersEvent with _$GetSlidersEvent {
  const factory GetSlidersEvent.started() = GetSlidersEventStarted;
  const factory GetSlidersEvent.getSliders({required HomePageModel? model}) =
      GetSlidersEventGetSliders;
}
