// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Location _$LocationFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Location',
      json,
      ($checkedConvert) {
        final val = Location(
          arrival:
              $checkedConvert('arrival', (v) => DateTime.parse(v as String)),
          departure:
              $checkedConvert('departure', (v) => DateTime.parse(v as String)),
          name: $checkedConvert('name', (v) => v as String),
        );
        return val;
      },
    );

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'name': instance.name,
      'arrival': instance.arrival.toIso8601String(),
      'departure': instance.departure.toIso8601String(),
    };
