import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:hosta_user/core/constants/api_constant.dart';
import 'package:hosta_user/core/data_state/data_state.dart';
import 'package:hosta_user/core/resource/common_service/common_service.dart';
import 'package:hosta_user/core/resource/connectivity/check_connectivity.dart';

import 'package:hosta_user/features/service_details/data/models/service_details_model.dart';

import 'package:hosta_user/features/service_details/domain/entities/service_details_entity.dart';

import '../../domain/repositories/service_details_repository.dart';

class ServiceDetailsRepositoryImpl implements ServiceDetailsRepository {
  final CheckConnectivity _checkConnectivity;
  ServiceDetailsRepositoryImpl(this._checkConnectivity);
  @override
  Future<DataState<List<ServiceDetailsEntity?>?>?> getServiceDetails({
    required ServiceDetailsModel? serviceDetailsModel,
  }) async {
    ConnectivityResult connectivityResult = ConnectivityResult.none;
    await _checkConnectivity.checkConnectivity().then(
      (onValue) => connectivityResult = onValue.last,
    );
    if (connectivityResult == ConnectivityResult.none) {
      return NOInternetDataState();
    }
    DataState<List<ServiceDetailsEntity?>?>? response;
    CommonService commonService = CommonService(
      headers: {
        "Accept-Language": serviceDetailsModel?.Accept_Language ?? "ar",
        "Authorization": "Bearer ${serviceDetailsModel?.Authorization}",
      },
    );
    try {
      print(
        "service repo heders: ${{"Accept-Language": serviceDetailsModel?.Accept_Language ?? "ar", "Authorization": "Bearer ${serviceDetailsModel?.Authorization}"}}",
      );
      print(
        "service repo params: ${{"service_id": serviceDetailsModel?.service_id}}",
      );
      await commonService
          .get(
            ApiConstant.getProvidersEndpoint,
            params: {"service_id": serviceDetailsModel?.service_id},
          )
          .then((onValue) {
            if (onValue is DataSuccess) {
              final List? rawServiceDetails = onValue.data?.data["data"];
              List<ServiceDetailsEntity?>? serviceDetailsEntity = [];
              rawServiceDetails?.forEach(
                (action) => serviceDetailsEntity.add(
                  ServiceDetailsEntity.fromJson(action ?? {}),
                ),
              );
              response = DataSuccess(data: serviceDetailsEntity);
              return response;
            } else if (onValue is UnauthenticatedDataState) {
              response = UnauthenticatedDataState(error: onValue.error);
              return response;
            } else {
              response = DataFailed(error: onValue.error);
              return response;
            }
          });
    } catch (e) {
      response = DataFailed(error: e.toString());
      return response;
    }
    return response;
  }
}
