// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => $checkedCreate(
      'User',
      json,
      ($checkedConvert) {
        final val = User(
          name: $checkedConvert('name', (v) => v as String),
          surname: $checkedConvert('surname', (v) => v as String),
          isAdmin: $checkedConvert('is_admin', (v) => v as bool? ?? false),
        );
        return val;
      },
      fieldKeyMap: const {'isAdmin': 'is_admin'},
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'name': instance.name,
      'surname': instance.surname,
      'is_admin': instance.isAdmin,
    };
