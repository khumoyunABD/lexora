import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lexora/features/session/domain/entities/message_entity.dart';

part 'message_model.freezed.dart';
part 'message_model.g.dart';

@freezed
class MessageResponse with _$MessageResponse {
  const factory MessageResponse({
    required List<Message> messages,
    @JsonKey(name: 'session_id') required String sessionId,
  }) = _MessageResponse;

  factory MessageResponse.fromJson(Map<String, dynamic> json) =>
      _$MessageResponseFromJson(json);
}

@freezed
class Message with _$Message {
  const factory Message({
    required String role,
    required String content,
    required List<dynamic> artifacts,
    Metadata? metadata,
  }) = _Message;

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);
}

@freezed
class Metadata with _$Metadata {
  const factory Metadata({
    @JsonKey(name: 'sources_used') required List<Source> sourcesUsed,
    required double confidence,
    @JsonKey(name: 'processing_time') required double processingTime,
  }) = _Metadata;

  factory Metadata.fromJson(Map<String, dynamic> json) =>
      _$MetadataFromJson(json);
}

@freezed
class Source with _$Source {
  const factory Source({
    @JsonKey(name: 'source_id') required int sourceId,
    required String name,
    @JsonKey(name: 'source_type') required String sourceType,
    @JsonKey(name: 'source_url') required String sourceUrl,
  }) = _Source;

  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);
}

// Mapper Extensions
extension MessageResponseX on MessageResponse {
  MessageResponseEntity toEntity() {
    return MessageResponseEntity(
      messages: messages.map((m) => m.toEntity()).toList(),
      sessionId: sessionId,
    );
  }
}

extension MessageX on Message {
  MessageEntity toEntity() {
    return MessageEntity(
      role: role,
      content: content,
      artifacts: artifacts,
      metadata: metadata?.toEntity(),
    );
  }
}

extension MetadataX on Metadata {
  MetadataEntity toEntity() {
    return MetadataEntity(
      sourcesUsed: sourcesUsed.map((s) => s.toEntity()).toList(),
      confidence: confidence,
      processingTime: processingTime,
    );
  }
}

extension SourceX on Source {
  SourceEntity toEntity() {
    return SourceEntity(
      sourceId: sourceId,
      name: name,
      sourceType: sourceType,
      sourceUrl: sourceUrl,
    );
  }
}
