// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'repository_details_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RepositoryDetailsEntity {
  String get name;
  String get description;
  @JsonKey(name: 'stargazers_count')
  int get stars;
  @JsonKey(name: 'forks_count')
  int get forks;
  @JsonKey(name: 'html_url')
  String get url;
  @JsonKey(name: 'avatar_url')
  String? get avatarUrl;
  OwnerEntity? get owner;
  String get language;

  /// Create a copy of RepositoryDetailsEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RepositoryDetailsEntityCopyWith<RepositoryDetailsEntity> get copyWith =>
      _$RepositoryDetailsEntityCopyWithImpl<RepositoryDetailsEntity>(
          this as RepositoryDetailsEntity, _$identity);

  /// Serializes this RepositoryDetailsEntity to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RepositoryDetailsEntity &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.stars, stars) || other.stars == stars) &&
            (identical(other.forks, forks) || other.forks == forks) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.owner, owner) || other.owner == owner) &&
            (identical(other.language, language) ||
                other.language == language));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, description, stars, forks,
      url, avatarUrl, owner, language);

  @override
  String toString() {
    return 'RepositoryDetailsEntity(name: $name, description: $description, stars: $stars, forks: $forks, url: $url, avatarUrl: $avatarUrl, owner: $owner, language: $language)';
  }
}

/// @nodoc
abstract mixin class $RepositoryDetailsEntityCopyWith<$Res> {
  factory $RepositoryDetailsEntityCopyWith(RepositoryDetailsEntity value,
          $Res Function(RepositoryDetailsEntity) _then) =
      _$RepositoryDetailsEntityCopyWithImpl;
  @useResult
  $Res call(
      {String name,
      String description,
      @JsonKey(name: 'stargazers_count') int stars,
      @JsonKey(name: 'forks_count') int forks,
      @JsonKey(name: 'html_url') String url,
      @JsonKey(name: 'avatar_url') String? avatarUrl,
      OwnerEntity? owner,
      String language});

  $OwnerEntityCopyWith<$Res>? get owner;
}

/// @nodoc
class _$RepositoryDetailsEntityCopyWithImpl<$Res>
    implements $RepositoryDetailsEntityCopyWith<$Res> {
  _$RepositoryDetailsEntityCopyWithImpl(this._self, this._then);

  final RepositoryDetailsEntity _self;
  final $Res Function(RepositoryDetailsEntity) _then;

  /// Create a copy of RepositoryDetailsEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = null,
    Object? stars = null,
    Object? forks = null,
    Object? url = null,
    Object? avatarUrl = freezed,
    Object? owner = freezed,
    Object? language = null,
  }) {
    return _then(_self.copyWith(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      stars: null == stars
          ? _self.stars
          : stars // ignore: cast_nullable_to_non_nullable
              as int,
      forks: null == forks
          ? _self.forks
          : forks // ignore: cast_nullable_to_non_nullable
              as int,
      url: null == url
          ? _self.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: freezed == avatarUrl
          ? _self.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      owner: freezed == owner
          ? _self.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as OwnerEntity?,
      language: null == language
          ? _self.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  /// Create a copy of RepositoryDetailsEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OwnerEntityCopyWith<$Res>? get owner {
    if (_self.owner == null) {
      return null;
    }

    return $OwnerEntityCopyWith<$Res>(_self.owner!, (value) {
      return _then(_self.copyWith(owner: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _RepositoryDetailsEntity implements RepositoryDetailsEntity {
  const _RepositoryDetailsEntity(
      {required this.name,
      required this.description,
      @JsonKey(name: 'stargazers_count') required this.stars,
      @JsonKey(name: 'forks_count') required this.forks,
      @JsonKey(name: 'html_url') required this.url,
      @JsonKey(name: 'avatar_url') required this.avatarUrl,
      required this.owner,
      required this.language});
  factory _RepositoryDetailsEntity.fromJson(Map<String, dynamic> json) =>
      _$RepositoryDetailsEntityFromJson(json);

  @override
  final String name;
  @override
  final String description;
  @override
  @JsonKey(name: 'stargazers_count')
  final int stars;
  @override
  @JsonKey(name: 'forks_count')
  final int forks;
  @override
  @JsonKey(name: 'html_url')
  final String url;
  @override
  @JsonKey(name: 'avatar_url')
  final String? avatarUrl;
  @override
  final OwnerEntity? owner;
  @override
  final String language;

  /// Create a copy of RepositoryDetailsEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RepositoryDetailsEntityCopyWith<_RepositoryDetailsEntity> get copyWith =>
      __$RepositoryDetailsEntityCopyWithImpl<_RepositoryDetailsEntity>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RepositoryDetailsEntityToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RepositoryDetailsEntity &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.stars, stars) || other.stars == stars) &&
            (identical(other.forks, forks) || other.forks == forks) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.owner, owner) || other.owner == owner) &&
            (identical(other.language, language) ||
                other.language == language));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, description, stars, forks,
      url, avatarUrl, owner, language);

  @override
  String toString() {
    return 'RepositoryDetailsEntity(name: $name, description: $description, stars: $stars, forks: $forks, url: $url, avatarUrl: $avatarUrl, owner: $owner, language: $language)';
  }
}

/// @nodoc
abstract mixin class _$RepositoryDetailsEntityCopyWith<$Res>
    implements $RepositoryDetailsEntityCopyWith<$Res> {
  factory _$RepositoryDetailsEntityCopyWith(_RepositoryDetailsEntity value,
          $Res Function(_RepositoryDetailsEntity) _then) =
      __$RepositoryDetailsEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String name,
      String description,
      @JsonKey(name: 'stargazers_count') int stars,
      @JsonKey(name: 'forks_count') int forks,
      @JsonKey(name: 'html_url') String url,
      @JsonKey(name: 'avatar_url') String? avatarUrl,
      OwnerEntity? owner,
      String language});

  @override
  $OwnerEntityCopyWith<$Res>? get owner;
}

/// @nodoc
class __$RepositoryDetailsEntityCopyWithImpl<$Res>
    implements _$RepositoryDetailsEntityCopyWith<$Res> {
  __$RepositoryDetailsEntityCopyWithImpl(this._self, this._then);

  final _RepositoryDetailsEntity _self;
  final $Res Function(_RepositoryDetailsEntity) _then;

  /// Create a copy of RepositoryDetailsEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? description = null,
    Object? stars = null,
    Object? forks = null,
    Object? url = null,
    Object? avatarUrl = freezed,
    Object? owner = freezed,
    Object? language = null,
  }) {
    return _then(_RepositoryDetailsEntity(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      stars: null == stars
          ? _self.stars
          : stars // ignore: cast_nullable_to_non_nullable
              as int,
      forks: null == forks
          ? _self.forks
          : forks // ignore: cast_nullable_to_non_nullable
              as int,
      url: null == url
          ? _self.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: freezed == avatarUrl
          ? _self.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      owner: freezed == owner
          ? _self.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as OwnerEntity?,
      language: null == language
          ? _self.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  /// Create a copy of RepositoryDetailsEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OwnerEntityCopyWith<$Res>? get owner {
    if (_self.owner == null) {
      return null;
    }

    return $OwnerEntityCopyWith<$Res>(_self.owner!, (value) {
      return _then(_self.copyWith(owner: value));
    });
  }
}

// dart format on
