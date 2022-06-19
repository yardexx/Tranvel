import 'package:trainvel/ticket_catalog/models/ticket.dart';

const _delay = Duration(milliseconds: 800);

class TicketRepository {
  final _tickets = <Ticket>[];

  Future<List<Ticket>> get loadTickets => Future.delayed(
        _delay,
        () => _tickets,
      );

  void addTicketToCatalog(Ticket ticket) => Future.delayed(
        _delay,
        () => _tickets.add(ticket),
      );

  void removeTicketFromCatalog(Ticket ticket) => _tickets.remove(ticket);
}
