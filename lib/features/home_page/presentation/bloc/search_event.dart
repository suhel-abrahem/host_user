part of 'search_bloc.dart';

@freezed
class SearchEvent with _$SearchEvent {
  const factory SearchEvent.started() = SearchEventStarted;
  const factory SearchEvent.searchItems({required SearchModel? model}) =
      SearchEventSearchItems;
}
