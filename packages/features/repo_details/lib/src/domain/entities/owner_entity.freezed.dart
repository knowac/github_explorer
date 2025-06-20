// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'owner_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OwnerEntity {
  int get id;
  String get login;
  @JsonKey(name: 'avatar_url')
  String get avatarUrl;

  /// Create a copy of OwnerEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OwnerEntityCopyWith<OwnerEntity> get copyWith =>
      _$OwnerEntityCopyWithImpl<OwnerEntity>(this as OwnerEntity, _$identity);

  /// Serializes this OwnerEntity to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OwnerEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.login, login) || other.login == login) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, login, avatarUrl);

  @override
  String toString() {
    return 'OwnerEntity(id: $id, login: $login, avatarUrl: $avatarUrl)';
  }
}

/// @nodoc
abstract mixin class $OwnerEntityCopyWith<$Res> {
  factory $OwnerEntityCopyWith(
          OwnerEntity value, $Res Function(OwnerEntity) _then) =
      _$OwnerEntityCopyWithImpl;
  @useResult
  $Res call(
      {int id, String login, @JsonKey(name: 'avatar_url') String avatarUrl});
}

/// @nodoc
class _$OwnerEntityCopyWithImpl<$Res> implements $OwnerEntityCopyWith<$Res> {
  _$OwnerEntityCopyWithImpl(this._self, this._then);

  final OwnerEntity _self;
  final $Res Function(OwnerEntity) _then;

  /// Create a copy of OwnerEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? login = null,
    Object? avatarUrl = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      login: null == login
          ? _self.login
          : login // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: null == avatarUrl
          ? _self.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _OwnerEntity implements OwnerEntity {
  const _OwnerEntity(
      {required this.id,
      required this.login,
      @JsonKey(name: 'avatar_url') required this.avatarUrl});
  factory _OwnerEntity.fromJson(Map<String, dynamic> json) =>
      _$OwnerEntityFromJson(json);

  @override
  final int id;
  @override
  final String login;
  @override
  @JsonKey(name: 'avatar_url')
  final String avatarUrl;

  /// Create a copy of OwnerEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$OwnerEntityCopyWith<_OwnerEntity> get copyWith =>
      __$OwnerEntityCopyWithImpl<_OwnerEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$OwnerEntityToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OwnerEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.login, login) || other.login == login) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, login, avatarUrl);

  @override
  String toString() {
    return 'OwnerEntity(id: $id, login: $login, avatarUrl: $avatarUrl)';
  }
}

/// @nodoc
abstract mixin class _$OwnerEntityCopyWith<$Res>
    implements $OwnerEntityCopyWith<$Res> {
  factory _$OwnerEntityCopyWith(
          _OwnerEntity value, $Res Function(_OwnerEntity) _then) =
      __$OwnerEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id, String login, @JsonKey(name: 'avatar_url') String avatarUrl});
}

/// @nodoc
class __$OwnerEntityCopyWithImpl<$Res> implements _$OwnerEntityCopyWith<$Res> {
  __$OwnerEntityCopyWithImpl(this._self, this._then);

  final _OwnerEntity _self;
  final $Res Function(_OwnerEntity) _then;

  /// Create a copy of OwnerEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? login = null,
    Object? avatarUrl = null,
  }) {
    return _then(_OwnerEntity(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      login: null == login
          ? _self.login
          : login // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: null == avatarUrl
          ? _self.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
