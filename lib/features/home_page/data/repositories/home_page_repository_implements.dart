import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:hosta_user/features/home_page/domain/entities/slider_entity.dart';

import '../../../../core/constants/api_constant.dart';
import '../../../../core/data_state/data_state.dart';
import '../../../../core/resource/common_service/common_service.dart';
import '../../../../core/resource/connectivity/check_connectivity.dart';
import '../../domain/entities/home_page_entity.dart';
import '../../domain/repositories/home_page_repository.dart';
import '../models/home_page_model.dart';

class HomePageRepositoryImpl implements HomePageRepository {
  final CheckConnectivity? _checkConnectivity;

  HomePageRepositoryImpl(this._checkConnectivity);

  @override
  Future<DataState<HomePageEntity?>?> getHomePageData(
    HomePageModel? model,
  ) async {
    ConnectivityResult? connectivityResult;
    await _checkConnectivity?.checkConnectivity().then((result) {
      connectivityResult = result.last;
    });
    if (connectivityResult == ConnectivityResult.none) {
      return NOInternetDataState();
    }
    CommonService commonService = CommonService(
      headers: {
        "Accept-Language": model?.acceptLanguage ?? "",
        "Authorization": "Bearer ${model?.token ?? ""}",
      },
    );
    DataState<HomePageEntity?>? dataState;
    try {
      await commonService.get(ApiConstant.homeStatsEndpoint).then((value) {
        if (value is DataSuccess) {
          dataState = DataSuccess(
            data: HomePageEntity.fromJson(value.data?.data["data"] ?? {}),
          );
          return dataState;
        } else if (value is DataFailed) {
          dataState = DataFailed(error: value.error);
          return dataState;
        }
      });
    } catch (e) {
      dataState = DataFailed(error: e.toString());
      return dataState;
    }
    return dataState;
  }

  @override
  Future<DataState<List<SliderEntity?>?>?> getSliders(
    HomePageModel? model,
  ) async {
    ConnectivityResult? connectivityResult;
    await _checkConnectivity?.checkConnectivity().then((result) {
      connectivityResult = result.last;
    });
    if (connectivityResult == ConnectivityResult.none) {
      return NOInternetDataState();
    }
    CommonService commonService = CommonService(
      headers: {
        "Accept-Language": model?.acceptLanguage ?? "",
        "Authorization": "Bearer ${model?.token ?? ""}",
      },
    );
    DataState<List<SliderEntity?>?>? dataState;
    try {
      await commonService.get(ApiConstant.slidersEndpoint).then((value) {
        if (value is DataSuccess) {
          dataState = DataSuccess(
            data: (value.data?.data["data"] as List)
                .map((e) => SliderEntity.fromJson(e ?? {}))
                .toList(),
          );
          print("Home Page Sliders DataState: $dataState");
          return dataState;
        } else if (value is DataFailed) {
          dataState = DataFailed(error: value.error);
          return dataState;
        }
      });
    } catch (e) {
      dataState = DataFailed(error: e.toString());
      return dataState;
    }
    return dataState;
  }
}
