import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:hosta_user/core/constants/api_constant.dart';
import 'package:hosta_user/core/data_state/data_state.dart';
import 'package:hosta_user/core/resource/common_service/common_service.dart';
import 'package:hosta_user/core/resource/connectivity/check_connectivity.dart';

import 'package:hosta_user/features/home_page/data/models/search/search_model.dart';

import 'package:hosta_user/features/home_page/domain/entities/search/search_entity.dart';

import '../../../domain/repositories/search/search_repository.dart';

class SearchRepositoryImplements implements SearchRepository {
  final CheckConnectivity _connectivity;
  SearchRepositoryImplements({required CheckConnectivity connectivity})
    : _connectivity = connectivity;
  @override
  Future<DataState<List<SearchEntity?>?>?> searchItems(
    SearchModel? model,
  ) async {
    DataState<List<SearchEntity?>?>? dataState;
    ConnectivityResult? connectivityResult = ConnectivityResult.none;
    await _connectivity.checkConnectivity().then((result) {
      connectivityResult = result.last;
    });
    if (connectivityResult == ConnectivityResult.none) {
      dataState = const NOInternetDataState();
    }
    try {
      final CommonService commonService = CommonService(
        headers: {
          "Authorization": "Bearer ${model?.token}",
          "Accept-Language": model?.acceptLanguage ?? "ar",
          "Accept": "application/json",
        },
      );
      await commonService
          .get(
            ApiConstant.searchEndpoint,
            params: {"query": model?.query ?? ""},
          )
          .then((response) {
            if (response is DataSuccess) {
              dataState = DataSuccess(
                data: (response.data?.data?['data'] as List)
                    .map((e) => SearchEntity.fromJson(e))
                    .toList(),
              );
            } else if (response is UnauthenticatedDataState) {
              dataState = UnauthenticatedDataState(error: response.error);
            } else {
              dataState = DataFailed(error: (response).error);
            }
          });
    } catch (e) {
      dataState = DataFailed(error: e.toString());
    }
    return dataState;
  }
}
