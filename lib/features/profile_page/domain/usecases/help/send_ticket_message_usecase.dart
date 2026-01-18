import 'package:hosta_user/core/data_state/data_state.dart';
import 'package:hosta_user/core/usecase/usecase.dart';
import 'package:hosta_user/features/chat/domain/entities/message/message_entity.dart';
import 'package:hosta_user/features/profile_page/domain/repositories/help/tickets_repository.dart';

import '../../../data/models/help/send_ticket_message_model.dart';

class SendTicketMessageUsecase
    implements UseCase<DataState<MessageEntity?>?, SendTicketMessageModel?> {
  final TicketsRepository _repository;
  SendTicketMessageUsecase(this._repository);
  @override
  Future<DataState<MessageEntity?>?> call({
    SendTicketMessageModel? params,
  }) async {
    return await _repository.sendTicketMessage(params);
  }
}
