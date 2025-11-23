// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_session_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UpdateSessionRequestImpl _$$UpdateSessionRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$UpdateSessionRequestImpl(
      title: json['title'] as String?,
      description: json['description'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$$UpdateSessionRequestImplToJson(
        _$UpdateSessionRequestImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'status': instance.status,
    };
