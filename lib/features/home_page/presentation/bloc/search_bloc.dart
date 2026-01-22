import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hosta_user/config/app/app_preferences.dart';
import 'package:hosta_user/core/data_state/data_state.dart';
import 'package:hosta_user/core/dependencies_injection.dart';
import 'package:hosta_user/features/home_page/domain/entities/search/search_entity.dart';
import 'package:hosta_user/features/login_page/domain/entities/login_state_entity.dart';
import 'package:hosta_user/features/refresh_token/data/models/refresh_token_model.dart';
import 'package:hosta_user/features/refresh_token/domain/usecases/refresh_token_usecase.dart';

import '../../data/models/search/search_model.dart';
import '../../domain/usecases/search/search_usecase.dart';

part 'search_event.dart';
part 'search_state.dart';
part 'search_bloc.freezed.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final RefreshTokenUsecase _refreshTokenUsecase;
  final SearchUsecase _searchUsecase;
  SearchBloc(this._refreshTokenUsecase, this._searchUsecase)
    : super(SearchStateInitial()) {
    on<SearchEventStarted>((event, emit) {
      emit(SearchState.initial());
    });
    on<SearchEventSearchItems>((event, emit) async {
      emit(SearchState.loading());
      LoginStateEntity? loginStateEntity = getItInstance<AppPreferences>()
          .getUserInfo();
      await _refreshTokenUsecase
          .call(
            params: RefreshTokenModel(
              refresh_token: loginStateEntity?.refresh_token,
              token: loginStateEntity?.access_token,
            ),
          )
          .then((refreshTokenOnValue) async {
            if (refreshTokenOnValue is DataSuccess) {
              await _searchUsecase
                  .call(
                    params: event.model?.copyWith(
                      token: refreshTokenOnValue?.data?.access_token,
                    ),
                  )
                  .then((searchOnValue) {
                    if (searchOnValue is DataSuccess) {
                      final results = (searchOnValue)?.data;
                      if (results == null || results.isEmpty) {
                        emit(SearchState.noResults());
                      } else {
                        emit(SearchState.loaded(results: results));
                      }
                    } else if (searchOnValue is NOInternetDataState) {
                      emit(const SearchState.noInternet());
                    } else if (searchOnValue is UnauthenticatedDataState) {
                      emit(const SearchState.unauthenticated());
                    } else if (searchOnValue is DataFailed) {
                      emit(SearchState.error(message: (searchOnValue)?.error));
                    }
                  });
            } else if (refreshTokenOnValue is NOInternetDataState) {
              emit(const SearchState.noInternet());
            } else {
              emit(const SearchState.unauthenticated());
            }
          });
    });
  }
}
