import 'package:ticket_repository/ticket_repository.dart';
import 'package:tickets_api/tickets_api.dart';

class TicketsRepository {
  final TicketsApi _ticketsApi;

  TicketsRepository(
      {final TicketsApi? ticketsApi, required TicketDatabase database})
      : _ticketsApi = ticketsApi ?? TicketsApi(database: database);

  Future<List<Ticket>> getAllTickets() => _ticketsApi.getTickets();

  Future<void> addTicket(Ticket ticket) => _ticketsApi.addTicket(ticket);

  Future<void> deleteAllTickets() => _ticketsApi.deleteAllTickets();
}
