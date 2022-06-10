import 'package:fake_train_api/src/models/models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'train.g.dart';

enum TrainCategory {
  @JsonValue('Os')
  train('Os'),
  @JsonValue('R')
  fastTrain('R'),
  @JsonValue('Ex')
  express('Ex'),
  @JsonValue('REx')
  regionalExpress('REx'),
  @JsonValue('rj')
  railjet('rj'),
  @JsonValue('IC')
  interCity('IC'),
  @JsonValue('ICE')
  interCityExpress('ICE'),
  @JsonValue('EC')
  euroCity('EC'),
  @JsonValue('SC')
  superCity('SC');

  final String shortcut;
  // ignore: sort_constructors_first
  const TrainCategory(this.shortcut);
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
