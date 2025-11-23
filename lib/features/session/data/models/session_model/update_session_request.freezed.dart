// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_session_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UpdateSessionRequest _$UpdateSessionRequestFromJson(Map<String, dynamic> json) {
  return _UpdateSessionRequest.fromJson(json);
}

/// @nodoc
mixin _$UpdateSessionRequest {
  String? get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;

  /// Serializes this UpdateSessionRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UpdateSessionRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdateSessionRequestCopyWith<UpdateSessionRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateSessionRequestCopyWith<$Res> {
  factory $UpdateSessionRequestCopyWith(UpdateSessionRequest value,
          $Res Function(UpdateSessionRequest) then) =
      _$UpdateSessionRequestCopyWithImpl<$Res, UpdateSessionRequest>;
  @useResult
  $Res call({String? title, String? description, String? status});
}

/// @nodoc
class _$UpdateSessionRequestCopyWithImpl<$Res,
        $Val extends UpdateSessionRequest>
    implements $UpdateSessionRequestCopyWith<$Res> {
  _$UpdateSessionRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdateSessionRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? description = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdateSessionRequestImplCopyWith<$Res>
    implements $UpdateSessionRequestCopyWith<$Res> {
  factory _$$UpdateSessionRequestImplCopyWith(_$UpdateSessionRequestImpl value,
          $Res Function(_$UpdateSessionRequestImpl) then) =
      __$$UpdateSessionRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? title, String? description, String? status});
}

/// @nodoc
class __$$UpdateSessionRequestImplCopyWithImpl<$Res>
    extends _$UpdateSessionRequestCopyWithImpl<$Res, _$UpdateSessionRequestImpl>
    implements _$$UpdateSessionRequestImplCopyWith<$Res> {
  __$$UpdateSessionRequestImplCopyWithImpl(_$UpdateSessionRequestImpl _value,
      $Res Function(_$UpdateSessionRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of UpdateSessionRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? description = freezed,
    Object? status = freezed,
  }) {
    return _then(_$UpdateSessionRequestImpl(
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
@JsonSerializable()
class _$UpdateSessionRequestImpl implements _UpdateSessionRequest {
  const _$UpdateSessionRequestImpl({this.title, this.description, this.status});

  factory _$UpdateSessionRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateSessionRequestImplFromJson(json);

  @override
  final String? title;
  @override
  final String? description;
  @override
  final String? status;

  @override
  String toString() {
    return 'UpdateSessionRequest(title: $title, description: $description, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateSessionRequestImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, description, status);

  /// Create a copy of UpdateSessionRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateSessionRequestImplCopyWith<_$UpdateSessionRequestImpl>
      get copyWith =>
          __$$UpdateSessionRequestImplCopyWithImpl<_$UpdateSessionRequestImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateSessionRequestImplToJson(
      this,
    );
  }
}

abstract class _UpdateSessionRequest implements UpdateSessionRequest {
  const factory _UpdateSessionRequest(
      {final String? title,
      final String? description,
      final String? status}) = _$UpdateSessionRequestImpl;

  factory _UpdateSessionRequest.fromJson(Map<String, dynamic> json) =
      _$UpdateSessionRequestImpl.fromJson;

  @override
  String? get title;
  @override
  String? get description;
  @override
  String? get status;

  /// Create a copy of UpdateSessionRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateSessionRequestImplCopyWith<_$UpdateSessionRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
