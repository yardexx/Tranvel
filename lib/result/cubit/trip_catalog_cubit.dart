import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:train_repository/train_repository.dart' hide Trip;
import 'package:trainvel/result/models/trip.dart';

part 'trip_catalog_state.dart';

class TripCatalogCubit extends Cubit<TripState> {
  TripCatalogCubit(this._trainRepository) : super(const TripState());

  final TrainRepository _trainRepository;

  Future<void> fetchCatalog(
    String start,
    String destination,
    DateTime date,
  ) async {
    emit(state.copyWith(status: TripStatus.loading));
    final trip = Trip.fromRepository(
      await _trainRepository.getTrip(start, destination, date),
    );
    emit(
      state.copyWith(
        status: TripStatus.success,
        trip: trip.copyWith(
          trip.start,
          trip.destination,
          trip.trains,
        ),
      ),
    );
  }
}
