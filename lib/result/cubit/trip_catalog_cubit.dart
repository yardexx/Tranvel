import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:trainvel/result/models/models.dart';

part 'trip_catalog_state.dart';

class TripCatalogCubit extends Cubit<TripState> {
  TripCatalogCubit() : super(const TripState());

  Future<void> fetchCatalog(
      String start, String destination, DateTime date) async {
    emit(state.copyWith(status: TripStatus.loading));

    // TODO: Hardcoded values
    final catalog = Trip(
      start: start,
      destination: destination,
      trains: List.generate(
        15,
        (_) => Train(
            delay: 32,
            carrier: const Carrier(
              fullName: 'České Dráhy',
              shortName: 'ČD',
            ),
            journeyDate: DateTime.now().subtract(
              const Duration(days: 1),
            ),
            journey: [
              Location(
                name: 'Brno hl. n.',
                departure: DateTime.now(),
                arrival: DateTime.now(),
              ),
              Location(
                name: 'Ostrava-Svinov',
                departure: DateTime.now(),
                arrival: DateTime.now(),
              ),
              Location(
                name: 'Žilina',
                departure: DateTime.now(),
                arrival: DateTime.now().add(const Duration(hours: 3)),
              )
            ],
            name: 'Brnenský drak',
            number: 421),
      ),
    );

    await Future.delayed(const Duration(seconds: 3));

    emit(
      state.copyWith(
        status: TripStatus.success,
        trip: catalog,
      ),
    );
  }
}
