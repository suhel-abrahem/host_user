import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosta_user/core/constants/font_constants.dart';
import 'package:hosta_user/core/dependencies_injection.dart';
import 'package:hosta_user/core/resource/common_state_widget/error_state_widget.dart';
import 'package:hosta_user/core/resource/common_state_widget/no_internet_state_widget.dart';
import 'package:hosta_user/core/resource/common_state_widget/unAuth_state_widget.dart';
import 'package:hosta_user/core/resource/main_page/main_page.dart';
import 'package:hosta_user/core/resource/socketio_service.dart/home_socket_initializer.dart';
import 'package:hosta_user/features/chat/data/models/chat_model.dart';
import 'package:hosta_user/features/chat/presentation/bloc/get_chat_bloc.dart';
import 'package:hosta_user/features/chat/presentation/widgets/send_message_field.dart';
import 'package:hosta_user/generated/locale_keys.g.dart';

import '../../../../core/resource/rst_stream/rst_stream.dart';
import '../../domain/entities/message/message_entity.dart';
import '../widgets/message_container.dart';

class ChatPage extends StatefulWidget {
  final String? bookingNumber;
  final int? chatId;
  const ChatPage({super.key, this.bookingNumber, this.chatId});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<MessageEntity?>? chatMesages;
  ScrollController scrollController = ScrollController(keepScrollOffset: true);
  @override
  void initState() {
    chatMesages = [];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MainPage(
      title: widget.bookingNumber,
      body: Column(
        children: [
          Expanded(
            child: BlocProvider<GetChatBloc>(
              create: (context) => getItInstance<GetChatBloc>()
                ..add(
                  GetChatEvent.getChatDetails(
                    chatModel: ChatModel(id: widget.chatId),
                  ),
                ),
              child: BlocListener<GetChatBloc, GetChatState>(
                listener: (context, state) {
                  if (state is GetChatStateGetChatDetailsLoaded) {
                    state.chatEntity?.messages?.forEach((element) {
                      if (!(chatMesages?.any(
                            (msg) => msg?.id == element["id"],
                          ) ??
                          false)) {
                        chatMesages?.add(MessageEntity.fromJson(element));
                      }
                    });
                    scrollController.jumpTo(
                      chatMesages != null ? chatMesages!.length * 260.h : 0,
                    );
                  }
                },
                child: BlocBuilder<GetChatBloc, GetChatState>(
                  builder: (context, state) {
                    return state.when(
                      initial: () => Center(child: CircularProgressIndicator()),
                      loading: () => Center(child: CircularProgressIndicator()),
                      getChatStateLoaded: (data) => Center(
                        child: ErrorStateWidget(
                          lottieHeight: 200.h,
                          lottieWidth: 200.w,
                        ),
                      ),
                      getChatDetailsLoaded: (data) => StreamBuilder(
                        stream: chatMessageStreamSocket.stream,
                        builder: (context, asyncSnapshot) {
                          print('New message received: ${asyncSnapshot.data}');
                          chatMesages?.contains(asyncSnapshot.data) == true
                              ? null
                              : chatMesages?.add(asyncSnapshot.data);

                          return ListView.builder(
                            shrinkWrap: true,
                            controller: scrollController,
                            itemCount: chatMesages?.length ?? 0,
                            itemBuilder: (context, index) => MessageContainer(
                              onMessageSent: (value) {
                                setState(() {
                                  chatMesages?[index] = value;
                                });
                              },
                              messageEntity: chatMesages?[index],
                              chatId: widget.chatId,
                            ),
                          );
                        },
                      ),
                      error: (e) => Center(
                        child: ErrorStateWidget(
                          lottieHeight: 200.h,
                          lottieWidth: 200.w,
                        ),
                      ),
                      unAuthenticated: () => Center(
                        child: UnauthStateWidget(
                          lottieHeight: 200.h,
                          lottieWidth: 200.w,
                        ),
                      ),
                      noInternet: () => Center(
                        child: NoInternetStateWidget(
                          lottieHeight: 200.h,
                          lottieWidth: 200.w,
                        ),
                      ),
                      noChats: () => Center(
                        child: Text(
                          LocaleKeys.chatsPage_noChatsAvailable.tr(),
                          style: Theme.of(context).textTheme.labelLarge
                              ?.copyWith(
                                fontFamily: FontConstants.fontFamily(
                                  context.locale,
                                ),
                              ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
            child: SendMessageField(
              chatId: widget.chatId,
              onSend: (value) {
                setState(() {
                  chatMesages?.add(value);
                });
                scrollController.jumpTo(
                  chatMesages != null ? chatMesages!.length * 260.h : 0,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
