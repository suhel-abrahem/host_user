part of 'search_bloc.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState.initial() = SearchStateInitial;
  const factory SearchState.loading() = SearchStateLoading;
  const factory SearchState.loaded({required List<SearchEntity?>? results}) =
      SearchStateLoaded;
  const factory SearchState.error({required String? message}) =
      SearchStateError;
  const factory SearchState.noResults() = SearchStateNoResults;
  const factory SearchState.noInternet() = SearchStateNoInternet;
  const factory SearchState.unauthenticated() = SearchStateUnauthenticated;
}
