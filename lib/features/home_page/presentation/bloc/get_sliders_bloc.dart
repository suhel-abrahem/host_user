import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hosta_user/core/dependencies_injection.dart';
import 'package:hosta_user/features/home_page/domain/usecases/get_slider_usecase.dart';
import 'package:hosta_user/features/login_page/domain/entities/login_state_entity.dart';
import 'package:hosta_user/features/refresh_token/domain/usecases/refresh_token_usecase.dart';

import '../../../../config/app/app_preferences.dart';
import '../../../../core/data_state/data_state.dart';
import '../../../refresh_token/data/models/refresh_token_model.dart';
import '../../data/models/home_page_model.dart';
import '../../domain/entities/slider_entity.dart';

part 'get_sliders_event.dart';
part 'get_sliders_state.dart';
part 'get_sliders_bloc.freezed.dart';

class GetSlidersBloc extends Bloc<GetSlidersEvent, GetSlidersState> {
  final RefreshTokenUsecase _refreshTokenUsecase;
  final GetSliderUsecase _getSlidersUsecase;
  GetSlidersBloc(this._refreshTokenUsecase, this._getSlidersUsecase)
    : super(GetSlidersStateInitial()) {
    on<GetSlidersEventStarted>((event, emit) {
      emit(GetSlidersStateInitial());
    });
    on<GetSlidersEventGetSliders>((event, emit) async {
      LoginStateEntity? userInfo = getItInstance<AppPreferences>()
          .getUserInfo();
      emit(GetSlidersStateLoading());
      await _refreshTokenUsecase
          .call(
            params: RefreshTokenModel(
              token: userInfo?.access_token,
              refresh_token: userInfo?.refresh_token,
            ),
          )
          .then((refreshDataState) async {
            if (refreshDataState is DataSuccess) {
              await _getSlidersUsecase
                  .call(
                    params: event.model?.copyWith(
                      token: refreshDataState?.data?.access_token,
                    ),
                  )
                  .then((onValue) async {
                    if (onValue is DataSuccess) {
                      if (onValue?.data == null ||
                          (onValue?.data?.isEmpty ?? true)) {
                        emit(GetSlidersStateNoData());
                        return;
                      }
                      emit(GetSlidersStateLoaded(sliders: onValue?.data));
                    } else if (onValue is UnauthenticatedDataState) {
                      emit(GetSlidersStateUnauthenticated());
                    } else if (onValue is NOInternetDataState) {
                      emit(GetSlidersStateNoInternet());
                    } else if (onValue is DataFailed) {
                      emit(GetSlidersStateError(message: onValue?.error));
                    } else {
                      emit(GetSlidersStateError(message: onValue?.error));
                    }
                  });
            } else {
              emit(GetSlidersStateUnauthenticated());
            }
          });
    });
  }
}
