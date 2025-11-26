// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChatResponse _$ChatResponseFromJson(Map<String, dynamic> json) {
  return _ChatResponse.fromJson(json);
}

/// @nodoc
mixin _$ChatResponse {
  List<ChatMessage> get messages => throw _privateConstructorUsedError;
  @JsonKey(name: 'session_id')
  String get sessionId => throw _privateConstructorUsedError;

  /// Serializes this ChatResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChatResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChatResponseCopyWith<ChatResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatResponseCopyWith<$Res> {
  factory $ChatResponseCopyWith(
          ChatResponse value, $Res Function(ChatResponse) then) =
      _$ChatResponseCopyWithImpl<$Res, ChatResponse>;
  @useResult
  $Res call(
      {List<ChatMessage> messages,
      @JsonKey(name: 'session_id') String sessionId});
}

/// @nodoc
class _$ChatResponseCopyWithImpl<$Res, $Val extends ChatResponse>
    implements $ChatResponseCopyWith<$Res> {
  _$ChatResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messages = null,
    Object? sessionId = null,
  }) {
    return _then(_value.copyWith(
      messages: null == messages
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<ChatMessage>,
      sessionId: null == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatResponseImplCopyWith<$Res>
    implements $ChatResponseCopyWith<$Res> {
  factory _$$ChatResponseImplCopyWith(
          _$ChatResponseImpl value, $Res Function(_$ChatResponseImpl) then) =
      __$$ChatResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<ChatMessage> messages,
      @JsonKey(name: 'session_id') String sessionId});
}

/// @nodoc
class __$$ChatResponseImplCopyWithImpl<$Res>
    extends _$ChatResponseCopyWithImpl<$Res, _$ChatResponseImpl>
    implements _$$ChatResponseImplCopyWith<$Res> {
  __$$ChatResponseImplCopyWithImpl(
      _$ChatResponseImpl _value, $Res Function(_$ChatResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messages = null,
    Object? sessionId = null,
  }) {
    return _then(_$ChatResponseImpl(
      messages: null == messages
          ? _value._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<ChatMessage>,
      sessionId: null == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatResponseImpl extends _ChatResponse {
  const _$ChatResponseImpl(
      {required final List<ChatMessage> messages,
      @JsonKey(name: 'session_id') required this.sessionId})
      : _messages = messages,
        super._();

  factory _$ChatResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatResponseImplFromJson(json);

  final List<ChatMessage> _messages;
  @override
  List<ChatMessage> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  @override
  @JsonKey(name: 'session_id')
  final String sessionId;

  @override
  String toString() {
    return 'ChatResponse(messages: $messages, sessionId: $sessionId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatResponseImpl &&
            const DeepCollectionEquality().equals(other._messages, _messages) &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_messages), sessionId);

  /// Create a copy of ChatResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatResponseImplCopyWith<_$ChatResponseImpl> get copyWith =>
      __$$ChatResponseImplCopyWithImpl<_$ChatResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatResponseImplToJson(
      this,
    );
  }
}

abstract class _ChatResponse extends ChatResponse {
  const factory _ChatResponse(
          {required final List<ChatMessage> messages,
          @JsonKey(name: 'session_id') required final String sessionId}) =
      _$ChatResponseImpl;
  const _ChatResponse._() : super._();

  factory _ChatResponse.fromJson(Map<String, dynamic> json) =
      _$ChatResponseImpl.fromJson;

  @override
  List<ChatMessage> get messages;
  @override
  @JsonKey(name: 'session_id')
  String get sessionId;

  /// Create a copy of ChatResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatResponseImplCopyWith<_$ChatResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ChatMessage _$ChatMessageFromJson(Map<String, dynamic> json) {
  return _ChatMessage.fromJson(json);
}

/// @nodoc
mixin _$ChatMessage {
  String get role => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  List<dynamic> get artifacts => throw _privateConstructorUsedError;
  ChatMetadata? get metadata => throw _privateConstructorUsedError;

  /// Serializes this ChatMessage to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChatMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChatMessageCopyWith<ChatMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatMessageCopyWith<$Res> {
  factory $ChatMessageCopyWith(
          ChatMessage value, $Res Function(ChatMessage) then) =
      _$ChatMessageCopyWithImpl<$Res, ChatMessage>;
  @useResult
  $Res call(
      {String role,
      String content,
      List<dynamic> artifacts,
      ChatMetadata? metadata});

  $ChatMetadataCopyWith<$Res>? get metadata;
}

/// @nodoc
class _$ChatMessageCopyWithImpl<$Res, $Val extends ChatMessage>
    implements $ChatMessageCopyWith<$Res> {
  _$ChatMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatMessage
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
              as ChatMetadata?,
    ) as $Val);
  }

  /// Create a copy of ChatMessage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChatMetadataCopyWith<$Res>? get metadata {
    if (_value.metadata == null) {
      return null;
    }

    return $ChatMetadataCopyWith<$Res>(_value.metadata!, (value) {
      return _then(_value.copyWith(metadata: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ChatMessageImplCopyWith<$Res>
    implements $ChatMessageCopyWith<$Res> {
  factory _$$ChatMessageImplCopyWith(
          _$ChatMessageImpl value, $Res Function(_$ChatMessageImpl) then) =
      __$$ChatMessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String role,
      String content,
      List<dynamic> artifacts,
      ChatMetadata? metadata});

  @override
  $ChatMetadataCopyWith<$Res>? get metadata;
}

/// @nodoc
class __$$ChatMessageImplCopyWithImpl<$Res>
    extends _$ChatMessageCopyWithImpl<$Res, _$ChatMessageImpl>
    implements _$$ChatMessageImplCopyWith<$Res> {
  __$$ChatMessageImplCopyWithImpl(
      _$ChatMessageImpl _value, $Res Function(_$ChatMessageImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? role = null,
    Object? content = null,
    Object? artifacts = null,
    Object? metadata = freezed,
  }) {
    return _then(_$ChatMessageImpl(
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
              as ChatMetadata?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatMessageImpl extends _ChatMessage {
  const _$ChatMessageImpl(
      {required this.role,
      required this.content,
      final List<dynamic> artifacts = const [],
      this.metadata})
      : _artifacts = artifacts,
        super._();

  factory _$ChatMessageImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatMessageImplFromJson(json);

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
  final ChatMetadata? metadata;

  @override
  String toString() {
    return 'ChatMessage(role: $role, content: $content, artifacts: $artifacts, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatMessageImpl &&
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

  /// Create a copy of ChatMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatMessageImplCopyWith<_$ChatMessageImpl> get copyWith =>
      __$$ChatMessageImplCopyWithImpl<_$ChatMessageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatMessageImplToJson(
      this,
    );
  }
}

abstract class _ChatMessage extends ChatMessage {
  const factory _ChatMessage(
      {required final String role,
      required final String content,
      final List<dynamic> artifacts,
      final ChatMetadata? metadata}) = _$ChatMessageImpl;
  const _ChatMessage._() : super._();

  factory _ChatMessage.fromJson(Map<String, dynamic> json) =
      _$ChatMessageImpl.fromJson;

  @override
  String get role;
  @override
  String get content;
  @override
  List<dynamic> get artifacts;
  @override
  ChatMetadata? get metadata;

  /// Create a copy of ChatMessage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatMessageImplCopyWith<_$ChatMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ChatMetadata _$ChatMetadataFromJson(Map<String, dynamic> json) {
  return _ChatMetadata.fromJson(json);
}

/// @nodoc
mixin _$ChatMetadata {
  @JsonKey(name: 'sources_used')
  List<dynamic> get sourcesUsed => throw _privateConstructorUsedError;
  double get confidence => throw _privateConstructorUsedError;
  @JsonKey(name: 'processing_time')
  double get processingTime => throw _privateConstructorUsedError;

  /// Serializes this ChatMetadata to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChatMetadata
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChatMetadataCopyWith<ChatMetadata> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatMetadataCopyWith<$Res> {
  factory $ChatMetadataCopyWith(
          ChatMetadata value, $Res Function(ChatMetadata) then) =
      _$ChatMetadataCopyWithImpl<$Res, ChatMetadata>;
  @useResult
  $Res call(
      {@JsonKey(name: 'sources_used') List<dynamic> sourcesUsed,
      double confidence,
      @JsonKey(name: 'processing_time') double processingTime});
}

/// @nodoc
class _$ChatMetadataCopyWithImpl<$Res, $Val extends ChatMetadata>
    implements $ChatMetadataCopyWith<$Res> {
  _$ChatMetadataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatMetadata
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
              as double,
      processingTime: null == processingTime
          ? _value.processingTime
          : processingTime // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatMetadataImplCopyWith<$Res>
    implements $ChatMetadataCopyWith<$Res> {
  factory _$$ChatMetadataImplCopyWith(
          _$ChatMetadataImpl value, $Res Function(_$ChatMetadataImpl) then) =
      __$$ChatMetadataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'sources_used') List<dynamic> sourcesUsed,
      double confidence,
      @JsonKey(name: 'processing_time') double processingTime});
}

/// @nodoc
class __$$ChatMetadataImplCopyWithImpl<$Res>
    extends _$ChatMetadataCopyWithImpl<$Res, _$ChatMetadataImpl>
    implements _$$ChatMetadataImplCopyWith<$Res> {
  __$$ChatMetadataImplCopyWithImpl(
      _$ChatMetadataImpl _value, $Res Function(_$ChatMetadataImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatMetadata
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sourcesUsed = null,
    Object? confidence = null,
    Object? processingTime = null,
  }) {
    return _then(_$ChatMetadataImpl(
      sourcesUsed: null == sourcesUsed
          ? _value._sourcesUsed
          : sourcesUsed // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      confidence: null == confidence
          ? _value.confidence
          : confidence // ignore: cast_nullable_to_non_nullable
              as double,
      processingTime: null == processingTime
          ? _value.processingTime
          : processingTime // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatMetadataImpl extends _ChatMetadata {
  const _$ChatMetadataImpl(
      {@JsonKey(name: 'sources_used')
      final List<dynamic> sourcesUsed = const [],
      this.confidence = 1.0,
      @JsonKey(name: 'processing_time') this.processingTime = 0.0})
      : _sourcesUsed = sourcesUsed,
        super._();

  factory _$ChatMetadataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatMetadataImplFromJson(json);

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
  final double confidence;
  @override
  @JsonKey(name: 'processing_time')
  final double processingTime;

  @override
  String toString() {
    return 'ChatMetadata(sourcesUsed: $sourcesUsed, confidence: $confidence, processingTime: $processingTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatMetadataImpl &&
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

  /// Create a copy of ChatMetadata
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatMetadataImplCopyWith<_$ChatMetadataImpl> get copyWith =>
      __$$ChatMetadataImplCopyWithImpl<_$ChatMetadataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatMetadataImplToJson(
      this,
    );
  }
}

abstract class _ChatMetadata extends ChatMetadata {
  const factory _ChatMetadata(
          {@JsonKey(name: 'sources_used') final List<dynamic> sourcesUsed,
          final double confidence,
          @JsonKey(name: 'processing_time') final double processingTime}) =
      _$ChatMetadataImpl;
  const _ChatMetadata._() : super._();

  factory _ChatMetadata.fromJson(Map<String, dynamic> json) =
      _$ChatMetadataImpl.fromJson;

  @override
  @JsonKey(name: 'sources_used')
  List<dynamic> get sourcesUsed;
  @override
  double get confidence;
  @override
  @JsonKey(name: 'processing_time')
  double get processingTime;

  /// Create a copy of ChatMetadata
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatMetadataImplCopyWith<_$ChatMetadataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
