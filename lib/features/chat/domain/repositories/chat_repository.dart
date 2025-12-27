import 'package:hosta_user/core/data_state/data_state.dart';
import 'package:hosta_user/features/chat/data/models/chat_model.dart';
import 'package:hosta_user/features/chat/domain/entities/chats/chats_entity.dart';
import 'package:hosta_user/features/chat/domain/entities/message/message_entity.dart';

import '../entities/chat/chat_entity.dart';

abstract class ChatRepository {
  Future<DataState<List<ChatsEntity?>?>?> getChats(ChatModel? chatModel);
  Future<DataState<ChatEntity?>?> getChatDetails(ChatModel? chatModel);
  Future<DataState<MessageEntity?>?> sendMessage(ChatModel? chatModel);
}
