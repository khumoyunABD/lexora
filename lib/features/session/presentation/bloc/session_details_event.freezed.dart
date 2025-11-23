// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session_details_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SessionDetailsEvent {
  String get sessionId => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String sessionId) getMessages,
    required TResult Function(String sessionId) getSources,
    required TResult Function(String sessionId) getArtifacts,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String sessionId)? getMessages,
    TResult? Function(String sessionId)? getSources,
    TResult? Function(String sessionId)? getArtifacts,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String sessionId)? getMessages,
    TResult Function(String sessionId)? getSources,
    TResult Function(String sessionId)? getArtifacts,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetMessagesEvent value) getMessages,
    required TResult Function(GetSourcesEvent value) getSources,
    required TResult Function(GetArtifactsEvent value) getArtifacts,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetMessagesEvent value)? getMessages,
    TResult? Function(GetSourcesEvent value)? getSources,
    TResult? Function(GetArtifactsEvent value)? getArtifacts,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetMessagesEvent value)? getMessages,
    TResult Function(GetSourcesEvent value)? getSources,
    TResult Function(GetArtifactsEvent value)? getArtifacts,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of SessionDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SessionDetailsEventCopyWith<SessionDetailsEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SessionDetailsEventCopyWith<$Res> {
  factory $SessionDetailsEventCopyWith(
          SessionDetailsEvent value, $Res Function(SessionDetailsEvent) then) =
      _$SessionDetailsEventCopyWithImpl<$Res, SessionDetailsEvent>;
  @useResult
  $Res call({String sessionId});
}

/// @nodoc
class _$SessionDetailsEventCopyWithImpl<$Res, $Val extends SessionDetailsEvent>
    implements $SessionDetailsEventCopyWith<$Res> {
  _$SessionDetailsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SessionDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionId = null,
  }) {
    return _then(_value.copyWith(
      sessionId: null == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetMessagesEventImplCopyWith<$Res>
    implements $SessionDetailsEventCopyWith<$Res> {
  factory _$$GetMessagesEventImplCopyWith(_$GetMessagesEventImpl value,
          $Res Function(_$GetMessagesEventImpl) then) =
      __$$GetMessagesEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String sessionId});
}

/// @nodoc
class __$$GetMessagesEventImplCopyWithImpl<$Res>
    extends _$SessionDetailsEventCopyWithImpl<$Res, _$GetMessagesEventImpl>
    implements _$$GetMessagesEventImplCopyWith<$Res> {
  __$$GetMessagesEventImplCopyWithImpl(_$GetMessagesEventImpl _value,
      $Res Function(_$GetMessagesEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of SessionDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionId = null,
  }) {
    return _then(_$GetMessagesEventImpl(
      sessionId: null == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetMessagesEventImpl implements GetMessagesEvent {
  const _$GetMessagesEventImpl({required this.sessionId});

  @override
  final String sessionId;

  @override
  String toString() {
    return 'SessionDetailsEvent.getMessages(sessionId: $sessionId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetMessagesEventImpl &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, sessionId);

  /// Create a copy of SessionDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetMessagesEventImplCopyWith<_$GetMessagesEventImpl> get copyWith =>
      __$$GetMessagesEventImplCopyWithImpl<_$GetMessagesEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String sessionId) getMessages,
    required TResult Function(String sessionId) getSources,
    required TResult Function(String sessionId) getArtifacts,
  }) {
    return getMessages(sessionId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String sessionId)? getMessages,
    TResult? Function(String sessionId)? getSources,
    TResult? Function(String sessionId)? getArtifacts,
  }) {
    return getMessages?.call(sessionId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String sessionId)? getMessages,
    TResult Function(String sessionId)? getSources,
    TResult Function(String sessionId)? getArtifacts,
    required TResult orElse(),
  }) {
    if (getMessages != null) {
      return getMessages(sessionId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetMessagesEvent value) getMessages,
    required TResult Function(GetSourcesEvent value) getSources,
    required TResult Function(GetArtifactsEvent value) getArtifacts,
  }) {
    return getMessages(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetMessagesEvent value)? getMessages,
    TResult? Function(GetSourcesEvent value)? getSources,
    TResult? Function(GetArtifactsEvent value)? getArtifacts,
  }) {
    return getMessages?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetMessagesEvent value)? getMessages,
    TResult Function(GetSourcesEvent value)? getSources,
    TResult Function(GetArtifactsEvent value)? getArtifacts,
    required TResult orElse(),
  }) {
    if (getMessages != null) {
      return getMessages(this);
    }
    return orElse();
  }
}

abstract class GetMessagesEvent implements SessionDetailsEvent {
  const factory GetMessagesEvent({required final String sessionId}) =
      _$GetMessagesEventImpl;

  @override
  String get sessionId;

  /// Create a copy of SessionDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetMessagesEventImplCopyWith<_$GetMessagesEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetSourcesEventImplCopyWith<$Res>
    implements $SessionDetailsEventCopyWith<$Res> {
  factory _$$GetSourcesEventImplCopyWith(_$GetSourcesEventImpl value,
          $Res Function(_$GetSourcesEventImpl) then) =
      __$$GetSourcesEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String sessionId});
}

/// @nodoc
class __$$GetSourcesEventImplCopyWithImpl<$Res>
    extends _$SessionDetailsEventCopyWithImpl<$Res, _$GetSourcesEventImpl>
    implements _$$GetSourcesEventImplCopyWith<$Res> {
  __$$GetSourcesEventImplCopyWithImpl(
      _$GetSourcesEventImpl _value, $Res Function(_$GetSourcesEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of SessionDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionId = null,
  }) {
    return _then(_$GetSourcesEventImpl(
      sessionId: null == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetSourcesEventImpl implements GetSourcesEvent {
  const _$GetSourcesEventImpl({required this.sessionId});

  @override
  final String sessionId;

  @override
  String toString() {
    return 'SessionDetailsEvent.getSources(sessionId: $sessionId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetSourcesEventImpl &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, sessionId);

  /// Create a copy of SessionDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetSourcesEventImplCopyWith<_$GetSourcesEventImpl> get copyWith =>
      __$$GetSourcesEventImplCopyWithImpl<_$GetSourcesEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String sessionId) getMessages,
    required TResult Function(String sessionId) getSources,
    required TResult Function(String sessionId) getArtifacts,
  }) {
    return getSources(sessionId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String sessionId)? getMessages,
    TResult? Function(String sessionId)? getSources,
    TResult? Function(String sessionId)? getArtifacts,
  }) {
    return getSources?.call(sessionId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String sessionId)? getMessages,
    TResult Function(String sessionId)? getSources,
    TResult Function(String sessionId)? getArtifacts,
    required TResult orElse(),
  }) {
    if (getSources != null) {
      return getSources(sessionId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetMessagesEvent value) getMessages,
    required TResult Function(GetSourcesEvent value) getSources,
    required TResult Function(GetArtifactsEvent value) getArtifacts,
  }) {
    return getSources(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetMessagesEvent value)? getMessages,
    TResult? Function(GetSourcesEvent value)? getSources,
    TResult? Function(GetArtifactsEvent value)? getArtifacts,
  }) {
    return getSources?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetMessagesEvent value)? getMessages,
    TResult Function(GetSourcesEvent value)? getSources,
    TResult Function(GetArtifactsEvent value)? getArtifacts,
    required TResult orElse(),
  }) {
    if (getSources != null) {
      return getSources(this);
    }
    return orElse();
  }
}

abstract class GetSourcesEvent implements SessionDetailsEvent {
  const factory GetSourcesEvent({required final String sessionId}) =
      _$GetSourcesEventImpl;

  @override
  String get sessionId;

  /// Create a copy of SessionDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetSourcesEventImplCopyWith<_$GetSourcesEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetArtifactsEventImplCopyWith<$Res>
    implements $SessionDetailsEventCopyWith<$Res> {
  factory _$$GetArtifactsEventImplCopyWith(_$GetArtifactsEventImpl value,
          $Res Function(_$GetArtifactsEventImpl) then) =
      __$$GetArtifactsEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String sessionId});
}

/// @nodoc
class __$$GetArtifactsEventImplCopyWithImpl<$Res>
    extends _$SessionDetailsEventCopyWithImpl<$Res, _$GetArtifactsEventImpl>
    implements _$$GetArtifactsEventImplCopyWith<$Res> {
  __$$GetArtifactsEventImplCopyWithImpl(_$GetArtifactsEventImpl _value,
      $Res Function(_$GetArtifactsEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of SessionDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionId = null,
  }) {
    return _then(_$GetArtifactsEventImpl(
      sessionId: null == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetArtifactsEventImpl implements GetArtifactsEvent {
  const _$GetArtifactsEventImpl({required this.sessionId});

  @override
  final String sessionId;

  @override
  String toString() {
    return 'SessionDetailsEvent.getArtifacts(sessionId: $sessionId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetArtifactsEventImpl &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, sessionId);

  /// Create a copy of SessionDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetArtifactsEventImplCopyWith<_$GetArtifactsEventImpl> get copyWith =>
      __$$GetArtifactsEventImplCopyWithImpl<_$GetArtifactsEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String sessionId) getMessages,
    required TResult Function(String sessionId) getSources,
    required TResult Function(String sessionId) getArtifacts,
  }) {
    return getArtifacts(sessionId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String sessionId)? getMessages,
    TResult? Function(String sessionId)? getSources,
    TResult? Function(String sessionId)? getArtifacts,
  }) {
    return getArtifacts?.call(sessionId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String sessionId)? getMessages,
    TResult Function(String sessionId)? getSources,
    TResult Function(String sessionId)? getArtifacts,
    required TResult orElse(),
  }) {
    if (getArtifacts != null) {
      return getArtifacts(sessionId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetMessagesEvent value) getMessages,
    required TResult Function(GetSourcesEvent value) getSources,
    required TResult Function(GetArtifactsEvent value) getArtifacts,
  }) {
    return getArtifacts(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetMessagesEvent value)? getMessages,
    TResult? Function(GetSourcesEvent value)? getSources,
    TResult? Function(GetArtifactsEvent value)? getArtifacts,
  }) {
    return getArtifacts?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetMessagesEvent value)? getMessages,
    TResult Function(GetSourcesEvent value)? getSources,
    TResult Function(GetArtifactsEvent value)? getArtifacts,
    required TResult orElse(),
  }) {
    if (getArtifacts != null) {
      return getArtifacts(this);
    }
    return orElse();
  }
}

abstract class GetArtifactsEvent implements SessionDetailsEvent {
  const factory GetArtifactsEvent({required final String sessionId}) =
      _$GetArtifactsEventImpl;

  @override
  String get sessionId;

  /// Create a copy of SessionDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetArtifactsEventImplCopyWith<_$GetArtifactsEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
