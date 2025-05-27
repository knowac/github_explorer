// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pull_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PullRequestImpl _$$PullRequestImplFromJson(Map<String, dynamic> json) =>
    _$PullRequestImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      url: json['html_url'] as String,
    );

Map<String, dynamic> _$$PullRequestImplToJson(_$PullRequestImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'html_url': instance.url,
    };
