// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pull_request_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PullRequestEntity {
  int get id;
  String get title;
  @JsonKey(name: 'html_url')
  String get url;

  /// Create a copy of PullRequestEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PullRequestEntityCopyWith<PullRequestEntity> get copyWith =>
      _$PullRequestEntityCopyWithImpl<PullRequestEntity>(
          this as PullRequestEntity, _$identity);

  /// Serializes this PullRequestEntity to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PullRequestEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, url);

  @override
  String toString() {
    return 'PullRequestEntity(id: $id, title: $title, url: $url)';
  }
}

/// @nodoc
abstract mixin class $PullRequestEntityCopyWith<$Res> {
  factory $PullRequestEntityCopyWith(
          PullRequestEntity value, $Res Function(PullRequestEntity) _then) =
      _$PullRequestEntityCopyWithImpl;
  @useResult
  $Res call({int id, String title, @JsonKey(name: 'html_url') String url});
}

/// @nodoc
class _$PullRequestEntityCopyWithImpl<$Res>
    implements $PullRequestEntityCopyWith<$Res> {
  _$PullRequestEntityCopyWithImpl(this._self, this._then);

  final PullRequestEntity _self;
  final $Res Function(PullRequestEntity) _then;

  /// Create a copy of PullRequestEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? url = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _self.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _PullRequestEntity implements PullRequestEntity {
  const _PullRequestEntity(
      {required this.id,
      required this.title,
      @JsonKey(name: 'html_url') required this.url});
  factory _PullRequestEntity.fromJson(Map<String, dynamic> json) =>
      _$PullRequestEntityFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  @JsonKey(name: 'html_url')
  final String url;

  /// Create a copy of PullRequestEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PullRequestEntityCopyWith<_PullRequestEntity> get copyWith =>
      __$PullRequestEntityCopyWithImpl<_PullRequestEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PullRequestEntityToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PullRequestEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, url);

  @override
  String toString() {
    return 'PullRequestEntity(id: $id, title: $title, url: $url)';
  }
}

/// @nodoc
abstract mixin class _$PullRequestEntityCopyWith<$Res>
    implements $PullRequestEntityCopyWith<$Res> {
  factory _$PullRequestEntityCopyWith(
          _PullRequestEntity value, $Res Function(_PullRequestEntity) _then) =
      __$PullRequestEntityCopyWithImpl;
  @override
  @useResult
  $Res call({int id, String title, @JsonKey(name: 'html_url') String url});
}

/// @nodoc
class __$PullRequestEntityCopyWithImpl<$Res>
    implements _$PullRequestEntityCopyWith<$Res> {
  __$PullRequestEntityCopyWithImpl(this._self, this._then);

  final _PullRequestEntity _self;
  final $Res Function(_PullRequestEntity) _then;

  /// Create a copy of PullRequestEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? url = null,
  }) {
    return _then(_PullRequestEntity(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _self.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
