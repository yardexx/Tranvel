import 'package:fake_train_api/src/models/models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'train.g.dart';

enum TrainCategory {
  @JsonValue('Os')
  train,
  @JsonValue('R')
  fastTrain,
  @JsonValue('Ex')
  express,
  @JsonValue('REx')
  regionalExpress,
  @JsonValue('rj')
  railjet,
  @JsonValue('IC')
  interCity,
  @JsonValue('ICE')
  interCityExpress,
  @JsonValue('EC')
  euroCity,
  @JsonValue('SC')
  superCity,
}

@JsonSerializable(explicitToJson: true)
class Train {

  const Train({
    required this.number,
    required this.trainCategory,
    required this.carrier,
    required this.journeyDate,
    required this.journey,
    required this.delay,
    this.name,
  });

  factory Train.fromJson(final Map<String, dynamic> json) =>
      _$TrainFromJson(json);
  final int number;
  final String? name;
  final TrainCategory trainCategory;
  final Carrier carrier;
  @DateTimeEpochConverter()
  final DateTime journeyDate;
  final List<TrainStop> journey;
  final Delay delay;

  Map<String, dynamic> toJson() => _$TrainToJson(this);
}
