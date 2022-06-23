// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'train.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Train _$TrainFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Train',
      json,
      ($checkedConvert) {
        final val = Train(
          id: $checkedConvert('id', (v) => v as String),
          number: $checkedConvert('number', (v) => v as int),
          carrier: $checkedConvert(
              'carrier', (v) => Carrier.fromJson(v as Map<String, dynamic>)),
          journeyDate: $checkedConvert(
              'journey_date', (v) => DateTime.parse(v as String)),
          journey: $checkedConvert(
              'journey',
              (v) => (v as List<dynamic>)
                  .map((e) => Location.fromJson(e as Map<String, dynamic>))
                  .toList()),
          delay: $checkedConvert('delay', (v) => v as int),
          category: $checkedConvert('category', (v) => v as String),
          name: $checkedConvert('name', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {'journeyDate': 'journey_date'},
    );

Map<String, dynamic> _$TrainToJson(Train instance) => <String, dynamic>{
      'id': instance.id,
      'number': instance.number,
      'name': instance.name,
      'carrier': instance.carrier.toJson(),
      'journey_date': instance.journeyDate.toIso8601String(),
      'journey': instance.journey.map((e) => e.toJson()).toList(),
      'category': instance.category,
      'delay': instance.delay,
    };
