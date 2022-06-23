import 'package:equatable/equatable.dart';
import 'package:train_repository/train_repository.dart' as repository;
import 'package:trainvel/result/models/models.dart';

class Trip extends Equatable {
  const Trip({
    required this.start,
    required this.destination,
    required this.trains,
  });

  factory Trip.fromRepository(repository.Trip trip) {
    return Trip(
      start: trip.start,
      destination: trip.destination,
      trains: trip.trains
          .map(
            (element) => Train(
              id: element.id,
              number: element.number,
              name: element.name,
              delay: element.delay.delay,
              category: element.trainCategory.shortcut,
              carrier: Carrier(
                fullName: element.carrier.fullName,
                shortName: element.carrier.shortName,
                url: element.carrier.url,
              ),
              journey: element.journey
                  .map(
                    (element) => Location(
                      arrival: element.arrival,
                      departure: element.departure,
                      name: element.name,
                    ),
                  )
                  .toList(),
              journeyDate: element.journeyDate,
            ),
          )
          .toList(),
    );
  }

  final String start;
  final String destination;
  final List<Train> trains;

  static const empty = Trip(
    start: '',
    destination: '',
    trains: [],
  );

  Trip copyWith(
    String? start,
    String? destination,
    List<Train>? trains,
  ) {
    return Trip(
      start: start ?? this.start,
      destination: destination ?? this.destination,
      trains: trains ?? this.trains,
    );
  }

  @override
  List<Object?> get props => [start, destination, trains];
}
