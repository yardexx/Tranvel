import 'package:fake_train_api/src/models/models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'delay.g.dart';

@JsonSerializable()
class Delay {

  const Delay({
    required this.delay,
    required this.wasExpected,
  });

  factory Delay.fromJson(final Map<String, dynamic> json) =>
      _$DelayFromJson(json);
  @DateTimeEpochConverter()
  final int delay;
  final bool wasExpected;

  Map<String, dynamic> toJson() => _$DelayToJson(this);

}
