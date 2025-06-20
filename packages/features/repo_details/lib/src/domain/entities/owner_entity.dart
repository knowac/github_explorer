import 'package:freezed_annotation/freezed_annotation.dart';

part 'owner_entity.freezed.dart';
part 'owner_entity.g.dart';

@freezed
abstract class OwnerEntity with _$OwnerEntity {
  const factory OwnerEntity({
    required int id,
    required String login,
    @JsonKey(name: 'avatar_url') required String avatarUrl,
  }) = _OwnerEntity;

  factory OwnerEntity.fromJson(Map<String, dynamic> json) =>
      _$OwnerEntityFromJson(json);
}
