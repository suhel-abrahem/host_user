import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hosta_user/config/app/app_preferences.dart';
import 'package:hosta_user/core/dependencies_injection.dart';
import 'package:hosta_user/features/refresh_token/data/repositories/refresh_token_repository_implements.dart';
import 'package:hosta_user/features/refresh_token/domain/usecases/refresh_token_usecase.dart';
import 'package:hosta_user/features/service_details/domain/usecases/get_service_providers_usecase.dart';

import '../../../../core/data_state/data_state.dart';
import '../../../refresh_token/data/models/refresh_token_model.dart';
import '../../data/models/service_details_model.dart';
import '../../domain/entities/service_details_entity.dart';

part 'service_details_event.dart';
part 'service_details_state.dart';
part 'service_details_bloc.freezed.dart';

class ServiceDetailsBloc
    extends Bloc<ServiceDetailsEvent, ServiceDetailsState> {
  final RefreshTokenUsecase _refreshTokenUsecase;
  final GetServiceProvidersUseCase _getServiceProvidersUseCase;
  ServiceDetailsBloc(
    this._refreshTokenUsecase,
    this._getServiceProvidersUseCase,
  ) : super(ServiceDetailsState.initial()) {
    on<ServiceDetailsEventStarted>((event, emit) {
      emit(ServiceDetailsState.initial());
    });
    on<ServiceDetailsEventGetServiceDetails>((event, emit) async {
      emit(ServiceDetailsState.loading());
      await _refreshTokenUsecase
          .call(
            params: RefreshTokenModel(
              refresh_token: getItInstance<AppPreferences>()
                  .getUserInfo()
                  ?.refresh_token,
            ),
          )
          .then((refreshTokenDataState) async {
            if (refreshTokenDataState is DataSuccess) {
              await _getServiceProvidersUseCase
                  .call(
                    params: event.serviceDetailsModel?.copyWith(
                      Authorization:
                          refreshTokenDataState?.data?.access_token ?? "",
                    ),
                  )
                  .then((dataState) {
                    print("Service Details Data State: ${dataState?.error}");
                    if (dataState is DataSuccess) {
                      if (dataState?.data == null ||
                          (dataState?.data?.isEmpty ?? true)) {
                        emit(ServiceDetailsState.noData());
                      } else {
                        emit(
                          ServiceDetailsState.loaded(
                            serviceDetailsEntity: dataState?.data,
                          ),
                        );
                      }
                    } else if (dataState is UnauthenticatedDataState) {
                      emit(
                        ServiceDetailsState.unauthenticated(
                          error: dataState?.error ?? "",
                        ),
                      );
                    } else if (dataState is DataFailed) {
                      emit(
                        ServiceDetailsState.error(
                          error: dataState?.error ?? "",
                        ),
                      );
                    }
                  });
            } else if (refreshTokenDataState is UnauthenticatedDataState) {
              emit(
                ServiceDetailsState.unauthenticated(
                  error: refreshTokenDataState?.error ?? "",
                ),
              );
            } else if (refreshTokenDataState is DataFailed) {
              emit(
                ServiceDetailsState.error(
                  error: refreshTokenDataState?.error ?? "",
                ),
              );
            }
          });
    });
  }
}
