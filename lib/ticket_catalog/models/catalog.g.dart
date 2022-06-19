// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catalog.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Catalog _$CatalogFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Catalog',
      json,
      ($checkedConvert) {
        final val = Catalog(
          tickets: $checkedConvert(
              'tickets',
              (v) => (v as List<dynamic>)
                  .map((e) => Ticket.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
    );

Map<String, dynamic> _$CatalogToJson(Catalog instance) => <String, dynamic>{
      'tickets': instance.tickets.map((e) => e.toJson()).toList(),
    };
