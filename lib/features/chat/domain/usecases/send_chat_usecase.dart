import '../../../../core/data_state/data_state.dart';
import '../../../../core/usecase/usecase.dart';
import '../../data/models/chat_model.dart';
import '../repositories/chat_repository.dart';

class SendChatUsecase implements UseCase<DataState<void>?, ChatModel> {
  final ChatRepository chatRepository;
  SendChatUsecase(this.chatRepository);
  @override
  Future<DataState<void>?> call({ChatModel? params}) async {
    return await chatRepository.sendMessage(params);
  }
}
