// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pull_request_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PullRequestEntity _$PullRequestEntityFromJson(Map<String, dynamic> json) =>
    _PullRequestEntity(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      url: json['html_url'] as String,
    );

Map<String, dynamic> _$PullRequestEntityToJson(_PullRequestEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'html_url': instance.url,
    };
