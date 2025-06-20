// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'owner_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OwnerEntity _$OwnerEntityFromJson(Map<String, dynamic> json) => _OwnerEntity(
      id: (json['id'] as num).toInt(),
      login: json['login'] as String,
      avatarUrl: json['avatar_url'] as String,
    );

Map<String, dynamic> _$OwnerEntityToJson(_OwnerEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'login': instance.login,
      'avatar_url': instance.avatarUrl,
    };
