import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:hosta_user/core/constants/api_constant.dart';
import 'package:hosta_user/core/data_state/data_state.dart';
import 'package:hosta_user/core/resource/common_service/common_service.dart';
import 'package:hosta_user/core/resource/connectivity/check_connectivity.dart';
import 'package:uuid/uuid.dart';
import 'package:hosta_user/features/service_details/data/models/store_booking_model.dart';

import '../../domain/repositories/store_booking_repository.dart';

class StoreBookingRepositoryImplements implements StoreBookingRepository {
  final CheckConnectivity? _checkConnectivity;
  StoreBookingRepositoryImplements(this._checkConnectivity);
  @override
  Future<DataState<void>?> storeBooking({
    required StoreBookingModel? storeBookingModel,
  }) async {
    ConnectivityResult? connectivityResult;
    DataState<void>? response;
    await _checkConnectivity?.checkConnectivity().then(
      (onValue) => connectivityResult = onValue.last,
    );
    if (connectivityResult == ConnectivityResult.none) {
      response = NOInternetDataState();
      return response;
    }

    try {
      final uuid = Uuid();
      CommonService commonService = CommonService(
        headers: {
          "Accept-Language": storeBookingModel?.acceptLanguage ?? "ar",
          "Authorization": "Bearer ${storeBookingModel?.authToken}",
          "accept": "application/json",
          "Idempotency-Key": uuid.v4(),
        },
      );
      print(
        "Store Booking Request Headers: ${{"provider_id": storeBookingModel?.providerId, "provider_services_id": storeBookingModel?.serviceId, "start_time": storeBookingModel?.scheduledAt}}",
      );
      final formData = FormData();

      formData.fields.add(
        MapEntry('provider_id', storeBookingModel!.providerId.toString()),
      );
      formData.fields.add(
        MapEntry(
          'provider_services_id',
          storeBookingModel.serviceId.toString(),
        ),
      );
      formData.fields.add(
        MapEntry('start_time', storeBookingModel.scheduledAt ?? ""),
      );

      if (storeBookingModel.notes?.isNotEmpty == true) {
        formData.fields.add(MapEntry('notes', storeBookingModel.notes ?? ""));
      }

      if (storeBookingModel.attachments != null &&
          storeBookingModel.attachments?.isNotEmpty == true) {
        for (final file in storeBookingModel.attachments!) {
          formData.files.add(
            MapEntry(
              'images[]', // ⚠️ confirm backend key
              await MultipartFile.fromFile(
                file!.path,
                filename: file.path.split('/').last,
              ),
            ),
          );
        }
      }

      await commonService
          .post(ApiConstant.storeBookingEndpoint, data: formData)
          .then((onValue) {
            print("Store Booking Response: ${onValue.error}");
            if (onValue is DataSuccess) {
              print("Store Booking Successful");
              response = DataSuccess(data: null);
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
