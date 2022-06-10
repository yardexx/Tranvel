import 'package:equatable/equatable.dart';
import 'package:fake_train_api/fake_train_api.dart';
import 'package:json_annotation/json_annotation.dart';

part 'trip.g.dart';

@JsonSerializable()
class Trip extends Equatable {

  const Trip({
    required this.start,
    required this.destination,
    required this.trains,
  });

  factory Trip.fromJson(final Map<String, dynamic> json) =>
      _$TripFromJson(json);
  final String start;
  final String destination;
  final List<Train> trains;

  Map<String, dynamic> toJson() => _$TripToJson(this);

  @override
  List<Object?> get props => [start, destination, trains];
}
