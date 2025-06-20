import 'package:freezed_annotation/freezed_annotation.dart';

part 'github_repository_entity.freezed.dart';
part 'github_repository_entity.g.dart';

@freezed
abstract class GithubRepositoryEntity with _$GithubRepositoryEntity {
  const factory GithubRepositoryEntity({
    required int id,
    required String name,
    @JsonKey(name: "full_name") required String fullName,
    String? description,
    @JsonKey(name: 'stargazers_count') required num? stargazersCount,
    String? language,
  }) = _GithubRepositoryEntity;

  factory GithubRepositoryEntity.fromJson(Map<String, dynamic> json) =>
      _$GithubRepositoryEntityFromJson(json);
}
