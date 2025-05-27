import 'package:freezed_annotation/freezed_annotation.dart';

part 'github_repository.freezed.dart';
part 'github_repository.g.dart';

@freezed
class GithubRepository with _$GithubRepository {
  const factory GithubRepository({
    required int id,
    required String name,
    @JsonKey(name: "full_name") required String fullName,
    String? description,
    @JsonKey(name: 'stargazers_count') required num? stargazersCount,
    String? language,
  }) = _GithubRepository;

  factory GithubRepository.fromJson(Map<String, dynamic> json) =>
      _$GithubRepositoryFromJson(json);
}
