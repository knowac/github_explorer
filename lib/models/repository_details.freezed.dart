// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'repository_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RepositoryDetails _$RepositoryDetailsFromJson(Map<String, dynamic> json) {
  return _RepositoryDetails.fromJson(json);
}

/// @nodoc
mixin _$RepositoryDetails {
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'stargazers_count')
  int get stars => throw _privateConstructorUsedError;
  @JsonKey(name: 'forks_count')
  int get forks => throw _privateConstructorUsedError;
  @JsonKey(name: 'html_url')
  String get url => throw _privateConstructorUsedError;
  @JsonKey(name: 'avatar_url')
  String? get avatarUrl => throw _privateConstructorUsedError;
  Owner? get owner => throw _privateConstructorUsedError;
  String get language => throw _privateConstructorUsedError;

  /// Serializes this RepositoryDetails to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RepositoryDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RepositoryDetailsCopyWith<RepositoryDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RepositoryDetailsCopyWith<$Res> {
  factory $RepositoryDetailsCopyWith(
          RepositoryDetails value, $Res Function(RepositoryDetails) then) =
      _$RepositoryDetailsCopyWithImpl<$Res, RepositoryDetails>;
  @useResult
  $Res call(
      {String name,
      String description,
      @JsonKey(name: 'stargazers_count') int stars,
      @JsonKey(name: 'forks_count') int forks,
      @JsonKey(name: 'html_url') String url,
      @JsonKey(name: 'avatar_url') String? avatarUrl,
      Owner? owner,
      String language});

  $OwnerCopyWith<$Res>? get owner;
}

/// @nodoc
class _$RepositoryDetailsCopyWithImpl<$Res, $Val extends RepositoryDetails>
    implements $RepositoryDetailsCopyWith<$Res> {
  _$RepositoryDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RepositoryDetails
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
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      stars: null == stars
          ? _value.stars
          : stars // ignore: cast_nullable_to_non_nullable
              as int,
      forks: null == forks
          ? _value.forks
          : forks // ignore: cast_nullable_to_non_nullable
              as int,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      owner: freezed == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as Owner?,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  /// Create a copy of RepositoryDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OwnerCopyWith<$Res>? get owner {
    if (_value.owner == null) {
      return null;
    }

    return $OwnerCopyWith<$Res>(_value.owner!, (value) {
      return _then(_value.copyWith(owner: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RepositoryDetailsImplCopyWith<$Res>
    implements $RepositoryDetailsCopyWith<$Res> {
  factory _$$RepositoryDetailsImplCopyWith(_$RepositoryDetailsImpl value,
          $Res Function(_$RepositoryDetailsImpl) then) =
      __$$RepositoryDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String description,
      @JsonKey(name: 'stargazers_count') int stars,
      @JsonKey(name: 'forks_count') int forks,
      @JsonKey(name: 'html_url') String url,
      @JsonKey(name: 'avatar_url') String? avatarUrl,
      Owner? owner,
      String language});

  @override
  $OwnerCopyWith<$Res>? get owner;
}

/// @nodoc
class __$$RepositoryDetailsImplCopyWithImpl<$Res>
    extends _$RepositoryDetailsCopyWithImpl<$Res, _$RepositoryDetailsImpl>
    implements _$$RepositoryDetailsImplCopyWith<$Res> {
  __$$RepositoryDetailsImplCopyWithImpl(_$RepositoryDetailsImpl _value,
      $Res Function(_$RepositoryDetailsImpl) _then)
      : super(_value, _then);

  /// Create a copy of RepositoryDetails
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
    return _then(_$RepositoryDetailsImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      stars: null == stars
          ? _value.stars
          : stars // ignore: cast_nullable_to_non_nullable
              as int,
      forks: null == forks
          ? _value.forks
          : forks // ignore: cast_nullable_to_non_nullable
              as int,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      owner: freezed == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as Owner?,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RepositoryDetailsImpl implements _RepositoryDetails {
  const _$RepositoryDetailsImpl(
      {required this.name,
      required this.description,
      @JsonKey(name: 'stargazers_count') required this.stars,
      @JsonKey(name: 'forks_count') required this.forks,
      @JsonKey(name: 'html_url') required this.url,
      @JsonKey(name: 'avatar_url') required this.avatarUrl,
      required this.owner,
      required this.language});

  factory _$RepositoryDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$RepositoryDetailsImplFromJson(json);

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
  final Owner? owner;
  @override
  final String language;

  @override
  String toString() {
    return 'RepositoryDetails(name: $name, description: $description, stars: $stars, forks: $forks, url: $url, avatarUrl: $avatarUrl, owner: $owner, language: $language)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RepositoryDetailsImpl &&
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

  /// Create a copy of RepositoryDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RepositoryDetailsImplCopyWith<_$RepositoryDetailsImpl> get copyWith =>
      __$$RepositoryDetailsImplCopyWithImpl<_$RepositoryDetailsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RepositoryDetailsImplToJson(
      this,
    );
  }
}

abstract class _RepositoryDetails implements RepositoryDetails {
  const factory _RepositoryDetails(
      {required final String name,
      required final String description,
      @JsonKey(name: 'stargazers_count') required final int stars,
      @JsonKey(name: 'forks_count') required final int forks,
      @JsonKey(name: 'html_url') required final String url,
      @JsonKey(name: 'avatar_url') required final String? avatarUrl,
      required final Owner? owner,
      required final String language}) = _$RepositoryDetailsImpl;

  factory _RepositoryDetails.fromJson(Map<String, dynamic> json) =
      _$RepositoryDetailsImpl.fromJson;

  @override
  String get name;
  @override
  String get description;
  @override
  @JsonKey(name: 'stargazers_count')
  int get stars;
  @override
  @JsonKey(name: 'forks_count')
  int get forks;
  @override
  @JsonKey(name: 'html_url')
  String get url;
  @override
  @JsonKey(name: 'avatar_url')
  String? get avatarUrl;
  @override
  Owner? get owner;
  @override
  String get language;

  /// Create a copy of RepositoryDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RepositoryDetailsImplCopyWith<_$RepositoryDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
