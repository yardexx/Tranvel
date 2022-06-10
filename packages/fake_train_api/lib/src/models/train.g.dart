// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter, cast_nullable_to_non_nullable

part of 'train.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Train _$TrainFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Train',
      json,
      ($checkedConvert) {
        final val = Train(
          number: $checkedConvert('number', (v) => v as int),
          trainCategory: $checkedConvert(
              'train_category', (v) => $enumDecode(_$TrainCategoryEnumMap, v),),
          carrier: $checkedConvert(
              'carrier', (v) => Carrier.fromJson(v as Map<String, dynamic>),),
          journeyDate: $checkedConvert('journey_date',
              (v) => const DateTimeEpochConverter().fromJson(v as int),),
          journey: $checkedConvert(
              'journey',
              (v) => (v as List<dynamic>)
                  .map((e) => TrainStop.fromJson(e as Map<String, dynamic>))
                  .toList(),),
          delay: $checkedConvert(
              'delay', (v) => Delay.fromJson(v as Map<String, dynamic>),),
          name: $checkedConvert('name', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'trainCategory': 'train_category',
        'journeyDate': 'journey_date'
      },
    );

Map<String, dynamic> _$TrainToJson(Train instance) => <String, dynamic>{
      'number': instance.number,
      'name': instance.name,
      'train_category': _$TrainCategoryEnumMap[instance.trainCategory],
      'carrier': instance.carrier.toJson(),
      'journey_date':
          const DateTimeEpochConverter().toJson(instance.journeyDate),
      'journey': instance.journey.map((e) => e.toJson()).toList(),
      'delay': instance.delay.toJson(),
    };

const _$TrainCategoryEnumMap = {
  TrainCategory.train: 'Os',
  TrainCategory.fastTrain: 'R',
  TrainCategory.express: 'Ex',
  TrainCategory.regionalExpress: 'REx',
  TrainCategory.railjet: 'rj',
  TrainCategory.interCity: 'IC',
  TrainCategory.interCityExpress: 'ICE',
  TrainCategory.euroCity: 'EC',
  TrainCategory.superCity: 'SC',
};
