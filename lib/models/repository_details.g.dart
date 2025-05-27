// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repository_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RepositoryDetailsImpl _$$RepositoryDetailsImplFromJson(
        Map<String, dynamic> json) =>
    _$RepositoryDetailsImpl(
      name: json['name'] as String,
      description: json['description'] as String,
      stars: (json['stargazers_count'] as num).toInt(),
      forks: (json['forks_count'] as num).toInt(),
      url: json['html_url'] as String,
      avatarUrl: json['avatar_url'] as String?,
      owner: json['owner'] == null
          ? null
          : Owner.fromJson(json['owner'] as Map<String, dynamic>),
      language: json['language'] as String,
    );

Map<String, dynamic> _$$RepositoryDetailsImplToJson(
        _$RepositoryDetailsImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'stargazers_count': instance.stars,
      'forks_count': instance.forks,
      'html_url': instance.url,
      'avatar_url': instance.avatarUrl,
      'owner': instance.owner,
      'language': instance.language,
    };
