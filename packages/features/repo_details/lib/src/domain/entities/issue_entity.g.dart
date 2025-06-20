// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'issue_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_IssueEntity _$IssueEntityFromJson(Map<String, dynamic> json) => _IssueEntity(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      url: json['html_url'] as String,
    );

Map<String, dynamic> _$IssueEntityToJson(_IssueEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'html_url': instance.url,
    };
