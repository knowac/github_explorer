// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_repository_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GithubRepositoryEntity _$GithubRepositoryEntityFromJson(
        Map<String, dynamic> json) =>
    _GithubRepositoryEntity(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      fullName: json['full_name'] as String,
      description: json['description'] as String?,
      stargazersCount: json['stargazers_count'] as num?,
      language: json['language'] as String?,
    );

Map<String, dynamic> _$GithubRepositoryEntityToJson(
        _GithubRepositoryEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'full_name': instance.fullName,
      'description': instance.description,
      'stargazers_count': instance.stargazersCount,
      'language': instance.language,
    };
