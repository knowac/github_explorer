import 'package:freezed_annotation/freezed_annotation.dart';

part 'pull_request_entity.freezed.dart';
part 'pull_request_entity.g.dart';

@freezed
abstract class PullRequestEntity with _$PullRequestEntity {
  const factory PullRequestEntity({
    required int id,
    required String title,
    @JsonKey(name: 'html_url') required String url,
  }) = _PullRequestEntity;

  factory PullRequestEntity.fromJson(Map<String, dynamic> json) =>
      _$PullRequestEntityFromJson(json);
}
