// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter, cast_nullable_to_non_nullable

part of 'delay.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Delay _$DelayFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Delay',
      json,
      ($checkedConvert) {
        final val = Delay(
          delay: $checkedConvert('delay', (v) => v as int),
          wasExpected: $checkedConvert('was_expected', (v) => v as bool),
        );
        return val;
      },
      fieldKeyMap: const {'wasExpected': 'was_expected'},
    );

Map<String, dynamic> _$DelayToJson(Delay instance) => <String, dynamic>{
      'delay': instance.delay,
      'was_expected': instance.wasExpected,
    };
