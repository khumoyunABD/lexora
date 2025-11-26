// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatResponseImpl _$$ChatResponseImplFromJson(Map<String, dynamic> json) =>
    _$ChatResponseImpl(
      messages: (json['messages'] as List<dynamic>)
          .map((e) => ChatMessage.fromJson(e as Map<String, dynamic>))
          .toList(),
      sessionId: json['session_id'] as String,
    );

Map<String, dynamic> _$$ChatResponseImplToJson(_$ChatResponseImpl instance) =>
    <String, dynamic>{
      'messages': instance.messages,
      'session_id': instance.sessionId,
    };

_$ChatMessageImpl _$$ChatMessageImplFromJson(Map<String, dynamic> json) =>
    _$ChatMessageImpl(
      role: json['role'] as String,
      content: json['content'] as String,
      artifacts: json['artifacts'] as List<dynamic>? ?? const [],
      metadata: json['metadata'] == null
          ? null
          : ChatMetadata.fromJson(json['metadata'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ChatMessageImplToJson(_$ChatMessageImpl instance) =>
    <String, dynamic>{
      'role': instance.role,
      'content': instance.content,
      'artifacts': instance.artifacts,
      'metadata': instance.metadata,
    };

_$ChatMetadataImpl _$$ChatMetadataImplFromJson(Map<String, dynamic> json) =>
    _$ChatMetadataImpl(
      sourcesUsed: json['sources_used'] as List<dynamic>? ?? const [],
      confidence: (json['confidence'] as num?)?.toDouble() ?? 1.0,
      processingTime: (json['processing_time'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$$ChatMetadataImplToJson(_$ChatMetadataImpl instance) =>
    <String, dynamic>{
      'sources_used': instance.sourcesUsed,
      'confidence': instance.confidence,
      'processing_time': instance.processingTime,
    };
