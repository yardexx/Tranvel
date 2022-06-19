// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ticket _$TicketFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Ticket',
      json,
      ($checkedConvert) {
        final val = Ticket(
          id: $checkedConvert('id', (v) => v as int),
          train: $checkedConvert(
              'train', (v) => Train.fromJson(v as Map<String, dynamic>)),
          price: $checkedConvert('price', (v) => (v as num).toDouble()),
        );
        return val;
      },
    );

Map<String, dynamic> _$TicketToJson(Ticket instance) => <String, dynamic>{
      'id': instance.id,
      'train': instance.train.toJson(),
      'price': instance.price,
    };
