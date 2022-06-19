import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:trainvel/ticket_catalog/models/catalog.dart';
import 'package:trainvel/ticket_catalog/models/ticket.dart';
import 'package:trainvel/ticket_repository.dart';

part 'catalog_state.dart';

part 'catalog_cubit.g.dart';

class CatalogCubit extends HydratedCubit<CatalogState> {
  CatalogCubit(this._ticketRepository) : super(const CatalogState()) {
    fetchCatalog();
  }

  final TicketRepository _ticketRepository;

  Future<void> addTicket(Ticket ticket) async {
    _ticketRepository.addTicketToCatalog(ticket);
    await fetchCatalog();
  }

  Future<void> fetchCatalog() async {
    emit(state.copyWith(status: CatalogStatus.loading));

    try {
      final catalog = await _ticketRepository.loadTickets;
      emit(
        state.copyWith(
          status: CatalogStatus.success,
          catalog: Catalog(tickets: catalog),
        ),
      );
    } catch (_) {
      emit(state.copyWith(status: CatalogStatus.failure));
    }
  }

  @override
  CatalogState? fromJson(Map<String, dynamic> json) =>
      CatalogState.fromJson(json);

  @override
  Map<String, dynamic>? toJson(CatalogState state) => state.toJson();
}
