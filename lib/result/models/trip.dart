import 'package:equatable/equatable.dart';
import 'package:trainvel/result/models/models.dart';

class Trip extends Equatable {
  final String start;
  final String destination;
  final List<Train> trains;

  const Trip({
    required this.start,
    required this.destination,
    required this.trains,
  });

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
