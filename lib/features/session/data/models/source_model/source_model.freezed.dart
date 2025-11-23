// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'source_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SourcesResponse _$SourcesResponseFromJson(Map<String, dynamic> json) {
  return _SourcesResponse.fromJson(json);
}

/// @nodoc
mixin _$SourcesResponse {
  List<SourceItem> get sources => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  int get pages => throw _privateConstructorUsedError;

  /// Serializes this SourcesResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SourcesResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SourcesResponseCopyWith<SourcesResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SourcesResponseCopyWith<$Res> {
  factory $SourcesResponseCopyWith(
          SourcesResponse value, $Res Function(SourcesResponse) then) =
      _$SourcesResponseCopyWithImpl<$Res, SourcesResponse>;
  @useResult
  $Res call({List<SourceItem> sources, int total, int page, int pages});
}

/// @nodoc
class _$SourcesResponseCopyWithImpl<$Res, $Val extends SourcesResponse>
    implements $SourcesResponseCopyWith<$Res> {
  _$SourcesResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SourcesResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sources = null,
    Object? total = null,
    Object? page = null,
    Object? pages = null,
  }) {
    return _then(_value.copyWith(
      sources: null == sources
          ? _value.sources
          : sources // ignore: cast_nullable_to_non_nullable
              as List<SourceItem>,
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
abstract class _$$SourcesResponseImplCopyWith<$Res>
    implements $SourcesResponseCopyWith<$Res> {
  factory _$$SourcesResponseImplCopyWith(_$SourcesResponseImpl value,
          $Res Function(_$SourcesResponseImpl) then) =
      __$$SourcesResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<SourceItem> sources, int total, int page, int pages});
}

/// @nodoc
class __$$SourcesResponseImplCopyWithImpl<$Res>
    extends _$SourcesResponseCopyWithImpl<$Res, _$SourcesResponseImpl>
    implements _$$SourcesResponseImplCopyWith<$Res> {
  __$$SourcesResponseImplCopyWithImpl(
      _$SourcesResponseImpl _value, $Res Function(_$SourcesResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of SourcesResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sources = null,
    Object? total = null,
    Object? page = null,
    Object? pages = null,
  }) {
    return _then(_$SourcesResponseImpl(
      sources: null == sources
          ? _value._sources
          : sources // ignore: cast_nullable_to_non_nullable
              as List<SourceItem>,
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
class _$SourcesResponseImpl implements _SourcesResponse {
  const _$SourcesResponseImpl(
      {required final List<SourceItem> sources,
      required this.total,
      required this.page,
      required this.pages})
      : _sources = sources;

  factory _$SourcesResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$SourcesResponseImplFromJson(json);

  final List<SourceItem> _sources;
  @override
  List<SourceItem> get sources {
    if (_sources is EqualUnmodifiableListView) return _sources;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sources);
  }

  @override
  final int total;
  @override
  final int page;
  @override
  final int pages;

  @override
  String toString() {
    return 'SourcesResponse(sources: $sources, total: $total, page: $page, pages: $pages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SourcesResponseImpl &&
            const DeepCollectionEquality().equals(other._sources, _sources) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.pages, pages) || other.pages == pages));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_sources), total, page, pages);

  /// Create a copy of SourcesResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SourcesResponseImplCopyWith<_$SourcesResponseImpl> get copyWith =>
      __$$SourcesResponseImplCopyWithImpl<_$SourcesResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SourcesResponseImplToJson(
      this,
    );
  }
}

abstract class _SourcesResponse implements SourcesResponse {
  const factory _SourcesResponse(
      {required final List<SourceItem> sources,
      required final int total,
      required final int page,
      required final int pages}) = _$SourcesResponseImpl;

  factory _SourcesResponse.fromJson(Map<String, dynamic> json) =
      _$SourcesResponseImpl.fromJson;

  @override
  List<SourceItem> get sources;
  @override
  int get total;
  @override
  int get page;
  @override
  int get pages;

  /// Create a copy of SourcesResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SourcesResponseImplCopyWith<_$SourcesResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SourceItem _$SourceItemFromJson(Map<String, dynamic> json) {
  return _SourceItem.fromJson(json);
}

/// @nodoc
mixin _$SourceItem {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'session_id')
  String get sessionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'source_type')
  SourceType get sourceType => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'content_preview')
  String get contentPreview => throw _privateConstructorUsedError;
  @JsonKey(name: 'source_url')
  String? get sourceUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'original_filename')
  String? get originalFilename => throw _privateConstructorUsedError;
  @JsonKey(name: 'file_size')
  int? get fileSize => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Serializes this SourceItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SourceItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SourceItemCopyWith<SourceItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SourceItemCopyWith<$Res> {
  factory $SourceItemCopyWith(
          SourceItem value, $Res Function(SourceItem) then) =
      _$SourceItemCopyWithImpl<$Res, SourceItem>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'session_id') String sessionId,
      @JsonKey(name: 'source_type') SourceType sourceType,
      String name,
      @JsonKey(name: 'content_preview') String contentPreview,
      @JsonKey(name: 'source_url') String? sourceUrl,
      @JsonKey(name: 'original_filename') String? originalFilename,
      @JsonKey(name: 'file_size') int? fileSize,
      @JsonKey(name: 'created_at') DateTime createdAt});
}

/// @nodoc
class _$SourceItemCopyWithImpl<$Res, $Val extends SourceItem>
    implements $SourceItemCopyWith<$Res> {
  _$SourceItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SourceItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? sessionId = null,
    Object? sourceType = null,
    Object? name = null,
    Object? contentPreview = null,
    Object? sourceUrl = freezed,
    Object? originalFilename = freezed,
    Object? fileSize = freezed,
    Object? createdAt = null,
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
      sourceType: null == sourceType
          ? _value.sourceType
          : sourceType // ignore: cast_nullable_to_non_nullable
              as SourceType,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      contentPreview: null == contentPreview
          ? _value.contentPreview
          : contentPreview // ignore: cast_nullable_to_non_nullable
              as String,
      sourceUrl: freezed == sourceUrl
          ? _value.sourceUrl
          : sourceUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      originalFilename: freezed == originalFilename
          ? _value.originalFilename
          : originalFilename // ignore: cast_nullable_to_non_nullable
              as String?,
      fileSize: freezed == fileSize
          ? _value.fileSize
          : fileSize // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SourceItemImplCopyWith<$Res>
    implements $SourceItemCopyWith<$Res> {
  factory _$$SourceItemImplCopyWith(
          _$SourceItemImpl value, $Res Function(_$SourceItemImpl) then) =
      __$$SourceItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'session_id') String sessionId,
      @JsonKey(name: 'source_type') SourceType sourceType,
      String name,
      @JsonKey(name: 'content_preview') String contentPreview,
      @JsonKey(name: 'source_url') String? sourceUrl,
      @JsonKey(name: 'original_filename') String? originalFilename,
      @JsonKey(name: 'file_size') int? fileSize,
      @JsonKey(name: 'created_at') DateTime createdAt});
}

/// @nodoc
class __$$SourceItemImplCopyWithImpl<$Res>
    extends _$SourceItemCopyWithImpl<$Res, _$SourceItemImpl>
    implements _$$SourceItemImplCopyWith<$Res> {
  __$$SourceItemImplCopyWithImpl(
      _$SourceItemImpl _value, $Res Function(_$SourceItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of SourceItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? sessionId = null,
    Object? sourceType = null,
    Object? name = null,
    Object? contentPreview = null,
    Object? sourceUrl = freezed,
    Object? originalFilename = freezed,
    Object? fileSize = freezed,
    Object? createdAt = null,
  }) {
    return _then(_$SourceItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      sessionId: null == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String,
      sourceType: null == sourceType
          ? _value.sourceType
          : sourceType // ignore: cast_nullable_to_non_nullable
              as SourceType,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      contentPreview: null == contentPreview
          ? _value.contentPreview
          : contentPreview // ignore: cast_nullable_to_non_nullable
              as String,
      sourceUrl: freezed == sourceUrl
          ? _value.sourceUrl
          : sourceUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      originalFilename: freezed == originalFilename
          ? _value.originalFilename
          : originalFilename // ignore: cast_nullable_to_non_nullable
              as String?,
      fileSize: freezed == fileSize
          ? _value.fileSize
          : fileSize // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SourceItemImpl implements _SourceItem {
  const _$SourceItemImpl(
      {required this.id,
      @JsonKey(name: 'session_id') required this.sessionId,
      @JsonKey(name: 'source_type') required this.sourceType,
      required this.name,
      @JsonKey(name: 'content_preview') required this.contentPreview,
      @JsonKey(name: 'source_url') this.sourceUrl,
      @JsonKey(name: 'original_filename') this.originalFilename,
      @JsonKey(name: 'file_size') this.fileSize,
      @JsonKey(name: 'created_at') required this.createdAt});

  factory _$SourceItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$SourceItemImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'session_id')
  final String sessionId;
  @override
  @JsonKey(name: 'source_type')
  final SourceType sourceType;
  @override
  final String name;
  @override
  @JsonKey(name: 'content_preview')
  final String contentPreview;
  @override
  @JsonKey(name: 'source_url')
  final String? sourceUrl;
  @override
  @JsonKey(name: 'original_filename')
  final String? originalFilename;
  @override
  @JsonKey(name: 'file_size')
  final int? fileSize;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  @override
  String toString() {
    return 'SourceItem(id: $id, sessionId: $sessionId, sourceType: $sourceType, name: $name, contentPreview: $contentPreview, sourceUrl: $sourceUrl, originalFilename: $originalFilename, fileSize: $fileSize, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SourceItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.sourceType, sourceType) ||
                other.sourceType == sourceType) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.contentPreview, contentPreview) ||
                other.contentPreview == contentPreview) &&
            (identical(other.sourceUrl, sourceUrl) ||
                other.sourceUrl == sourceUrl) &&
            (identical(other.originalFilename, originalFilename) ||
                other.originalFilename == originalFilename) &&
            (identical(other.fileSize, fileSize) ||
                other.fileSize == fileSize) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, sessionId, sourceType, name,
      contentPreview, sourceUrl, originalFilename, fileSize, createdAt);

  /// Create a copy of SourceItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SourceItemImplCopyWith<_$SourceItemImpl> get copyWith =>
      __$$SourceItemImplCopyWithImpl<_$SourceItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SourceItemImplToJson(
      this,
    );
  }
}

abstract class _SourceItem implements SourceItem {
  const factory _SourceItem(
      {required final int id,
      @JsonKey(name: 'session_id') required final String sessionId,
      @JsonKey(name: 'source_type') required final SourceType sourceType,
      required final String name,
      @JsonKey(name: 'content_preview') required final String contentPreview,
      @JsonKey(name: 'source_url') final String? sourceUrl,
      @JsonKey(name: 'original_filename') final String? originalFilename,
      @JsonKey(name: 'file_size') final int? fileSize,
      @JsonKey(name: 'created_at')
      required final DateTime createdAt}) = _$SourceItemImpl;

  factory _SourceItem.fromJson(Map<String, dynamic> json) =
      _$SourceItemImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'session_id')
  String get sessionId;
  @override
  @JsonKey(name: 'source_type')
  SourceType get sourceType;
  @override
  String get name;
  @override
  @JsonKey(name: 'content_preview')
  String get contentPreview;
  @override
  @JsonKey(name: 'source_url')
  String? get sourceUrl;
  @override
  @JsonKey(name: 'original_filename')
  String? get originalFilename;
  @override
  @JsonKey(name: 'file_size')
  int? get fileSize;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;

  /// Create a copy of SourceItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SourceItemImplCopyWith<_$SourceItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
