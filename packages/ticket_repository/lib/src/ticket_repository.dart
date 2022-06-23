import 'package:tickets_api/tickets_api.dart';

class TicketsRepository {
  TicketsRepository({
    final TicketsApi? ticketsApi,
    required TicketDatabase database,
  }) : _ticketsApi = ticketsApi ?? TicketsApi(database: database);

  final TicketsApi _ticketsApi;

  Future<List<Ticket>> getAllTickets() => _ticketsApi.getTickets();

  Future<void> addTicket(Ticket ticket) => _ticketsApi.addTicket(ticket);

  Future<void> deleteAllTickets() => _ticketsApi.deleteAllTickets();
}
