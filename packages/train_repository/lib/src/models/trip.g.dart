// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'trip.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Trip _$TripFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Trip',
      json,
      ($checkedConvert) {
        final val = Trip(
          start: $checkedConvert('start', (v) => v as String),
          destination: $checkedConvert('destination', (v) => v as String),
          trains: $checkedConvert(
              'trains',
              (v) => (v as List<dynamic>)
                  .map((e) => Train.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
    );

Map<String, dynamic> _$TripToJson(Trip instance) => <String, dynamic>{
      'start': instance.start,
      'destination': instance.destination,
      'trains': instance.trains,
    };
