import 'package:freezed_annotation/freezed_annotation.dart';

part 'issue_entity.freezed.dart';
part 'issue_entity.g.dart';

@freezed
abstract class IssueEntity with _$IssueEntity {
  const factory IssueEntity({
    required int id,
    required String title,
    @JsonKey(name: 'html_url') required String url,
  }) = _IssueEntity;

  factory IssueEntity.fromJson(Map<String, dynamic> json) =>
      _$IssueEntityFromJson(json);
}
