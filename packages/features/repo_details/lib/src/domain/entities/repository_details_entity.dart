import 'package:freezed_annotation/freezed_annotation.dart';

import 'owner_entity.dart';

part 'repository_details_entity.freezed.dart';
part 'repository_details_entity.g.dart';

@freezed
abstract class RepositoryDetailsEntity with _$RepositoryDetailsEntity {
  const factory RepositoryDetailsEntity({
    required String name,
    required String description,
    @JsonKey(name: 'stargazers_count') required int stars,
    @JsonKey(name: 'forks_count') required int forks,
    @JsonKey(name: 'html_url') required String url,
    @JsonKey(name: 'avatar_url') required String? avatarUrl,
    required OwnerEntity? owner,
    required String language,
  }) = _RepositoryDetailsEntity;

  factory RepositoryDetailsEntity.fromJson(Map<String, dynamic> json) =>
      _$RepositoryDetailsEntityFromJson(json);
}
