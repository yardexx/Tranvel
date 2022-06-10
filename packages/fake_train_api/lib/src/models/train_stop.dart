import 'package:fake_train_api/src/models/models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'train_stop.g.dart';

@JsonSerializable()
class TrainStop {

  const TrainStop({
    required this.arrival,
    required this.departure,
    required this.name,
  });

  factory TrainStop.fromJson(final Map<String, dynamic> json) =>
      _$TrainStopFromJson(json);
  final String name;
  @DateTimeEpochConverter()
  final DateTime arrival;
  @DateTimeEpochConverter()
  final DateTime departure;

  Map<String, dynamic> toJson() => _$TrainStopToJson(this);

}
