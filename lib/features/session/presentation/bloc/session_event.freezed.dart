// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SessionEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getSessions,
    required TResult Function(int id) getSessionById,
    required TResult Function(String agentType, String name) createSession,
    required TResult Function(int id, String name) updateSessionName,
    required TResult Function(String id) deleteSession,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getSessions,
    TResult? Function(int id)? getSessionById,
    TResult? Function(String agentType, String name)? createSession,
    TResult? Function(int id, String name)? updateSessionName,
    TResult? Function(String id)? deleteSession,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getSessions,
    TResult Function(int id)? getSessionById,
    TResult Function(String agentType, String name)? createSession,
    TResult Function(int id, String name)? updateSessionName,
    TResult Function(String id)? deleteSession,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetSessionsEvent value) getSessions,
    required TResult Function(GetSessionByIdEvent value) getSessionById,
    required TResult Function(CreateSessionEvent value) createSession,
    required TResult Function(UpdateSessionNameEvent value) updateSessionName,
    required TResult Function(DeleteSessionEvent value) deleteSession,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetSessionsEvent value)? getSessions,
    TResult? Function(GetSessionByIdEvent value)? getSessionById,
    TResult? Function(CreateSessionEvent value)? createSession,
    TResult? Function(UpdateSessionNameEvent value)? updateSessionName,
    TResult? Function(DeleteSessionEvent value)? deleteSession,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetSessionsEvent value)? getSessions,
    TResult Function(GetSessionByIdEvent value)? getSessionById,
    TResult Function(CreateSessionEvent value)? createSession,
    TResult Function(UpdateSessionNameEvent value)? updateSessionName,
    TResult Function(DeleteSessionEvent value)? deleteSession,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SessionEventCopyWith<$Res> {
  factory $SessionEventCopyWith(
          SessionEvent value, $Res Function(SessionEvent) then) =
      _$SessionEventCopyWithImpl<$Res, SessionEvent>;
}

/// @nodoc
class _$SessionEventCopyWithImpl<$Res, $Val extends SessionEvent>
    implements $SessionEventCopyWith<$Res> {
  _$SessionEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SessionEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$GetSessionsEventImplCopyWith<$Res> {
  factory _$$GetSessionsEventImplCopyWith(_$GetSessionsEventImpl value,
          $Res Function(_$GetSessionsEventImpl) then) =
      __$$GetSessionsEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetSessionsEventImplCopyWithImpl<$Res>
    extends _$SessionEventCopyWithImpl<$Res, _$GetSessionsEventImpl>
    implements _$$GetSessionsEventImplCopyWith<$Res> {
  __$$GetSessionsEventImplCopyWithImpl(_$GetSessionsEventImpl _value,
      $Res Function(_$GetSessionsEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of SessionEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetSessionsEventImpl implements GetSessionsEvent {
  const _$GetSessionsEventImpl();

  @override
  String toString() {
    return 'SessionEvent.getSessions()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetSessionsEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getSessions,
    required TResult Function(int id) getSessionById,
    required TResult Function(String agentType, String name) createSession,
    required TResult Function(int id, String name) updateSessionName,
    required TResult Function(String id) deleteSession,
  }) {
    return getSessions();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getSessions,
    TResult? Function(int id)? getSessionById,
    TResult? Function(String agentType, String name)? createSession,
    TResult? Function(int id, String name)? updateSessionName,
    TResult? Function(String id)? deleteSession,
  }) {
    return getSessions?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getSessions,
    TResult Function(int id)? getSessionById,
    TResult Function(String agentType, String name)? createSession,
    TResult Function(int id, String name)? updateSessionName,
    TResult Function(String id)? deleteSession,
    required TResult orElse(),
  }) {
    if (getSessions != null) {
      return getSessions();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetSessionsEvent value) getSessions,
    required TResult Function(GetSessionByIdEvent value) getSessionById,
    required TResult Function(CreateSessionEvent value) createSession,
    required TResult Function(UpdateSessionNameEvent value) updateSessionName,
    required TResult Function(DeleteSessionEvent value) deleteSession,
  }) {
    return getSessions(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetSessionsEvent value)? getSessions,
    TResult? Function(GetSessionByIdEvent value)? getSessionById,
    TResult? Function(CreateSessionEvent value)? createSession,
    TResult? Function(UpdateSessionNameEvent value)? updateSessionName,
    TResult? Function(DeleteSessionEvent value)? deleteSession,
  }) {
    return getSessions?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetSessionsEvent value)? getSessions,
    TResult Function(GetSessionByIdEvent value)? getSessionById,
    TResult Function(CreateSessionEvent value)? createSession,
    TResult Function(UpdateSessionNameEvent value)? updateSessionName,
    TResult Function(DeleteSessionEvent value)? deleteSession,
    required TResult orElse(),
  }) {
    if (getSessions != null) {
      return getSessions(this);
    }
    return orElse();
  }
}

abstract class GetSessionsEvent implements SessionEvent {
  const factory GetSessionsEvent() = _$GetSessionsEventImpl;
}

/// @nodoc
abstract class _$$GetSessionByIdEventImplCopyWith<$Res> {
  factory _$$GetSessionByIdEventImplCopyWith(_$GetSessionByIdEventImpl value,
          $Res Function(_$GetSessionByIdEventImpl) then) =
      __$$GetSessionByIdEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$GetSessionByIdEventImplCopyWithImpl<$Res>
    extends _$SessionEventCopyWithImpl<$Res, _$GetSessionByIdEventImpl>
    implements _$$GetSessionByIdEventImplCopyWith<$Res> {
  __$$GetSessionByIdEventImplCopyWithImpl(_$GetSessionByIdEventImpl _value,
      $Res Function(_$GetSessionByIdEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of SessionEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$GetSessionByIdEventImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$GetSessionByIdEventImpl implements GetSessionByIdEvent {
  const _$GetSessionByIdEventImpl({required this.id});

  @override
  final int id;

  @override
  String toString() {
    return 'SessionEvent.getSessionById(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetSessionByIdEventImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  /// Create a copy of SessionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetSessionByIdEventImplCopyWith<_$GetSessionByIdEventImpl> get copyWith =>
      __$$GetSessionByIdEventImplCopyWithImpl<_$GetSessionByIdEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getSessions,
    required TResult Function(int id) getSessionById,
    required TResult Function(String agentType, String name) createSession,
    required TResult Function(int id, String name) updateSessionName,
    required TResult Function(String id) deleteSession,
  }) {
    return getSessionById(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getSessions,
    TResult? Function(int id)? getSessionById,
    TResult? Function(String agentType, String name)? createSession,
    TResult? Function(int id, String name)? updateSessionName,
    TResult? Function(String id)? deleteSession,
  }) {
    return getSessionById?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getSessions,
    TResult Function(int id)? getSessionById,
    TResult Function(String agentType, String name)? createSession,
    TResult Function(int id, String name)? updateSessionName,
    TResult Function(String id)? deleteSession,
    required TResult orElse(),
  }) {
    if (getSessionById != null) {
      return getSessionById(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetSessionsEvent value) getSessions,
    required TResult Function(GetSessionByIdEvent value) getSessionById,
    required TResult Function(CreateSessionEvent value) createSession,
    required TResult Function(UpdateSessionNameEvent value) updateSessionName,
    required TResult Function(DeleteSessionEvent value) deleteSession,
  }) {
    return getSessionById(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetSessionsEvent value)? getSessions,
    TResult? Function(GetSessionByIdEvent value)? getSessionById,
    TResult? Function(CreateSessionEvent value)? createSession,
    TResult? Function(UpdateSessionNameEvent value)? updateSessionName,
    TResult? Function(DeleteSessionEvent value)? deleteSession,
  }) {
    return getSessionById?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetSessionsEvent value)? getSessions,
    TResult Function(GetSessionByIdEvent value)? getSessionById,
    TResult Function(CreateSessionEvent value)? createSession,
    TResult Function(UpdateSessionNameEvent value)? updateSessionName,
    TResult Function(DeleteSessionEvent value)? deleteSession,
    required TResult orElse(),
  }) {
    if (getSessionById != null) {
      return getSessionById(this);
    }
    return orElse();
  }
}

abstract class GetSessionByIdEvent implements SessionEvent {
  const factory GetSessionByIdEvent({required final int id}) =
      _$GetSessionByIdEventImpl;

  int get id;

  /// Create a copy of SessionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetSessionByIdEventImplCopyWith<_$GetSessionByIdEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreateSessionEventImplCopyWith<$Res> {
  factory _$$CreateSessionEventImplCopyWith(_$CreateSessionEventImpl value,
          $Res Function(_$CreateSessionEventImpl) then) =
      __$$CreateSessionEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String agentType, String name});
}

/// @nodoc
class __$$CreateSessionEventImplCopyWithImpl<$Res>
    extends _$SessionEventCopyWithImpl<$Res, _$CreateSessionEventImpl>
    implements _$$CreateSessionEventImplCopyWith<$Res> {
  __$$CreateSessionEventImplCopyWithImpl(_$CreateSessionEventImpl _value,
      $Res Function(_$CreateSessionEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of SessionEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? agentType = null,
    Object? name = null,
  }) {
    return _then(_$CreateSessionEventImpl(
      agentType: null == agentType
          ? _value.agentType
          : agentType // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CreateSessionEventImpl implements CreateSessionEvent {
  const _$CreateSessionEventImpl({required this.agentType, required this.name});

  @override
  final String agentType;
  @override
  final String name;

  @override
  String toString() {
    return 'SessionEvent.createSession(agentType: $agentType, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateSessionEventImpl &&
            (identical(other.agentType, agentType) ||
                other.agentType == agentType) &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, agentType, name);

  /// Create a copy of SessionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateSessionEventImplCopyWith<_$CreateSessionEventImpl> get copyWith =>
      __$$CreateSessionEventImplCopyWithImpl<_$CreateSessionEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getSessions,
    required TResult Function(int id) getSessionById,
    required TResult Function(String agentType, String name) createSession,
    required TResult Function(int id, String name) updateSessionName,
    required TResult Function(String id) deleteSession,
  }) {
    return createSession(agentType, name);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getSessions,
    TResult? Function(int id)? getSessionById,
    TResult? Function(String agentType, String name)? createSession,
    TResult? Function(int id, String name)? updateSessionName,
    TResult? Function(String id)? deleteSession,
  }) {
    return createSession?.call(agentType, name);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getSessions,
    TResult Function(int id)? getSessionById,
    TResult Function(String agentType, String name)? createSession,
    TResult Function(int id, String name)? updateSessionName,
    TResult Function(String id)? deleteSession,
    required TResult orElse(),
  }) {
    if (createSession != null) {
      return createSession(agentType, name);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetSessionsEvent value) getSessions,
    required TResult Function(GetSessionByIdEvent value) getSessionById,
    required TResult Function(CreateSessionEvent value) createSession,
    required TResult Function(UpdateSessionNameEvent value) updateSessionName,
    required TResult Function(DeleteSessionEvent value) deleteSession,
  }) {
    return createSession(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetSessionsEvent value)? getSessions,
    TResult? Function(GetSessionByIdEvent value)? getSessionById,
    TResult? Function(CreateSessionEvent value)? createSession,
    TResult? Function(UpdateSessionNameEvent value)? updateSessionName,
    TResult? Function(DeleteSessionEvent value)? deleteSession,
  }) {
    return createSession?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetSessionsEvent value)? getSessions,
    TResult Function(GetSessionByIdEvent value)? getSessionById,
    TResult Function(CreateSessionEvent value)? createSession,
    TResult Function(UpdateSessionNameEvent value)? updateSessionName,
    TResult Function(DeleteSessionEvent value)? deleteSession,
    required TResult orElse(),
  }) {
    if (createSession != null) {
      return createSession(this);
    }
    return orElse();
  }
}

abstract class CreateSessionEvent implements SessionEvent {
  const factory CreateSessionEvent(
      {required final String agentType,
      required final String name}) = _$CreateSessionEventImpl;

  String get agentType;
  String get name;

  /// Create a copy of SessionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateSessionEventImplCopyWith<_$CreateSessionEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateSessionNameEventImplCopyWith<$Res> {
  factory _$$UpdateSessionNameEventImplCopyWith(
          _$UpdateSessionNameEventImpl value,
          $Res Function(_$UpdateSessionNameEventImpl) then) =
      __$$UpdateSessionNameEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class __$$UpdateSessionNameEventImplCopyWithImpl<$Res>
    extends _$SessionEventCopyWithImpl<$Res, _$UpdateSessionNameEventImpl>
    implements _$$UpdateSessionNameEventImplCopyWith<$Res> {
  __$$UpdateSessionNameEventImplCopyWithImpl(
      _$UpdateSessionNameEventImpl _value,
      $Res Function(_$UpdateSessionNameEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of SessionEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_$UpdateSessionNameEventImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UpdateSessionNameEventImpl implements UpdateSessionNameEvent {
  const _$UpdateSessionNameEventImpl({required this.id, required this.name});

  @override
  final int id;
  @override
  final String name;

  @override
  String toString() {
    return 'SessionEvent.updateSessionName(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateSessionNameEventImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  /// Create a copy of SessionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateSessionNameEventImplCopyWith<_$UpdateSessionNameEventImpl>
      get copyWith => __$$UpdateSessionNameEventImplCopyWithImpl<
          _$UpdateSessionNameEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getSessions,
    required TResult Function(int id) getSessionById,
    required TResult Function(String agentType, String name) createSession,
    required TResult Function(int id, String name) updateSessionName,
    required TResult Function(String id) deleteSession,
  }) {
    return updateSessionName(id, name);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getSessions,
    TResult? Function(int id)? getSessionById,
    TResult? Function(String agentType, String name)? createSession,
    TResult? Function(int id, String name)? updateSessionName,
    TResult? Function(String id)? deleteSession,
  }) {
    return updateSessionName?.call(id, name);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getSessions,
    TResult Function(int id)? getSessionById,
    TResult Function(String agentType, String name)? createSession,
    TResult Function(int id, String name)? updateSessionName,
    TResult Function(String id)? deleteSession,
    required TResult orElse(),
  }) {
    if (updateSessionName != null) {
      return updateSessionName(id, name);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetSessionsEvent value) getSessions,
    required TResult Function(GetSessionByIdEvent value) getSessionById,
    required TResult Function(CreateSessionEvent value) createSession,
    required TResult Function(UpdateSessionNameEvent value) updateSessionName,
    required TResult Function(DeleteSessionEvent value) deleteSession,
  }) {
    return updateSessionName(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetSessionsEvent value)? getSessions,
    TResult? Function(GetSessionByIdEvent value)? getSessionById,
    TResult? Function(CreateSessionEvent value)? createSession,
    TResult? Function(UpdateSessionNameEvent value)? updateSessionName,
    TResult? Function(DeleteSessionEvent value)? deleteSession,
  }) {
    return updateSessionName?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetSessionsEvent value)? getSessions,
    TResult Function(GetSessionByIdEvent value)? getSessionById,
    TResult Function(CreateSessionEvent value)? createSession,
    TResult Function(UpdateSessionNameEvent value)? updateSessionName,
    TResult Function(DeleteSessionEvent value)? deleteSession,
    required TResult orElse(),
  }) {
    if (updateSessionName != null) {
      return updateSessionName(this);
    }
    return orElse();
  }
}

abstract class UpdateSessionNameEvent implements SessionEvent {
  const factory UpdateSessionNameEvent(
      {required final int id,
      required final String name}) = _$UpdateSessionNameEventImpl;

  int get id;
  String get name;

  /// Create a copy of SessionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateSessionNameEventImplCopyWith<_$UpdateSessionNameEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteSessionEventImplCopyWith<$Res> {
  factory _$$DeleteSessionEventImplCopyWith(_$DeleteSessionEventImpl value,
          $Res Function(_$DeleteSessionEventImpl) then) =
      __$$DeleteSessionEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$DeleteSessionEventImplCopyWithImpl<$Res>
    extends _$SessionEventCopyWithImpl<$Res, _$DeleteSessionEventImpl>
    implements _$$DeleteSessionEventImplCopyWith<$Res> {
  __$$DeleteSessionEventImplCopyWithImpl(_$DeleteSessionEventImpl _value,
      $Res Function(_$DeleteSessionEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of SessionEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$DeleteSessionEventImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DeleteSessionEventImpl implements DeleteSessionEvent {
  const _$DeleteSessionEventImpl({required this.id});

  @override
  final String id;

  @override
  String toString() {
    return 'SessionEvent.deleteSession(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteSessionEventImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  /// Create a copy of SessionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteSessionEventImplCopyWith<_$DeleteSessionEventImpl> get copyWith =>
      __$$DeleteSessionEventImplCopyWithImpl<_$DeleteSessionEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getSessions,
    required TResult Function(int id) getSessionById,
    required TResult Function(String agentType, String name) createSession,
    required TResult Function(int id, String name) updateSessionName,
    required TResult Function(String id) deleteSession,
  }) {
    return deleteSession(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getSessions,
    TResult? Function(int id)? getSessionById,
    TResult? Function(String agentType, String name)? createSession,
    TResult? Function(int id, String name)? updateSessionName,
    TResult? Function(String id)? deleteSession,
  }) {
    return deleteSession?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getSessions,
    TResult Function(int id)? getSessionById,
    TResult Function(String agentType, String name)? createSession,
    TResult Function(int id, String name)? updateSessionName,
    TResult Function(String id)? deleteSession,
    required TResult orElse(),
  }) {
    if (deleteSession != null) {
      return deleteSession(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetSessionsEvent value) getSessions,
    required TResult Function(GetSessionByIdEvent value) getSessionById,
    required TResult Function(CreateSessionEvent value) createSession,
    required TResult Function(UpdateSessionNameEvent value) updateSessionName,
    required TResult Function(DeleteSessionEvent value) deleteSession,
  }) {
    return deleteSession(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetSessionsEvent value)? getSessions,
    TResult? Function(GetSessionByIdEvent value)? getSessionById,
    TResult? Function(CreateSessionEvent value)? createSession,
    TResult? Function(UpdateSessionNameEvent value)? updateSessionName,
    TResult? Function(DeleteSessionEvent value)? deleteSession,
  }) {
    return deleteSession?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetSessionsEvent value)? getSessions,
    TResult Function(GetSessionByIdEvent value)? getSessionById,
    TResult Function(CreateSessionEvent value)? createSession,
    TResult Function(UpdateSessionNameEvent value)? updateSessionName,
    TResult Function(DeleteSessionEvent value)? deleteSession,
    required TResult orElse(),
  }) {
    if (deleteSession != null) {
      return deleteSession(this);
    }
    return orElse();
  }
}

abstract class DeleteSessionEvent implements SessionEvent {
  const factory DeleteSessionEvent({required final String id}) =
      _$DeleteSessionEventImpl;

  String get id;

  /// Create a copy of SessionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeleteSessionEventImplCopyWith<_$DeleteSessionEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
