// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'github_repository_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GithubRepositoryEntity {
  int get id;
  String get name;
  @JsonKey(name: "full_name")
  String get fullName;
  String? get description;
  @JsonKey(name: 'stargazers_count')
  num? get stargazersCount;
  String? get language;

  /// Create a copy of GithubRepositoryEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GithubRepositoryEntityCopyWith<GithubRepositoryEntity> get copyWith =>
      _$GithubRepositoryEntityCopyWithImpl<GithubRepositoryEntity>(
          this as GithubRepositoryEntity, _$identity);

  /// Serializes this GithubRepositoryEntity to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GithubRepositoryEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.stargazersCount, stargazersCount) ||
                other.stargazersCount == stargazersCount) &&
            (identical(other.language, language) ||
                other.language == language));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, fullName, description, stargazersCount, language);

  @override
  String toString() {
    return 'GithubRepositoryEntity(id: $id, name: $name, fullName: $fullName, description: $description, stargazersCount: $stargazersCount, language: $language)';
  }
}

/// @nodoc
abstract mixin class $GithubRepositoryEntityCopyWith<$Res> {
  factory $GithubRepositoryEntityCopyWith(GithubRepositoryEntity value,
          $Res Function(GithubRepositoryEntity) _then) =
      _$GithubRepositoryEntityCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      String name,
      @JsonKey(name: "full_name") String fullName,
      String? description,
      @JsonKey(name: 'stargazers_count') num? stargazersCount,
      String? language});
}

/// @nodoc
class _$GithubRepositoryEntityCopyWithImpl<$Res>
    implements $GithubRepositoryEntityCopyWith<$Res> {
  _$GithubRepositoryEntityCopyWithImpl(this._self, this._then);

  final GithubRepositoryEntity _self;
  final $Res Function(GithubRepositoryEntity) _then;

  /// Create a copy of GithubRepositoryEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? fullName = null,
    Object? description = freezed,
    Object? stargazersCount = freezed,
    Object? language = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _self.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      stargazersCount: freezed == stargazersCount
          ? _self.stargazersCount
          : stargazersCount // ignore: cast_nullable_to_non_nullable
              as num?,
      language: freezed == language
          ? _self.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _GithubRepositoryEntity implements GithubRepositoryEntity {
  const _GithubRepositoryEntity(
      {required this.id,
      required this.name,
      @JsonKey(name: "full_name") required this.fullName,
      this.description,
      @JsonKey(name: 'stargazers_count') required this.stargazersCount,
      this.language});
  factory _GithubRepositoryEntity.fromJson(Map<String, dynamic> json) =>
      _$GithubRepositoryEntityFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  @JsonKey(name: "full_name")
  final String fullName;
  @override
  final String? description;
  @override
  @JsonKey(name: 'stargazers_count')
  final num? stargazersCount;
  @override
  final String? language;

  /// Create a copy of GithubRepositoryEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$GithubRepositoryEntityCopyWith<_GithubRepositoryEntity> get copyWith =>
      __$GithubRepositoryEntityCopyWithImpl<_GithubRepositoryEntity>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$GithubRepositoryEntityToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GithubRepositoryEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.stargazersCount, stargazersCount) ||
                other.stargazersCount == stargazersCount) &&
            (identical(other.language, language) ||
                other.language == language));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, fullName, description, stargazersCount, language);

  @override
  String toString() {
    return 'GithubRepositoryEntity(id: $id, name: $name, fullName: $fullName, description: $description, stargazersCount: $stargazersCount, language: $language)';
  }
}

/// @nodoc
abstract mixin class _$GithubRepositoryEntityCopyWith<$Res>
    implements $GithubRepositoryEntityCopyWith<$Res> {
  factory _$GithubRepositoryEntityCopyWith(_GithubRepositoryEntity value,
          $Res Function(_GithubRepositoryEntity) _then) =
      __$GithubRepositoryEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      @JsonKey(name: "full_name") String fullName,
      String? description,
      @JsonKey(name: 'stargazers_count') num? stargazersCount,
      String? language});
}

/// @nodoc
class __$GithubRepositoryEntityCopyWithImpl<$Res>
    implements _$GithubRepositoryEntityCopyWith<$Res> {
  __$GithubRepositoryEntityCopyWithImpl(this._self, this._then);

  final _GithubRepositoryEntity _self;
  final $Res Function(_GithubRepositoryEntity) _then;

  /// Create a copy of GithubRepositoryEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? fullName = null,
    Object? description = freezed,
    Object? stargazersCount = freezed,
    Object? language = freezed,
  }) {
    return _then(_GithubRepositoryEntity(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _self.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      stargazersCount: freezed == stargazersCount
          ? _self.stargazersCount
          : stargazersCount // ignore: cast_nullable_to_non_nullable
              as num?,
      language: freezed == language
          ? _self.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
