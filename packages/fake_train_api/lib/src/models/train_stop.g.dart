// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter, cast_nullable_to_non_nullable

part of 'train_stop.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrainStop _$TrainStopFromJson(Map<String, dynamic> json) => $checkedCreate(
      'TrainStop',
      json,
      ($checkedConvert) {
        final val = TrainStop(
          arrival: $checkedConvert('arrival',
              (v) => const DateTimeEpochConverter().fromJson(v as int),),
          departure: $checkedConvert('departure',
              (v) => const DateTimeEpochConverter().fromJson(v as int),),
          name: $checkedConvert('name', (v) => v as String),
        );
        return val;
      },
    );

Map<String, dynamic> _$TrainStopToJson(TrainStop instance) => <String, dynamic>{
      'name': instance.name,
      'arrival': const DateTimeEpochConverter().toJson(instance.arrival),
      'departure': const DateTimeEpochConverter().toJson(instance.departure),
    };
