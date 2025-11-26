// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChatRequest _$ChatRequestFromJson(Map<String, dynamic> json) {
  return _ChatRequest.fromJson(json);
}

/// @nodoc
mixin _$ChatRequest {
  List<ChatRequestMessage> get messages => throw _privateConstructorUsedError;
  List<dynamic> get sources => throw _privateConstructorUsedError;

  /// Serializes this ChatRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChatRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChatRequestCopyWith<ChatRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatRequestCopyWith<$Res> {
  factory $ChatRequestCopyWith(
          ChatRequest value, $Res Function(ChatRequest) then) =
      _$ChatRequestCopyWithImpl<$Res, ChatRequest>;
  @useResult
  $Res call({List<ChatRequestMessage> messages, List<dynamic> sources});
}

/// @nodoc
class _$ChatRequestCopyWithImpl<$Res, $Val extends ChatRequest>
    implements $ChatRequestCopyWith<$Res> {
  _$ChatRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messages = null,
    Object? sources = null,
  }) {
    return _then(_value.copyWith(
      messages: null == messages
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<ChatRequestMessage>,
      sources: null == sources
          ? _value.sources
          : sources // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatRequestImplCopyWith<$Res>
    implements $ChatRequestCopyWith<$Res> {
  factory _$$ChatRequestImplCopyWith(
          _$ChatRequestImpl value, $Res Function(_$ChatRequestImpl) then) =
      __$$ChatRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ChatRequestMessage> messages, List<dynamic> sources});
}

/// @nodoc
class __$$ChatRequestImplCopyWithImpl<$Res>
    extends _$ChatRequestCopyWithImpl<$Res, _$ChatRequestImpl>
    implements _$$ChatRequestImplCopyWith<$Res> {
  __$$ChatRequestImplCopyWithImpl(
      _$ChatRequestImpl _value, $Res Function(_$ChatRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messages = null,
    Object? sources = null,
  }) {
    return _then(_$ChatRequestImpl(
      messages: null == messages
          ? _value._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<ChatRequestMessage>,
      sources: null == sources
          ? _value._sources
          : sources // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatRequestImpl extends _ChatRequest {
  const _$ChatRequestImpl(
      {required final List<ChatRequestMessage> messages,
      final List<dynamic> sources = const []})
      : _messages = messages,
        _sources = sources,
        super._();

  factory _$ChatRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatRequestImplFromJson(json);

  final List<ChatRequestMessage> _messages;
  @override
  List<ChatRequestMessage> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  final List<dynamic> _sources;
  @override
  @JsonKey()
  List<dynamic> get sources {
    if (_sources is EqualUnmodifiableListView) return _sources;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sources);
  }

  @override
  String toString() {
    return 'ChatRequest(messages: $messages, sources: $sources)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatRequestImpl &&
            const DeepCollectionEquality().equals(other._messages, _messages) &&
            const DeepCollectionEquality().equals(other._sources, _sources));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_messages),
      const DeepCollectionEquality().hash(_sources));

  /// Create a copy of ChatRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatRequestImplCopyWith<_$ChatRequestImpl> get copyWith =>
      __$$ChatRequestImplCopyWithImpl<_$ChatRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatRequestImplToJson(
      this,
    );
  }
}

abstract class _ChatRequest extends ChatRequest {
  const factory _ChatRequest(
      {required final List<ChatRequestMessage> messages,
      final List<dynamic> sources}) = _$ChatRequestImpl;
  const _ChatRequest._() : super._();

  factory _ChatRequest.fromJson(Map<String, dynamic> json) =
      _$ChatRequestImpl.fromJson;

  @override
  List<ChatRequestMessage> get messages;
  @override
  List<dynamic> get sources;

  /// Create a copy of ChatRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatRequestImplCopyWith<_$ChatRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ChatRequestMessage _$ChatRequestMessageFromJson(Map<String, dynamic> json) {
  return _ChatRequestMessage.fromJson(json);
}

/// @nodoc
mixin _$ChatRequestMessage {
  String get role => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  List<dynamic> get artifacts => throw _privateConstructorUsedError;
  ChatRequestMetadata? get metadata => throw _privateConstructorUsedError;

  /// Serializes this ChatRequestMessage to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChatRequestMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChatRequestMessageCopyWith<ChatRequestMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatRequestMessageCopyWith<$Res> {
  factory $ChatRequestMessageCopyWith(
          ChatRequestMessage value, $Res Function(ChatRequestMessage) then) =
      _$ChatRequestMessageCopyWithImpl<$Res, ChatRequestMessage>;
  @useResult
  $Res call(
      {String role,
      String content,
      List<dynamic> artifacts,
      ChatRequestMetadata? metadata});

  $ChatRequestMetadataCopyWith<$Res>? get metadata;
}

/// @nodoc
class _$ChatRequestMessageCopyWithImpl<$Res, $Val extends ChatRequestMessage>
    implements $ChatRequestMessageCopyWith<$Res> {
  _$ChatRequestMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatRequestMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? role = null,
    Object? content = null,
    Object? artifacts = null,
    Object? metadata = freezed,
  }) {
    return _then(_value.copyWith(
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      artifacts: null == artifacts
          ? _value.artifacts
          : artifacts // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as ChatRequestMetadata?,
    ) as $Val);
  }

  /// Create a copy of ChatRequestMessage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChatRequestMetadataCopyWith<$Res>? get metadata {
    if (_value.metadata == null) {
      return null;
    }

    return $ChatRequestMetadataCopyWith<$Res>(_value.metadata!, (value) {
      return _then(_value.copyWith(metadata: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ChatRequestMessageImplCopyWith<$Res>
    implements $ChatRequestMessageCopyWith<$Res> {
  factory _$$ChatRequestMessageImplCopyWith(_$ChatRequestMessageImpl value,
          $Res Function(_$ChatRequestMessageImpl) then) =
      __$$ChatRequestMessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String role,
      String content,
      List<dynamic> artifacts,
      ChatRequestMetadata? metadata});

  @override
  $ChatRequestMetadataCopyWith<$Res>? get metadata;
}

/// @nodoc
class __$$ChatRequestMessageImplCopyWithImpl<$Res>
    extends _$ChatRequestMessageCopyWithImpl<$Res, _$ChatRequestMessageImpl>
    implements _$$ChatRequestMessageImplCopyWith<$Res> {
  __$$ChatRequestMessageImplCopyWithImpl(_$ChatRequestMessageImpl _value,
      $Res Function(_$ChatRequestMessageImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatRequestMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? role = null,
    Object? content = null,
    Object? artifacts = null,
    Object? metadata = freezed,
  }) {
    return _then(_$ChatRequestMessageImpl(
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      artifacts: null == artifacts
          ? _value._artifacts
          : artifacts // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as ChatRequestMetadata?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatRequestMessageImpl extends _ChatRequestMessage {
  const _$ChatRequestMessageImpl(
      {required this.role,
      required this.content,
      final List<dynamic> artifacts = const [],
      this.metadata})
      : _artifacts = artifacts,
        super._();

  factory _$ChatRequestMessageImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatRequestMessageImplFromJson(json);

  @override
  final String role;
  @override
  final String content;
  final List<dynamic> _artifacts;
  @override
  @JsonKey()
  List<dynamic> get artifacts {
    if (_artifacts is EqualUnmodifiableListView) return _artifacts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_artifacts);
  }

  @override
  final ChatRequestMetadata? metadata;

  @override
  String toString() {
    return 'ChatRequestMessage(role: $role, content: $content, artifacts: $artifacts, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatRequestMessageImpl &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.content, content) || other.content == content) &&
            const DeepCollectionEquality()
                .equals(other._artifacts, _artifacts) &&
            (identical(other.metadata, metadata) ||
                other.metadata == metadata));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, role, content,
      const DeepCollectionEquality().hash(_artifacts), metadata);

  /// Create a copy of ChatRequestMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatRequestMessageImplCopyWith<_$ChatRequestMessageImpl> get copyWith =>
      __$$ChatRequestMessageImplCopyWithImpl<_$ChatRequestMessageImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatRequestMessageImplToJson(
      this,
    );
  }
}

abstract class _ChatRequestMessage extends ChatRequestMessage {
  const factory _ChatRequestMessage(
      {required final String role,
      required final String content,
      final List<dynamic> artifacts,
      final ChatRequestMetadata? metadata}) = _$ChatRequestMessageImpl;
  const _ChatRequestMessage._() : super._();

  factory _ChatRequestMessage.fromJson(Map<String, dynamic> json) =
      _$ChatRequestMessageImpl.fromJson;

  @override
  String get role;
  @override
  String get content;
  @override
  List<dynamic> get artifacts;
  @override
  ChatRequestMetadata? get metadata;

  /// Create a copy of ChatRequestMessage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatRequestMessageImplCopyWith<_$ChatRequestMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ChatRequestMetadata _$ChatRequestMetadataFromJson(Map<String, dynamic> json) {
  return _ChatRequestMetadata.fromJson(json);
}

/// @nodoc
mixin _$ChatRequestMetadata {
  @JsonKey(name: 'sources_used')
  List<dynamic> get sourcesUsed => throw _privateConstructorUsedError;
  int get confidence => throw _privateConstructorUsedError;
  @JsonKey(name: 'processing_time')
  int get processingTime => throw _privateConstructorUsedError;

  /// Serializes this ChatRequestMetadata to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChatRequestMetadata
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChatRequestMetadataCopyWith<ChatRequestMetadata> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatRequestMetadataCopyWith<$Res> {
  factory $ChatRequestMetadataCopyWith(
          ChatRequestMetadata value, $Res Function(ChatRequestMetadata) then) =
      _$ChatRequestMetadataCopyWithImpl<$Res, ChatRequestMetadata>;
  @useResult
  $Res call(
      {@JsonKey(name: 'sources_used') List<dynamic> sourcesUsed,
      int confidence,
      @JsonKey(name: 'processing_time') int processingTime});
}

/// @nodoc
class _$ChatRequestMetadataCopyWithImpl<$Res, $Val extends ChatRequestMetadata>
    implements $ChatRequestMetadataCopyWith<$Res> {
  _$ChatRequestMetadataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatRequestMetadata
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sourcesUsed = null,
    Object? confidence = null,
    Object? processingTime = null,
  }) {
    return _then(_value.copyWith(
      sourcesUsed: null == sourcesUsed
          ? _value.sourcesUsed
          : sourcesUsed // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      confidence: null == confidence
          ? _value.confidence
          : confidence // ignore: cast_nullable_to_non_nullable
              as int,
      processingTime: null == processingTime
          ? _value.processingTime
          : processingTime // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatRequestMetadataImplCopyWith<$Res>
    implements $ChatRequestMetadataCopyWith<$Res> {
  factory _$$ChatRequestMetadataImplCopyWith(_$ChatRequestMetadataImpl value,
          $Res Function(_$ChatRequestMetadataImpl) then) =
      __$$ChatRequestMetadataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'sources_used') List<dynamic> sourcesUsed,
      int confidence,
      @JsonKey(name: 'processing_time') int processingTime});
}

/// @nodoc
class __$$ChatRequestMetadataImplCopyWithImpl<$Res>
    extends _$ChatRequestMetadataCopyWithImpl<$Res, _$ChatRequestMetadataImpl>
    implements _$$ChatRequestMetadataImplCopyWith<$Res> {
  __$$ChatRequestMetadataImplCopyWithImpl(_$ChatRequestMetadataImpl _value,
      $Res Function(_$ChatRequestMetadataImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatRequestMetadata
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sourcesUsed = null,
    Object? confidence = null,
    Object? processingTime = null,
  }) {
    return _then(_$ChatRequestMetadataImpl(
      sourcesUsed: null == sourcesUsed
          ? _value._sourcesUsed
          : sourcesUsed // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      confidence: null == confidence
          ? _value.confidence
          : confidence // ignore: cast_nullable_to_non_nullable
              as int,
      processingTime: null == processingTime
          ? _value.processingTime
          : processingTime // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatRequestMetadataImpl extends _ChatRequestMetadata {
  const _$ChatRequestMetadataImpl(
      {@JsonKey(name: 'sources_used')
      final List<dynamic> sourcesUsed = const [],
      this.confidence = 1,
      @JsonKey(name: 'processing_time') this.processingTime = 0})
      : _sourcesUsed = sourcesUsed,
        super._();

  factory _$ChatRequestMetadataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatRequestMetadataImplFromJson(json);

  final List<dynamic> _sourcesUsed;
  @override
  @JsonKey(name: 'sources_used')
  List<dynamic> get sourcesUsed {
    if (_sourcesUsed is EqualUnmodifiableListView) return _sourcesUsed;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sourcesUsed);
  }

  @override
  @JsonKey()
  final int confidence;
  @override
  @JsonKey(name: 'processing_time')
  final int processingTime;

  @override
  String toString() {
    return 'ChatRequestMetadata(sourcesUsed: $sourcesUsed, confidence: $confidence, processingTime: $processingTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatRequestMetadataImpl &&
            const DeepCollectionEquality()
                .equals(other._sourcesUsed, _sourcesUsed) &&
            (identical(other.confidence, confidence) ||
                other.confidence == confidence) &&
            (identical(other.processingTime, processingTime) ||
                other.processingTime == processingTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_sourcesUsed),
      confidence,
      processingTime);

  /// Create a copy of ChatRequestMetadata
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatRequestMetadataImplCopyWith<_$ChatRequestMetadataImpl> get copyWith =>
      __$$ChatRequestMetadataImplCopyWithImpl<_$ChatRequestMetadataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatRequestMetadataImplToJson(
      this,
    );
  }
}

abstract class _ChatRequestMetadata extends ChatRequestMetadata {
  const factory _ChatRequestMetadata(
          {@JsonKey(name: 'sources_used') final List<dynamic> sourcesUsed,
          final int confidence,
          @JsonKey(name: 'processing_time') final int processingTime}) =
      _$ChatRequestMetadataImpl;
  const _ChatRequestMetadata._() : super._();

  factory _ChatRequestMetadata.fromJson(Map<String, dynamic> json) =
      _$ChatRequestMetadataImpl.fromJson;

  @override
  @JsonKey(name: 'sources_used')
  List<dynamic> get sourcesUsed;
  @override
  int get confidence;
  @override
  @JsonKey(name: 'processing_time')
  int get processingTime;

  /// Create a copy of ChatRequestMetadata
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatRequestMetadataImplCopyWith<_$ChatRequestMetadataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
