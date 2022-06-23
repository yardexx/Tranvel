import 'package:floor/floor.dart';
import 'package:tickets_api/src/models/models.dart';

@dao
abstract class TicketDao {

  @Query('SELECT * FROM ticket')
  Future<List<Ticket>> getAllTickets();

  @insert
  Future<void> addTicket(Ticket ticket);

  @Query('DELETE FROM ticket')
  Future<void> deleteAllTickets();
}
