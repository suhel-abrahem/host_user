import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:hosta_user/core/constants/api_constant.dart';
import 'package:hosta_user/core/data_state/data_state.dart';
import 'package:hosta_user/core/resource/common_service/common_service.dart';
import 'package:hosta_user/core/resource/connectivity/check_connectivity.dart';

import 'package:hosta_user/features/service_details/data/models/time_slots_model.dart';
import 'package:hosta_user/features/service_details/domain/entities/slots_entity.dart';

import 'package:hosta_user/features/service_details/domain/entities/time_slots_entity.dart';

import '../../domain/repositories/time_slots_repository.dart';

class TimeSlotsRepositoryImplements implements TimeSlotsRepository {
  final CheckConnectivity? _checkConnectivity;
  TimeSlotsRepositoryImplements(this._checkConnectivity);
  @override
  Future<DataState<List<TimeSlotsEntity?>?>?> getTimeSlots({
    TimeSlotsModel? timeSlotsModel,
  }) async {
    ConnectivityResult? connectivityResult;
    await _checkConnectivity?.checkConnectivity().then((value) {
      connectivityResult = value.last;
    });
    DataState<List<TimeSlotsEntity?>?>? dataState;
    if (connectivityResult == ConnectivityResult.none) {
      dataState = NOInternetDataState();
      return dataState;
    } else {
      try {
        CommonService commonService = CommonService(
          headers: {
            "Authorization": "Bearer ${timeSlotsModel?.token}",
            "Accept-Language": timeSlotsModel?.acceptLanguage ?? "ar",
            "accept": "application/json",
          },
        );
        print(
          "TimeSlots Request Headers: ${timeSlotsModel?.providerServiceId}",
        );
        await commonService
            .get(
              ApiConstant.timeSlotsEndpoint,
              params: {
                "provider_services_id": timeSlotsModel?.providerServiceId,
              },
            )
            .then((response) {
              if (response is DataSuccess) {
                List<TimeSlotsEntity?>? timeSlotsList = [];
                List<SlotsEntity?>? slotsList = [];
                response.data?.data["data"].forEach((v) {
                  slotsList = [];
                  v["slots"]?.forEach((v) {
                    slotsList?.add(SlotsEntity.fromJson(v));
                  });
                  timeSlotsList.add(
                    TimeSlotsEntity(
                      date: v["date"],
                      day_name: v["day_name"],
                      slots: slotsList,
                    ),
                  );
                });
                dataState = DataSuccess<List<TimeSlotsEntity?>?>(
                  data: timeSlotsList,
                );
              } else if (response is UnauthenticatedDataState) {
                dataState = UnauthenticatedDataState(error: response.error);
              } else {
                dataState = DataFailed(error: response.error);
              }
            });
        return dataState;
      } catch (e) {
        dataState = DataFailed(error: e.toString());
        return dataState;
      }
    }
  }
}
