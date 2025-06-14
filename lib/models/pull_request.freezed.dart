// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pull_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PullRequest _$PullRequestFromJson(Map<String, dynamic> json) {
  return _PullRequest.fromJson(json);
}

/// @nodoc
mixin _$PullRequest {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'html_url')
  String get url => throw _privateConstructorUsedError;

  /// Serializes this PullRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PullRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PullRequestCopyWith<PullRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PullRequestCopyWith<$Res> {
  factory $PullRequestCopyWith(
          PullRequest value, $Res Function(PullRequest) then) =
      _$PullRequestCopyWithImpl<$Res, PullRequest>;
  @useResult
  $Res call({int id, String title, @JsonKey(name: 'html_url') String url});
}

/// @nodoc
class _$PullRequestCopyWithImpl<$Res, $Val extends PullRequest>
    implements $PullRequestCopyWith<$Res> {
  _$PullRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PullRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PullRequestImplCopyWith<$Res>
    implements $PullRequestCopyWith<$Res> {
  factory _$$PullRequestImplCopyWith(
          _$PullRequestImpl value, $Res Function(_$PullRequestImpl) then) =
      __$$PullRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String title, @JsonKey(name: 'html_url') String url});
}

/// @nodoc
class __$$PullRequestImplCopyWithImpl<$Res>
    extends _$PullRequestCopyWithImpl<$Res, _$PullRequestImpl>
    implements _$$PullRequestImplCopyWith<$Res> {
  __$$PullRequestImplCopyWithImpl(
      _$PullRequestImpl _value, $Res Function(_$PullRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of PullRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? url = null,
  }) {
    return _then(_$PullRequestImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PullRequestImpl implements _PullRequest {
  const _$PullRequestImpl(
      {required this.id,
      required this.title,
      @JsonKey(name: 'html_url') required this.url});

  factory _$PullRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$PullRequestImplFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  @JsonKey(name: 'html_url')
  final String url;

  @override
  String toString() {
    return 'PullRequest(id: $id, title: $title, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PullRequestImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, url);

  /// Create a copy of PullRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PullRequestImplCopyWith<_$PullRequestImpl> get copyWith =>
      __$$PullRequestImplCopyWithImpl<_$PullRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PullRequestImplToJson(
      this,
    );
  }
}

abstract class _PullRequest implements PullRequest {
  const factory _PullRequest(
          {required final int id,
          required final String title,
          @JsonKey(name: 'html_url') required final String url}) =
      _$PullRequestImpl;

  factory _PullRequest.fromJson(Map<String, dynamic> json) =
      _$PullRequestImpl.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  @JsonKey(name: 'html_url')
  String get url;

  /// Create a copy of PullRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PullRequestImplCopyWith<_$PullRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
