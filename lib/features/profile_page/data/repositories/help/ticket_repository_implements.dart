import 'package:connectivity_plus/connectivity_plus.dart'
    show ConnectivityResult;
import 'package:hosta_user/core/data_state/data_state.dart';
import 'package:hosta_user/core/resource/common_service/common_service.dart';
import 'package:hosta_user/core/resource/connectivity/check_connectivity.dart';

import 'package:hosta_user/features/profile_page/data/models/help/create_ticket_model.dart';

import 'package:hosta_user/features/profile_page/data/models/help/get_tickets_model.dart';
import 'package:hosta_user/features/profile_page/domain/entities/help/ticket_entity.dart';

import 'package:hosta_user/features/profile_page/domain/entities/help/tickets_entity.dart';

import '../../../../../core/constants/api_constant.dart';
import '../../../domain/repositories/help/tickets_repository.dart';

class TicketRepositoryImplements implements TicketsRepository {
  final CheckConnectivity _connectivity;
  TicketRepositoryImplements(this._connectivity);
  @override
  Future<DataState<TicketsEntity?>?> createTicket(
    CreateTicketModel? model,
  ) async {
    ConnectivityResult connectivityResult = ConnectivityResult.none;
    DataState<TicketsEntity?>? dataState;
    try {
      await _connectivity.checkConnectivity().then((onValue) {
        connectivityResult = onValue.last;
      });
    } catch (e) {
      dataState = NOInternetDataState();
      return dataState;
    }
    if (connectivityResult == ConnectivityResult.none) {
      dataState = NOInternetDataState();
      return dataState;
    }
    try {
      final CommonService commonService = CommonService(
        headers: {
          "Authorization": "Bearer ${model?.token}",
          "accept-language": model?.accepted_language ?? "ar",
          "Content-Type": "application/json",
        },
      );

      print({
        "subject": model?.subject,
        "category": model?.category,
        "priority": model?.priority,
        "initial_message": model?.initial_message,
      });
      await commonService
          .post(
            "${ApiConstant.ticketsEndpoint}",
            data: {
              "subject": model?.subject,
              "category": model?.category,
              "priority": model?.priority,
              "initial_message": model?.initial_message,
            },
          )
          .then((response) {
            print(response.error);
            if (response is DataSuccess) {
              dataState = DataSuccess(
                data: TicketsEntity.fromJson(response.data?.data["data"]),
              );
              return dataState;
            } else {
              dataState = DataFailed(error: response.error);
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
  Future<DataState<List<TicketsEntity?>?>?> getTickets(
    GetTicketsModel? model,
  ) async {
    ConnectivityResult connectivityResult = ConnectivityResult.none;
    DataState<List<TicketsEntity?>?>? dataState;
    try {
      await _connectivity.checkConnectivity().then((onValue) {
        connectivityResult = onValue.last;
      });
    } catch (e) {
      dataState = NOInternetDataState();
      return dataState;
    }
    if (connectivityResult == ConnectivityResult.none) {
      dataState = NOInternetDataState();
      return dataState;
    }
    try {
      final CommonService commonService = CommonService(
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer ${model?.token}",
          "accept-language": model?.accepted_language ?? "ar",
          "Content-Type": "application/json",
        },
      );
      await commonService
          .get("${ApiConstant.ticketsEndpoint}${model?.id}")
          .then((response) {
            if (response is DataSuccess) {
              dataState = DataSuccess(
                data: (response.data?.data["data"] as List)
                    .map((e) => TicketsEntity.fromJson(e))
                    .toList(),
              );
              return dataState;
            } else {
              dataState = DataFailed(error: response.error);
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
  Future<DataState<TicketEntity?>?> getTicketDetails(
    GetTicketsModel? model,
  ) async {
    ConnectivityResult connectivityResult = ConnectivityResult.none;
    DataState<TicketEntity?>? dataState;
    try {
      await _connectivity.checkConnectivity().then((onValue) {
        connectivityResult = onValue.last;
      });
    } catch (e) {
      dataState = NOInternetDataState();
      return dataState;
    }
    if (connectivityResult == ConnectivityResult.none) {
      dataState = NOInternetDataState();
      return dataState;
    }
    try {
      final CommonService commonService = CommonService(
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer ${model?.token}",
          "accept-language": model?.accepted_language ?? "ar",
          "Content-Type": "application/json",
        },
      );
      print("get ticket details ${ApiConstant.ticketsEndpoint}${model?.id}");
      await commonService
          .get("${ApiConstant.ticketsEndpoint}/${model?.id}")
          .then((response) {
            print("response get ticket details ${response}");
            if (response is DataSuccess) {
              dataState = DataSuccess(
                data: TicketEntity.fromJson(response.data?.data["data"]),
              );
              return dataState;
            } else {
              dataState = DataFailed(error: response.error);
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
