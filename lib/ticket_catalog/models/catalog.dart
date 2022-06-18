import 'package:equatable/equatable.dart';
import 'package:trainvel/ticket_catalog/models/ticket.dart';

class Catalog extends Equatable {
  const Catalog({required this.tickets});

  final List<Ticket> tickets;

  Ticket getActive() => tickets.firstWhere(
        (ticket) =>
            ticket.train.journey.last.arrival.millisecondsSinceEpoch <
            DateTime.now().millisecondsSinceEpoch,
      );

  @override
  List<Object?> get props => [tickets];
}
