// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'issue.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$IssueImpl _$$IssueImplFromJson(Map<String, dynamic> json) => _$IssueImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      url: json['html_url'] as String,
    );

Map<String, dynamic> _$$IssueImplToJson(_$IssueImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'html_url': instance.url,
    };
