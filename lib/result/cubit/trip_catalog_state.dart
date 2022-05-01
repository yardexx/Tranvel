part of 'trip_catalog_cubit.dart';

enum TripStatus { initial, loading, success, failure }

class TripState extends Equatable {
  const TripState({
    this.status = TripStatus.initial,
    Trip? trip,
  }) : trip = trip ?? Trip.empty;

  final TripStatus status;
  final Trip trip;

  TripState copyWith({
    TripStatus? status,
    Trip? trip,
  }) {
    return TripState(
      status: status ?? this.status,
      trip: trip ?? this.trip,
    );
  }

  @override
  List<Object?> get props => [status, trip];
}
