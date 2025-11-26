// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatRequestImpl _$$ChatRequestImplFromJson(Map<String, dynamic> json) =>
    _$ChatRequestImpl(
      messages: (json['messages'] as List<dynamic>)
          .map((e) => ChatRequestMessage.fromJson(e as Map<String, dynamic>))
          .toList(),
      sources: json['sources'] as List<dynamic>? ?? const [],
    );

Map<String, dynamic> _$$ChatRequestImplToJson(_$ChatRequestImpl instance) =>
    <String, dynamic>{
      'messages': instance.messages,
      'sources': instance.sources,
    };

_$ChatRequestMessageImpl _$$ChatRequestMessageImplFromJson(
        Map<String, dynamic> json) =>
    _$ChatRequestMessageImpl(
      role: json['role'] as String,
      content: json['content'] as String,
      artifacts: json['artifacts'] as List<dynamic>? ?? const [],
      metadata: json['metadata'] == null
          ? null
          : ChatRequestMetadata.fromJson(
              json['metadata'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ChatRequestMessageImplToJson(
        _$ChatRequestMessageImpl instance) =>
    <String, dynamic>{
      'role': instance.role,
      'content': instance.content,
      'artifacts': instance.artifacts,
      'metadata': instance.metadata,
    };

_$ChatRequestMetadataImpl _$$ChatRequestMetadataImplFromJson(
        Map<String, dynamic> json) =>
    _$ChatRequestMetadataImpl(
      sourcesUsed: json['sources_used'] as List<dynamic>? ?? const [],
      confidence: (json['confidence'] as num?)?.toInt() ?? 1,
      processingTime: (json['processing_time'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$ChatRequestMetadataImplToJson(
        _$ChatRequestMetadataImpl instance) =>
    <String, dynamic>{
      'sources_used': instance.sourcesUsed,
      'confidence': instance.confidence,
      'processing_time': instance.processingTime,
    };
