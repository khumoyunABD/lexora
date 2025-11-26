// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_session_name_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UpdateSessionNameRequest _$UpdateSessionNameRequestFromJson(
    Map<String, dynamic> json) {
  return _UpdateSessionNameRequest.fromJson(json);
}

/// @nodoc
mixin _$UpdateSessionNameRequest {
  String get name => throw _privateConstructorUsedError;

  /// Serializes this UpdateSessionNameRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UpdateSessionNameRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdateSessionNameRequestCopyWith<UpdateSessionNameRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateSessionNameRequestCopyWith<$Res> {
  factory $UpdateSessionNameRequestCopyWith(UpdateSessionNameRequest value,
          $Res Function(UpdateSessionNameRequest) then) =
      _$UpdateSessionNameRequestCopyWithImpl<$Res, UpdateSessionNameRequest>;
  @useResult
  $Res call({String name});
}

/// @nodoc
class _$UpdateSessionNameRequestCopyWithImpl<$Res,
        $Val extends UpdateSessionNameRequest>
    implements $UpdateSessionNameRequestCopyWith<$Res> {
  _$UpdateSessionNameRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdateSessionNameRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdateSessionNameRequestImplCopyWith<$Res>
    implements $UpdateSessionNameRequestCopyWith<$Res> {
  factory _$$UpdateSessionNameRequestImplCopyWith(
          _$UpdateSessionNameRequestImpl value,
          $Res Function(_$UpdateSessionNameRequestImpl) then) =
      __$$UpdateSessionNameRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name});
}

/// @nodoc
class __$$UpdateSessionNameRequestImplCopyWithImpl<$Res>
    extends _$UpdateSessionNameRequestCopyWithImpl<$Res,
        _$UpdateSessionNameRequestImpl>
    implements _$$UpdateSessionNameRequestImplCopyWith<$Res> {
  __$$UpdateSessionNameRequestImplCopyWithImpl(
      _$UpdateSessionNameRequestImpl _value,
      $Res Function(_$UpdateSessionNameRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of UpdateSessionNameRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_$UpdateSessionNameRequestImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdateSessionNameRequestImpl implements _UpdateSessionNameRequest {
  const _$UpdateSessionNameRequestImpl({required this.name});

  factory _$UpdateSessionNameRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateSessionNameRequestImplFromJson(json);

  @override
  final String name;

  @override
  String toString() {
    return 'UpdateSessionNameRequest(name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateSessionNameRequestImpl &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name);

  /// Create a copy of UpdateSessionNameRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateSessionNameRequestImplCopyWith<_$UpdateSessionNameRequestImpl>
      get copyWith => __$$UpdateSessionNameRequestImplCopyWithImpl<
          _$UpdateSessionNameRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateSessionNameRequestImplToJson(
      this,
    );
  }
}

abstract class _UpdateSessionNameRequest implements UpdateSessionNameRequest {
  const factory _UpdateSessionNameRequest({required final String name}) =
      _$UpdateSessionNameRequestImpl;

  factory _UpdateSessionNameRequest.fromJson(Map<String, dynamic> json) =
      _$UpdateSessionNameRequestImpl.fromJson;

  @override
  String get name;

  /// Create a copy of UpdateSessionNameRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateSessionNameRequestImplCopyWith<_$UpdateSessionNameRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
