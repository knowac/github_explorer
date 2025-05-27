import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:github_explorer/models/owner.dart';

part 'repository_details.freezed.dart';
part 'repository_details.g.dart';

@freezed
class RepositoryDetails with _$RepositoryDetails {
  const factory RepositoryDetails({
    required String name,
    required String description,
    @JsonKey(name: 'stargazers_count') required int stars,
    @JsonKey(name: 'forks_count') required int forks,
    @JsonKey(name: 'html_url') required String url,
    @JsonKey(name: 'avatar_url') required String? avatarUrl,
    required Owner? owner,
    required String language,
  }) = _RepositoryDetails;

  factory RepositoryDetails.fromJson(Map<String, dynamic> json) =>
      _$RepositoryDetailsFromJson(json);
}
