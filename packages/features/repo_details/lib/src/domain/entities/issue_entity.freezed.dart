// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'issue_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$IssueEntity {
  int get id;
  String get title;
  @JsonKey(name: 'html_url')
  String get url;

  /// Create a copy of IssueEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $IssueEntityCopyWith<IssueEntity> get copyWith =>
      _$IssueEntityCopyWithImpl<IssueEntity>(this as IssueEntity, _$identity);

  /// Serializes this IssueEntity to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is IssueEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, url);

  @override
  String toString() {
    return 'IssueEntity(id: $id, title: $title, url: $url)';
  }
}

/// @nodoc
abstract mixin class $IssueEntityCopyWith<$Res> {
  factory $IssueEntityCopyWith(
          IssueEntity value, $Res Function(IssueEntity) _then) =
      _$IssueEntityCopyWithImpl;
  @useResult
  $Res call({int id, String title, @JsonKey(name: 'html_url') String url});
}

/// @nodoc
class _$IssueEntityCopyWithImpl<$Res> implements $IssueEntityCopyWith<$Res> {
  _$IssueEntityCopyWithImpl(this._self, this._then);

  final IssueEntity _self;
  final $Res Function(IssueEntity) _then;

  /// Create a copy of IssueEntity
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
class _IssueEntity implements IssueEntity {
  const _IssueEntity(
      {required this.id,
      required this.title,
      @JsonKey(name: 'html_url') required this.url});
  factory _IssueEntity.fromJson(Map<String, dynamic> json) =>
      _$IssueEntityFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  @JsonKey(name: 'html_url')
  final String url;

  /// Create a copy of IssueEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$IssueEntityCopyWith<_IssueEntity> get copyWith =>
      __$IssueEntityCopyWithImpl<_IssueEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$IssueEntityToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _IssueEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, url);

  @override
  String toString() {
    return 'IssueEntity(id: $id, title: $title, url: $url)';
  }
}

/// @nodoc
abstract mixin class _$IssueEntityCopyWith<$Res>
    implements $IssueEntityCopyWith<$Res> {
  factory _$IssueEntityCopyWith(
          _IssueEntity value, $Res Function(_IssueEntity) _then) =
      __$IssueEntityCopyWithImpl;
  @override
  @useResult
  $Res call({int id, String title, @JsonKey(name: 'html_url') String url});
}

/// @nodoc
class __$IssueEntityCopyWithImpl<$Res> implements _$IssueEntityCopyWith<$Res> {
  __$IssueEntityCopyWithImpl(this._self, this._then);

  final _IssueEntity _self;
  final $Res Function(_IssueEntity) _then;

  /// Create a copy of IssueEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? url = null,
  }) {
    return _then(_IssueEntity(
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
