// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catalog_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CatalogState _$CatalogStateFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'CatalogState',
      json,
      ($checkedConvert) {
        final val = CatalogState(
          status: $checkedConvert(
              'status',
              (v) =>
                  $enumDecodeNullable(_$CatalogStatusEnumMap, v) ??
                  CatalogStatus.initial),
          catalog: $checkedConvert(
              'catalog',
              (v) => v == null
                  ? null
                  : Catalog.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
    );

Map<String, dynamic> _$CatalogStateToJson(CatalogState instance) =>
    <String, dynamic>{
      'status': _$CatalogStatusEnumMap[instance.status],
      'catalog': instance.catalog.toJson(),
    };

const _$CatalogStatusEnumMap = {
  CatalogStatus.initial: 'initial',
  CatalogStatus.loading: 'loading',
  CatalogStatus.success: 'success',
  CatalogStatus.failure: 'failure',
};
