import 'package:json_annotation/json_annotation.dart';
import 'package:trainvel/result/models/models.dart';

part 'train.g.dart';

@JsonSerializable()
class Train {
  const Train({
    required this.id,
    required this.number,
    required this.carrier,
    required this.journeyDate,
    required this.journey,
    required this.delay,
    required this.category,
    this.name,
  });

  factory Train.fromJson(Map<String, dynamic> json) =>
      _$TrainFromJson(json);

  Map<String, dynamic> toJson() => _$TrainToJson(this);

  final String id;
  final int number;
  final String? name;
  final Carrier carrier;
  final DateTime journeyDate;
  final List<Location> journey;
  final String category;
  final int delay;

  DateTime journeyLength(DateTime departure, DateTime arrival) {
    return DateTime.fromMillisecondsSinceEpoch(
      departure.millisecondsSinceEpoch - arrival.millisecondsSinceEpoch,
    );
  }
}
