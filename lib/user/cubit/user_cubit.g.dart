// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserState _$UserStateFromJson(Map<String, dynamic> json) => $checkedCreate(
      'UserState',
      json,
      ($checkedConvert) {
        final val = UserState(
          status: $checkedConvert(
              'status',
              (v) =>
                  $enumDecodeNullable(_$UserStatusEnumMap, v) ??
                  UserStatus.guest),
          user: $checkedConvert(
              'user',
              (v) =>
                  v == null ? null : User.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
    );

Map<String, dynamic> _$UserStateToJson(UserState instance) => <String, dynamic>{
      'status': _$UserStatusEnumMap[instance.status],
      'user': instance.user.toJson(),
    };

const _$UserStatusEnumMap = {
  UserStatus.guest: 'guest',
  UserStatus.user: 'user',
  UserStatus.admin: 'admin',
};
