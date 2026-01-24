import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:hosta_user/core/constants/api_constant.dart';
import 'package:hosta_user/core/data_state/data_state.dart';
import 'package:hosta_user/core/resource/common_service/common_service.dart';
import 'package:hosta_user/core/resource/connectivity/check_connectivity.dart';

import 'package:hosta_user/core/resource/main_page/rate/data/model/rate_model.dart';

import 'package:hosta_user/core/resource/main_page/rate/domain/entity/rate_entity.dart';

import '../../domain/repository/rate_repository.dart';

class RateRepositoryImplements implements RateRepository {
  final CheckConnectivity _checkConnectivity;
  RateRepositoryImplements(this._checkConnectivity);
  @override
  Future<DataState<RateEntity?>?> sendRate({
    required RateModel? rateModel,
  }) async {
    DataState<RateEntity?>? dataState;
    ConnectivityResult? connectivityResult = ConnectivityResult.none;
    await _checkConnectivity.checkConnectivity().then((result) {
      connectivityResult = result.last;
    });
    if (connectivityResult == ConnectivityResult.none) {
      dataState = const NOInternetDataState();
      return dataState;
    }
    try {
      CommonService commonService = CommonService(
        headers: {
          "Authorization": "Bearer ${rateModel?.token}",
          "Content-Type": "application/json",
        },
      );
      await commonService
          .post(
            ApiConstant.rateProviderEndpoint,
            data: {
              "booking_id": rateModel?.bookingId,
              "rating": rateModel?.rating,
              "comment": rateModel?.comment,
            },
          )
          .then((response) {
            if (response is DataSuccess) {
              RateEntity? rateEntity = RateEntity(
                message: response.data?.data["message"],
                data: response.data?.data["data"],
              );
              dataState = DataSuccess<RateEntity?>(data: rateEntity);
            } else if (response is UnauthenticatedDataState) {
              dataState = UnauthenticatedDataState(error: response.error);
            } else if (response is DataError) {
              dataState = DataError(error: response.error);
            } else {
              dataState = DataFailed(error: response.error);
            }
          });
    } catch (e) {
      dataState = DataFailed(error: e.toString());
      return dataState;
    }
    return dataState;
  }
}
