import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:trainvel/ticket_catalog/models/catalog.dart';
import 'package:trainvel/ticket_repository.dart';

part 'catalog_event.dart';

part 'catalog_state.dart';

class CatalogBloc extends Bloc<CatalogEvent, CatalogState> {
  CatalogBloc(this._ticketRepository) : super(CatalogLoading()) {
    on<CatalogStarted>(_onStarted);
  }

  final TicketRepository _ticketRepository;

  Future<void> _onStarted(
    CatalogStarted event,
    Emitter<CatalogState> emit,
  ) async {
    emit(CatalogLoading());
    try {
      final catalog = await _ticketRepository.loadTickets;
      emit(CatalogLoaded(Catalog(tickets: catalog)));
    } catch (_) {
      emit(CatalogError());
    }
  }
}
