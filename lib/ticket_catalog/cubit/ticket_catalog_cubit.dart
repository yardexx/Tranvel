import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ticket_repository/ticket_repository.dart' as repository;
import 'package:trainvel/result/models/models.dart';
import 'package:trainvel/ticket_catalog/models/models.dart';

part 'ticket_catalog_state.dart';

class TicketCatalogCubit extends Cubit<TicketCatalogState> {
  TicketCatalogCubit(this._ticketsRepository)
      : super(
          const TicketCatalogState(),
        );

  final repository.TicketsRepository _ticketsRepository;

  Future<void> fetchAllTickets() async {
    emit(state.copyWith(status: TicketCatalogStatus.loading));

    try {
      final result = await _ticketsRepository.getAllTickets();
      final tickets = result.map(Ticket.fromRepository).toList();

      emit(
        state.copyWith(
          status: TicketCatalogStatus.success,
          tickets: tickets,
        ),
      );
    } on Exception {
      emit(state.copyWith(status: TicketCatalogStatus.failure));
    }
  }

  Future<void> saveTicket(Train train) async {
    try {
      await _ticketsRepository.addTicket(
        repository.Ticket(
          train: jsonEncode(train.toJson()),
          price: 12.3,
          date: DateTime.now().millisecondsSinceEpoch,
        ),
      );
      await fetchAllTickets();
    } on Exception {
      emit(state.copyWith(status: TicketCatalogStatus.failure));
    }
  }

  Ticket? getCurrentTicket() {
    try {
      return state.tickets.firstWhere(
        (ticket) =>
            ticket.train.journey.last.arrival.millisecondsSinceEpoch >=
            DateTime.now().millisecondsSinceEpoch,
      );
    } catch (_) {
      return null;
    }
  }
}
