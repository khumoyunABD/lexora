// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_session_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateSessionRequestImpl _$$CreateSessionRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateSessionRequestImpl(
      agentType: json['agent_type'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$$CreateSessionRequestImplToJson(
        _$CreateSessionRequestImpl instance) =>
    <String, dynamic>{
      'agent_type': instance.agentType,
      'name': instance.name,
    };
