part of 'ticket_catalog_cubit.dart';

enum TicketCatalogStatus { initial, loading, success, failure }

class TicketCatalogState extends Equatable {
  const TicketCatalogState({
    this.status = TicketCatalogStatus.initial,
    List<Ticket>? tickets,
  }) : tickets = tickets ?? const <Ticket>[];

  final TicketCatalogStatus status;
  final List<Ticket> tickets;

  TicketCatalogState copyWith({
    TicketCatalogStatus? status,
    List<Ticket>? tickets,
  }) {
    return TicketCatalogState(
      status: status ?? this.status,
      tickets: tickets ?? this.tickets,
    );
  }

  @override
  List<Object?> get props => [status, tickets];
}
