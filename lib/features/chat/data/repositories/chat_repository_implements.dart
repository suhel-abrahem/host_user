import 'dart:math';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:hosta_user/core/constants/api_constant.dart';
import 'package:hosta_user/core/data_state/data_state.dart';
import 'package:hosta_user/core/resource/common_service/common_service.dart';
import 'package:hosta_user/core/resource/connectivity/check_connectivity.dart';

import 'package:hosta_user/features/chat/data/models/chat_model.dart';

import 'package:hosta_user/features/chat/domain/entities/chat/chat_entity.dart';

import 'package:hosta_user/features/chat/domain/entities/chats/chats_entity.dart';
import 'package:hosta_user/features/chat/domain/entities/message/message_entity.dart';

import '../../domain/repositories/chat_repository.dart';

class ChatRepositoryImplements implements ChatRepository {
  final CheckConnectivity checkConnectivity;
  ChatRepositoryImplements(this.checkConnectivity);
  @override
  Future<DataState<ChatEntity?>?> getChatDetails(ChatModel? chatModel) async {
    ConnectivityResult? connectivityResult;
    DataState<ChatEntity?>? dataState;
    await checkConnectivity.checkConnectivity().then((value) {
      connectivityResult = value.last;
    });
    if (connectivityResult == ConnectivityResult.none) {
      dataState = NOInternetDataState();
      return dataState;
    }
    CommonService commonService = CommonService(
      headers: {
        "Accept-Language": chatModel?.acceptLanguage ?? "",
        "Authorization": "Bearer ${chatModel?.authToken ?? ""}",
      },
    );
    try {
      await commonService
          .get("${ApiConstant.chatEndpoint}/${chatModel?.id ?? 0}")
          .then((response) {
            if (response is DataSuccess) {
              dataState = DataSuccess(
                data: ChatEntity.fromJson(response.data?.data?['data']),
              );
              return dataState;
            } else if (response is UnauthenticatedDataState) {
              dataState = UnauthenticatedDataState(
                error: response.error ?? "Error",
              );
              return dataState;
            } else if (response is DataError) {
              dataState = DataError(error: response.error ?? "Error");
              return dataState;
            } else {
              dataState = DataFailed(error: "Something went wrong");
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
  Future<DataState<List<ChatsEntity?>?>?> getChats(ChatModel? chatModel) async {
    ConnectivityResult? connectivityResult;
    DataState<List<ChatsEntity?>?>? dataState;
    await checkConnectivity.checkConnectivity().then((value) {
      connectivityResult = value.last;
    });
    if (connectivityResult == ConnectivityResult.none) {
      dataState = NOInternetDataState();
      return dataState;
    }
    CommonService commonService = CommonService(
      headers: {
        "Accept-Language": chatModel?.acceptLanguage ?? "",
        "Authorization": "Bearer ${chatModel?.authToken ?? ""}",
        "accept": "application/json",
      },
    );
    try {
      await commonService.get(ApiConstant.chatEndpoint).then((response) {
        if (response is DataSuccess) {
          dataState = DataSuccess(
            data: (response.data?.data['data'] as List)
                .map((e) => ChatsEntity.fromJson(e))
                .toList(),
          );
          return dataState;
        } else if (response is UnauthenticatedDataState) {
          dataState = UnauthenticatedDataState(
            error: response.error ?? "Error",
          );
          return dataState;
        } else if (response is DataError) {
          dataState = DataError(error: response.error ?? "Error");
          return dataState;
        } else {
          dataState = DataFailed(
            error: response.error ?? "Something went wrong",
          );
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
  Future<DataState<MessageEntity?>?> sendMessage(ChatModel? chatModel) async {
    ConnectivityResult? connectivityResult;
    DataState<MessageEntity?>? dataState;
    await checkConnectivity.checkConnectivity().then((value) {
      connectivityResult = value.last;
    });
    if (connectivityResult == ConnectivityResult.none) {
      dataState = NOInternetDataState();
      return dataState;
    }
    try {
      final dataForm = FormData();
      dataForm.fields.add(
        MapEntry('conversation_id', chatModel?.id.toString() ?? '0'),
      );
      dataForm.fields.add(MapEntry('message_type', "image"));
      if (chatModel?.content != null && chatModel!.content!.isNotEmpty) {
        dataForm.fields.add(MapEntry('content', chatModel.content ?? ''));
      }
      if (chatModel?.file != null) {
        dataForm.files.add(
          MapEntry(
            'file',
            await MultipartFile.fromFile(
              chatModel!.file!.path,
              filename: chatModel.file!.path.split('/').last,
            ),
          ),
        );
      }
      print("api headers: ${chatModel?.authToken}");
      CommonService commonService = CommonService(
        headers: {"Authorization": "Bearer ${chatModel?.authToken ?? ""}"},
      );
      print(
        "SendMessage Request: ${{"conversation_id": chatModel?.id, "message_type": "text", "content": chatModel?.content}}",
      );
      await commonService
          .post(
            ApiConstant.sendMessageEndpoint,
            data: chatModel?.file != null
                ? dataForm
                : {
                    "conversation_id": chatModel?.id ?? 0,
                    "message_type": "text",
                    "content": chatModel?.content,
                  },
          )
          .then((response) {
            if (response is DataSuccess) {
              dataState = DataSuccess(
                data: MessageEntity.fromJson(response.data?.data['data']),
              );
              return dataState;
            } else if (response is UnauthenticatedDataState) {
              dataState = UnauthenticatedDataState(
                error: response.error ?? "Error",
              );
              return dataState;
            } else if (response is DataError) {
              dataState = DataError(error: response.error ?? "Error");
              return dataState;
            } else {
              dataState = DataFailed(
                error: response.error ?? "Something went wrong",
              );
              print("SendMessage Error: ${dataState?.error}");
              return dataState;
            }
          });
    } catch (e) {
      dataState = DataFailed(error: e.toString());
      return dataState;
    }
    print("SendMessage DataState: $dataState");
    return dataState;
  }
}
