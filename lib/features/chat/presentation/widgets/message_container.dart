import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosta_user/core/constants/font_constants.dart';
import 'package:hosta_user/core/dependencies_injection.dart';
import 'package:hosta_user/core/resource/image_widget.dart';
import 'package:hosta_user/features/chat/data/models/chat_model.dart';
import 'package:hosta_user/features/chat/domain/entities/message/message_entity.dart';
import 'package:hosta_user/features/chat/presentation/bloc/send_chat_bloc.dart';

import '../../../../core/enums/uploading_state_enum.dart';

class MessageContainer extends StatefulWidget {
  final MessageEntity? messageEntity;
  final int? chatId;
  const MessageContainer({super.key, this.messageEntity, this.chatId});

  @override
  State<MessageContainer> createState() => _MessageContainerState();
}

class _MessageContainerState extends State<MessageContainer> {
  MessageEntity? messageEntity;
  ChatModel chatModel = ChatModel();
  @override
  void initState() {
    messageEntity = widget.messageEntity;
    chatModel = ChatModel(
      id: widget.chatId,
      content: widget.messageEntity?.content,
      attachments: widget.messageEntity?.files,
    );
    print("MessageEntity in initState: ${messageEntity?.files}");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SendChatBloc>(
      create: (context) => getItInstance<SendChatBloc>()
        ..add(
          messageEntity?.uploadingState == UploadingStateEnum.uploading
              ? SendChatEvent.sendChat(chatModel: chatModel)
              : SendChatEvent.started(),
        ),
      child: BlocListener<SendChatBloc, SendChatState>(
        listener: (context, state) {
          print("SendChatState: $state");
          if (state is SendChatStateLoading) {
            setState(() {
              messageEntity = messageEntity?.copyWith(
                uploadingState: UploadingStateEnum.uploading,
              );
            });
          } else if (state is SendChatStateSent) {
            setState(() {
              messageEntity = messageEntity?.copyWith(
                uploadingState: UploadingStateEnum.uploaded,
              );
            });
          } else if (state is SendChatStateError) {
            setState(() {
              messageEntity = messageEntity?.copyWith(
                uploadingState: UploadingStateEnum.failed,
              );
            });
          }
        },
        child: Align(
          alignment: widget.messageEntity?.me == true
              ? Alignment.centerRight
              : Alignment.centerLeft,
          child: Stack(
            children: [
              Container(
                padding: widget.messageEntity?.message_type == "image"
                    ? EdgeInsets.zero
                    : EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                margin: EdgeInsets.symmetric(vertical: 4.h, horizontal: 12.w),
                constraints: BoxConstraints(maxWidth: 260.w),
                decoration: BoxDecoration(
                  color: widget.messageEntity?.me == true
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: widget.messageEntity?.message_type == "image"
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child:
                            messageEntity?.uploadingState !=
                                UploadingStateEnum.uploaded
                            ? Image.file(
                                messageEntity?.files?.first ?? File(""),
                                height: 260.h,
                              )
                            : ImageWidget(
                                boxFit: BoxFit.cover,
                                height: 260.h,
                                imageUrl: widget.messageEntity?.content ?? '',
                              ),
                      )
                    : Text(
                        widget.messageEntity?.content ?? '',
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          fontFamily: FontConstants.fontFamily(context.locale),
                        ),
                      ),
              ),
              PositionedDirectional(
                top: 0,
                end: 10,
                child:
                    messageEntity?.uploadingState == UploadingStateEnum.failed
                    ? SizedBox(
                        width: 15.w,
                        height: 15.h,
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              messageEntity = messageEntity?.copyWith(
                                uploadingState: UploadingStateEnum.uploading,
                              );
                            });
                            context.read<SendChatBloc>().add(
                              SendChatEvent.sendChat(chatModel: chatModel),
                            );
                          },
                          icon: Icon(
                            Icons.refresh_outlined,
                            color: Theme.of(context).colorScheme.error,
                          ),
                        ),
                      )
                    : messageEntity?.uploadingState ==
                          UploadingStateEnum.uploading
                    ? SizedBox(
                        width: 10.w,
                        height: 10.h,
                        child: CircularProgressIndicator(),
                      )
                    : SizedBox.shrink(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
