import 'package:json_annotation/json_annotation.dart';

part 'carrier.g.dart';

@JsonSerializable()
class Carrier {

  const Carrier({
    required this.fullName,
    required this.shortName,
    required this.url,
  });

  factory Carrier.fromJson(final Map<String, dynamic> json) =>
      _$CarrierFromJson(json);

  final String fullName;
  final String shortName;
  final String url;

  Map<String, dynamic> toJson() => _$CarrierToJson(this);

}
