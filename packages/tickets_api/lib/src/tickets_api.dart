import 'package:tickets_api/src/database/database.dart';
import 'package:tickets_api/src/models/models.dart';

class TicketsRequestFailure implements Exception {}

class TicketNotFoundFailure implements Exception {}

class TicketsApi {
  TicketsApi({required this.database});

  final TicketDatabase database;

  Future<List<Ticket>> getTickets() {
    return database.ticketDao.getAllTickets();
  }

  Future<void> addTicket(Ticket ticket) {
    return database.ticketDao.addTicket(ticket);
  }

  Future<void> deleteAllTickets() {
    return database.ticketDao.deleteAllTickets();
  }
}
