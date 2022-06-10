// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter, cast_nullable_to_non_nullable

part of 'carrier.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Carrier _$CarrierFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Carrier',
      json,
      ($checkedConvert) {
        final val = Carrier(
          fullName: $checkedConvert('full_name', (v) => v as String),
          shortName: $checkedConvert('short_name', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {'fullName': 'full_name', 'shortName': 'short_name'},
    );

Map<String, dynamic> _$CarrierToJson(Carrier instance) => <String, dynamic>{
      'full_name': instance.fullName,
      'short_name': instance.shortName,
    };
