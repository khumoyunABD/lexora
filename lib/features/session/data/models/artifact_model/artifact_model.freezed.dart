// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'artifact_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ArtifactsResponse _$ArtifactsResponseFromJson(Map<String, dynamic> json) {
  return _ArtifactsResponse.fromJson(json);
}

/// @nodoc
mixin _$ArtifactsResponse {
  List<Artifact> get artifacts => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  int get pages => throw _privateConstructorUsedError;

  /// Serializes this ArtifactsResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ArtifactsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ArtifactsResponseCopyWith<ArtifactsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArtifactsResponseCopyWith<$Res> {
  factory $ArtifactsResponseCopyWith(
          ArtifactsResponse value, $Res Function(ArtifactsResponse) then) =
      _$ArtifactsResponseCopyWithImpl<$Res, ArtifactsResponse>;
  @useResult
  $Res call({List<Artifact> artifacts, int total, int page, int pages});
}

/// @nodoc
class _$ArtifactsResponseCopyWithImpl<$Res, $Val extends ArtifactsResponse>
    implements $ArtifactsResponseCopyWith<$Res> {
  _$ArtifactsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ArtifactsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? artifacts = null,
    Object? total = null,
    Object? page = null,
    Object? pages = null,
  }) {
    return _then(_value.copyWith(
      artifacts: null == artifacts
          ? _value.artifacts
          : artifacts // ignore: cast_nullable_to_non_nullable
              as List<Artifact>,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      pages: null == pages
          ? _value.pages
          : pages // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ArtifactsResponseImplCopyWith<$Res>
    implements $ArtifactsResponseCopyWith<$Res> {
  factory _$$ArtifactsResponseImplCopyWith(_$ArtifactsResponseImpl value,
          $Res Function(_$ArtifactsResponseImpl) then) =
      __$$ArtifactsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Artifact> artifacts, int total, int page, int pages});
}

/// @nodoc
class __$$ArtifactsResponseImplCopyWithImpl<$Res>
    extends _$ArtifactsResponseCopyWithImpl<$Res, _$ArtifactsResponseImpl>
    implements _$$ArtifactsResponseImplCopyWith<$Res> {
  __$$ArtifactsResponseImplCopyWithImpl(_$ArtifactsResponseImpl _value,
      $Res Function(_$ArtifactsResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of ArtifactsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? artifacts = null,
    Object? total = null,
    Object? page = null,
    Object? pages = null,
  }) {
    return _then(_$ArtifactsResponseImpl(
      artifacts: null == artifacts
          ? _value._artifacts
          : artifacts // ignore: cast_nullable_to_non_nullable
              as List<Artifact>,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      pages: null == pages
          ? _value.pages
          : pages // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ArtifactsResponseImpl implements _ArtifactsResponse {
  const _$ArtifactsResponseImpl(
      {required final List<Artifact> artifacts,
      required this.total,
      required this.page,
      required this.pages})
      : _artifacts = artifacts;

  factory _$ArtifactsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ArtifactsResponseImplFromJson(json);

  final List<Artifact> _artifacts;
  @override
  List<Artifact> get artifacts {
    if (_artifacts is EqualUnmodifiableListView) return _artifacts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_artifacts);
  }

  @override
  final int total;
  @override
  final int page;
  @override
  final int pages;

  @override
  String toString() {
    return 'ArtifactsResponse(artifacts: $artifacts, total: $total, page: $page, pages: $pages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArtifactsResponseImpl &&
            const DeepCollectionEquality()
                .equals(other._artifacts, _artifacts) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.pages, pages) || other.pages == pages));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_artifacts), total, page, pages);

  /// Create a copy of ArtifactsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ArtifactsResponseImplCopyWith<_$ArtifactsResponseImpl> get copyWith =>
      __$$ArtifactsResponseImplCopyWithImpl<_$ArtifactsResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ArtifactsResponseImplToJson(
      this,
    );
  }
}

abstract class _ArtifactsResponse implements ArtifactsResponse {
  const factory _ArtifactsResponse(
      {required final List<Artifact> artifacts,
      required final int total,
      required final int page,
      required final int pages}) = _$ArtifactsResponseImpl;

  factory _ArtifactsResponse.fromJson(Map<String, dynamic> json) =
      _$ArtifactsResponseImpl.fromJson;

  @override
  List<Artifact> get artifacts;
  @override
  int get total;
  @override
  int get page;
  @override
  int get pages;

  /// Create a copy of ArtifactsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ArtifactsResponseImplCopyWith<_$ArtifactsResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Artifact _$ArtifactFromJson(Map<String, dynamic> json) {
  return _Artifact.fromJson(json);
}

/// @nodoc
mixin _$Artifact {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'session_id')
  String get sessionId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  @JsonKey(name: 'artifact_type')
  String get artifactType => throw _privateConstructorUsedError;
  int get version => throw _privateConstructorUsedError;
  @JsonKey(name: 'word_count')
  int get wordCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'extra_data')
  Map<String, dynamic>? get extraData => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this Artifact to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Artifact
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ArtifactCopyWith<Artifact> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArtifactCopyWith<$Res> {
  factory $ArtifactCopyWith(Artifact value, $Res Function(Artifact) then) =
      _$ArtifactCopyWithImpl<$Res, Artifact>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'session_id') String sessionId,
      String name,
      String content,
      @JsonKey(name: 'artifact_type') String artifactType,
      int version,
      @JsonKey(name: 'word_count') int wordCount,
      @JsonKey(name: 'extra_data') Map<String, dynamic>? extraData,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt});
}

/// @nodoc
class _$ArtifactCopyWithImpl<$Res, $Val extends Artifact>
    implements $ArtifactCopyWith<$Res> {
  _$ArtifactCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Artifact
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? sessionId = null,
    Object? name = null,
    Object? content = null,
    Object? artifactType = null,
    Object? version = null,
    Object? wordCount = null,
    Object? extraData = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      sessionId: null == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      artifactType: null == artifactType
          ? _value.artifactType
          : artifactType // ignore: cast_nullable_to_non_nullable
              as String,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as int,
      wordCount: null == wordCount
          ? _value.wordCount
          : wordCount // ignore: cast_nullable_to_non_nullable
              as int,
      extraData: freezed == extraData
          ? _value.extraData
          : extraData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ArtifactImplCopyWith<$Res>
    implements $ArtifactCopyWith<$Res> {
  factory _$$ArtifactImplCopyWith(
          _$ArtifactImpl value, $Res Function(_$ArtifactImpl) then) =
      __$$ArtifactImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'session_id') String sessionId,
      String name,
      String content,
      @JsonKey(name: 'artifact_type') String artifactType,
      int version,
      @JsonKey(name: 'word_count') int wordCount,
      @JsonKey(name: 'extra_data') Map<String, dynamic>? extraData,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt});
}

/// @nodoc
class __$$ArtifactImplCopyWithImpl<$Res>
    extends _$ArtifactCopyWithImpl<$Res, _$ArtifactImpl>
    implements _$$ArtifactImplCopyWith<$Res> {
  __$$ArtifactImplCopyWithImpl(
      _$ArtifactImpl _value, $Res Function(_$ArtifactImpl) _then)
      : super(_value, _then);

  /// Create a copy of Artifact
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? sessionId = null,
    Object? name = null,
    Object? content = null,
    Object? artifactType = null,
    Object? version = null,
    Object? wordCount = null,
    Object? extraData = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$ArtifactImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      sessionId: null == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      artifactType: null == artifactType
          ? _value.artifactType
          : artifactType // ignore: cast_nullable_to_non_nullable
              as String,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as int,
      wordCount: null == wordCount
          ? _value.wordCount
          : wordCount // ignore: cast_nullable_to_non_nullable
              as int,
      extraData: freezed == extraData
          ? _value._extraData
          : extraData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ArtifactImpl extends _Artifact {
  const _$ArtifactImpl(
      {required this.id,
      @JsonKey(name: 'session_id') required this.sessionId,
      required this.name,
      required this.content,
      @JsonKey(name: 'artifact_type') required this.artifactType,
      required this.version,
      @JsonKey(name: 'word_count') required this.wordCount,
      @JsonKey(name: 'extra_data') final Map<String, dynamic>? extraData,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt})
      : _extraData = extraData,
        super._();

  factory _$ArtifactImpl.fromJson(Map<String, dynamic> json) =>
      _$$ArtifactImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'session_id')
  final String sessionId;
  @override
  final String name;
  @override
  final String content;
  @override
  @JsonKey(name: 'artifact_type')
  final String artifactType;
  @override
  final int version;
  @override
  @JsonKey(name: 'word_count')
  final int wordCount;
  final Map<String, dynamic>? _extraData;
  @override
  @JsonKey(name: 'extra_data')
  Map<String, dynamic>? get extraData {
    final value = _extraData;
    if (value == null) return null;
    if (_extraData is EqualUnmodifiableMapView) return _extraData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  @override
  String toString() {
    return 'Artifact(id: $id, sessionId: $sessionId, name: $name, content: $content, artifactType: $artifactType, version: $version, wordCount: $wordCount, extraData: $extraData, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArtifactImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.artifactType, artifactType) ||
                other.artifactType == artifactType) &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.wordCount, wordCount) ||
                other.wordCount == wordCount) &&
            const DeepCollectionEquality()
                .equals(other._extraData, _extraData) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      sessionId,
      name,
      content,
      artifactType,
      version,
      wordCount,
      const DeepCollectionEquality().hash(_extraData),
      createdAt,
      updatedAt);

  /// Create a copy of Artifact
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ArtifactImplCopyWith<_$ArtifactImpl> get copyWith =>
      __$$ArtifactImplCopyWithImpl<_$ArtifactImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ArtifactImplToJson(
      this,
    );
  }
}

abstract class _Artifact extends Artifact {
  const factory _Artifact(
          {required final int id,
          @JsonKey(name: 'session_id') required final String sessionId,
          required final String name,
          required final String content,
          @JsonKey(name: 'artifact_type') required final String artifactType,
          required final int version,
          @JsonKey(name: 'word_count') required final int wordCount,
          @JsonKey(name: 'extra_data') final Map<String, dynamic>? extraData,
          @JsonKey(name: 'created_at') required final DateTime createdAt,
          @JsonKey(name: 'updated_at') required final DateTime updatedAt}) =
      _$ArtifactImpl;
  const _Artifact._() : super._();

  factory _Artifact.fromJson(Map<String, dynamic> json) =
      _$ArtifactImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'session_id')
  String get sessionId;
  @override
  String get name;
  @override
  String get content;
  @override
  @JsonKey(name: 'artifact_type')
  String get artifactType;
  @override
  int get version;
  @override
  @JsonKey(name: 'word_count')
  int get wordCount;
  @override
  @JsonKey(name: 'extra_data')
  Map<String, dynamic>? get extraData;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;

  /// Create a copy of Artifact
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ArtifactImplCopyWith<_$ArtifactImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
