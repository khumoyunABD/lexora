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
    required TResult Function(String title, String? description) createSession,
    required TResult Function(
            int id, String? title, String? description, String? status)
        updateSession,
    required TResult Function(String id) deleteSession,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getSessions,
    TResult? Function(int id)? getSessionById,
    TResult? Function(String title, String? description)? createSession,
    TResult? Function(
            int id, String? title, String? description, String? status)?
        updateSession,
    TResult? Function(String id)? deleteSession,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getSessions,
    TResult Function(int id)? getSessionById,
    TResult Function(String title, String? description)? createSession,
    TResult Function(
            int id, String? title, String? description, String? status)?
        updateSession,
    TResult Function(String id)? deleteSession,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetSessionsEvent value) getSessions,
    required TResult Function(GetSessionByIdEvent value) getSessionById,
    required TResult Function(CreateSessionEvent value) createSession,
    required TResult Function(UpdateSessionEvent value) updateSession,
    required TResult Function(DeleteSessionEvent value) deleteSession,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetSessionsEvent value)? getSessions,
    TResult? Function(GetSessionByIdEvent value)? getSessionById,
    TResult? Function(CreateSessionEvent value)? createSession,
    TResult? Function(UpdateSessionEvent value)? updateSession,
    TResult? Function(DeleteSessionEvent value)? deleteSession,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetSessionsEvent value)? getSessions,
    TResult Function(GetSessionByIdEvent value)? getSessionById,
    TResult Function(CreateSessionEvent value)? createSession,
    TResult Function(UpdateSessionEvent value)? updateSession,
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
    required TResult Function(String title, String? description) createSession,
    required TResult Function(
            int id, String? title, String? description, String? status)
        updateSession,
    required TResult Function(String id) deleteSession,
  }) {
    return getSessions();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getSessions,
    TResult? Function(int id)? getSessionById,
    TResult? Function(String title, String? description)? createSession,
    TResult? Function(
            int id, String? title, String? description, String? status)?
        updateSession,
    TResult? Function(String id)? deleteSession,
  }) {
    return getSessions?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getSessions,
    TResult Function(int id)? getSessionById,
    TResult Function(String title, String? description)? createSession,
    TResult Function(
            int id, String? title, String? description, String? status)?
        updateSession,
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
    required TResult Function(UpdateSessionEvent value) updateSession,
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
    TResult? Function(UpdateSessionEvent value)? updateSession,
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
    TResult Function(UpdateSessionEvent value)? updateSession,
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
    required TResult Function(String title, String? description) createSession,
    required TResult Function(
            int id, String? title, String? description, String? status)
        updateSession,
    required TResult Function(String id) deleteSession,
  }) {
    return getSessionById(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getSessions,
    TResult? Function(int id)? getSessionById,
    TResult? Function(String title, String? description)? createSession,
    TResult? Function(
            int id, String? title, String? description, String? status)?
        updateSession,
    TResult? Function(String id)? deleteSession,
  }) {
    return getSessionById?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getSessions,
    TResult Function(int id)? getSessionById,
    TResult Function(String title, String? description)? createSession,
    TResult Function(
            int id, String? title, String? description, String? status)?
        updateSession,
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
    required TResult Function(UpdateSessionEvent value) updateSession,
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
    TResult? Function(UpdateSessionEvent value)? updateSession,
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
    TResult Function(UpdateSessionEvent value)? updateSession,
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
  $Res call({String title, String? description});
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
    Object? title = null,
    Object? description = freezed,
  }) {
    return _then(_$CreateSessionEventImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$CreateSessionEventImpl implements CreateSessionEvent {
  const _$CreateSessionEventImpl({required this.title, this.description});

  @override
  final String title;
  @override
  final String? description;

  @override
  String toString() {
    return 'SessionEvent.createSession(title: $title, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateSessionEventImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, description);

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
    required TResult Function(String title, String? description) createSession,
    required TResult Function(
            int id, String? title, String? description, String? status)
        updateSession,
    required TResult Function(String id) deleteSession,
  }) {
    return createSession(title, description);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getSessions,
    TResult? Function(int id)? getSessionById,
    TResult? Function(String title, String? description)? createSession,
    TResult? Function(
            int id, String? title, String? description, String? status)?
        updateSession,
    TResult? Function(String id)? deleteSession,
  }) {
    return createSession?.call(title, description);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getSessions,
    TResult Function(int id)? getSessionById,
    TResult Function(String title, String? description)? createSession,
    TResult Function(
            int id, String? title, String? description, String? status)?
        updateSession,
    TResult Function(String id)? deleteSession,
    required TResult orElse(),
  }) {
    if (createSession != null) {
      return createSession(title, description);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetSessionsEvent value) getSessions,
    required TResult Function(GetSessionByIdEvent value) getSessionById,
    required TResult Function(CreateSessionEvent value) createSession,
    required TResult Function(UpdateSessionEvent value) updateSession,
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
    TResult? Function(UpdateSessionEvent value)? updateSession,
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
    TResult Function(UpdateSessionEvent value)? updateSession,
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
      {required final String title,
      final String? description}) = _$CreateSessionEventImpl;

  String get title;
  String? get description;

  /// Create a copy of SessionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateSessionEventImplCopyWith<_$CreateSessionEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateSessionEventImplCopyWith<$Res> {
  factory _$$UpdateSessionEventImplCopyWith(_$UpdateSessionEventImpl value,
          $Res Function(_$UpdateSessionEventImpl) then) =
      __$$UpdateSessionEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id, String? title, String? description, String? status});
}

/// @nodoc
class __$$UpdateSessionEventImplCopyWithImpl<$Res>
    extends _$SessionEventCopyWithImpl<$Res, _$UpdateSessionEventImpl>
    implements _$$UpdateSessionEventImplCopyWith<$Res> {
  __$$UpdateSessionEventImplCopyWithImpl(_$UpdateSessionEventImpl _value,
      $Res Function(_$UpdateSessionEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of SessionEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = freezed,
    Object? description = freezed,
    Object? status = freezed,
  }) {
    return _then(_$UpdateSessionEventImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$UpdateSessionEventImpl implements UpdateSessionEvent {
  const _$UpdateSessionEventImpl(
      {required this.id, this.title, this.description, this.status});

  @override
  final int id;
  @override
  final String? title;
  @override
  final String? description;
  @override
  final String? status;

  @override
  String toString() {
    return 'SessionEvent.updateSession(id: $id, title: $title, description: $description, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateSessionEventImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, title, description, status);

  /// Create a copy of SessionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateSessionEventImplCopyWith<_$UpdateSessionEventImpl> get copyWith =>
      __$$UpdateSessionEventImplCopyWithImpl<_$UpdateSessionEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getSessions,
    required TResult Function(int id) getSessionById,
    required TResult Function(String title, String? description) createSession,
    required TResult Function(
            int id, String? title, String? description, String? status)
        updateSession,
    required TResult Function(String id) deleteSession,
  }) {
    return updateSession(id, title, description, status);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getSessions,
    TResult? Function(int id)? getSessionById,
    TResult? Function(String title, String? description)? createSession,
    TResult? Function(
            int id, String? title, String? description, String? status)?
        updateSession,
    TResult? Function(String id)? deleteSession,
  }) {
    return updateSession?.call(id, title, description, status);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getSessions,
    TResult Function(int id)? getSessionById,
    TResult Function(String title, String? description)? createSession,
    TResult Function(
            int id, String? title, String? description, String? status)?
        updateSession,
    TResult Function(String id)? deleteSession,
    required TResult orElse(),
  }) {
    if (updateSession != null) {
      return updateSession(id, title, description, status);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetSessionsEvent value) getSessions,
    required TResult Function(GetSessionByIdEvent value) getSessionById,
    required TResult Function(CreateSessionEvent value) createSession,
    required TResult Function(UpdateSessionEvent value) updateSession,
    required TResult Function(DeleteSessionEvent value) deleteSession,
  }) {
    return updateSession(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetSessionsEvent value)? getSessions,
    TResult? Function(GetSessionByIdEvent value)? getSessionById,
    TResult? Function(CreateSessionEvent value)? createSession,
    TResult? Function(UpdateSessionEvent value)? updateSession,
    TResult? Function(DeleteSessionEvent value)? deleteSession,
  }) {
    return updateSession?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetSessionsEvent value)? getSessions,
    TResult Function(GetSessionByIdEvent value)? getSessionById,
    TResult Function(CreateSessionEvent value)? createSession,
    TResult Function(UpdateSessionEvent value)? updateSession,
    TResult Function(DeleteSessionEvent value)? deleteSession,
    required TResult orElse(),
  }) {
    if (updateSession != null) {
      return updateSession(this);
    }
    return orElse();
  }
}

abstract class UpdateSessionEvent implements SessionEvent {
  const factory UpdateSessionEvent(
      {required final int id,
      final String? title,
      final String? description,
      final String? status}) = _$UpdateSessionEventImpl;

  int get id;
  String? get title;
  String? get description;
  String? get status;

  /// Create a copy of SessionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateSessionEventImplCopyWith<_$UpdateSessionEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
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
    required TResult Function(String title, String? description) createSession,
    required TResult Function(
            int id, String? title, String? description, String? status)
        updateSession,
    required TResult Function(String id) deleteSession,
  }) {
    return deleteSession(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getSessions,
    TResult? Function(int id)? getSessionById,
    TResult? Function(String title, String? description)? createSession,
    TResult? Function(
            int id, String? title, String? description, String? status)?
        updateSession,
    TResult? Function(String id)? deleteSession,
  }) {
    return deleteSession?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getSessions,
    TResult Function(int id)? getSessionById,
    TResult Function(String title, String? description)? createSession,
    TResult Function(
            int id, String? title, String? description, String? status)?
        updateSession,
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
    required TResult Function(UpdateSessionEvent value) updateSession,
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
    TResult? Function(UpdateSessionEvent value)? updateSession,
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
    TResult Function(UpdateSessionEvent value)? updateSession,
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
