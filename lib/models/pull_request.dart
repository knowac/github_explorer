import 'package:freezed_annotation/freezed_annotation.dart';

part 'pull_request.freezed.dart';
part 'pull_request.g.dart';

@freezed
class PullRequest with _$PullRequest {
  const factory PullRequest({
    required int id,
    required String title,
    @JsonKey(name: 'html_url') required String url,
  }) = _PullRequest;

  factory PullRequest.fromJson(Map<String, dynamic> json) =>
      _$PullRequestFromJson(json);
}
