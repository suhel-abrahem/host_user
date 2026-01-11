import 'package:hosta_user/core/data_state/data_state.dart';
import 'package:hosta_user/features/profile_page/domain/entities/help/tickets_entity.dart';

import '../../../data/models/help/create_ticket_model.dart';
import '../../../data/models/help/get_tickets_model.dart';

abstract class TicketsRepository {
  Future<DataState<List<TicketsEntity?>?>?> getTickets(GetTicketsModel? model);
  Future<DataState<TicketsEntity?>?> createTicket(CreateTicketModel? model);
}
