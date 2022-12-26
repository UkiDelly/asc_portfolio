// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TokenModel _$$_TokenModelFromJson(Map<String, dynamic> json) =>
    _$_TokenModel(
      roleType: $enumDecode(_$RoleTypeEnumMap, json['roleType']),
      accessToken: json['accessToken'] as String,
    );

Map<String, dynamic> _$$_TokenModelToJson(_$_TokenModel instance) =>
    <String, dynamic>{
      'roleType': _$RoleTypeEnumMap[instance.roleType]!,
      'accessToken': instance.accessToken,
    };

const _$RoleTypeEnumMap = {
  RoleType.user: 'USER',
  RoleType.admin: 'ADMIN',
  RoleType.none: 'none',
};
