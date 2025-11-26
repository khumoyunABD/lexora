import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lexora/features/session/domain/entities/chat_response_entity.dart';

part 'chat_response_model.freezed.dart';
part 'chat_response_model.g.dart';

@freezed
class ChatResponse with _$ChatResponse {
  const ChatResponse._();

  const factory ChatResponse({
    required List<ChatMessage> messages,
    @JsonKey(name: 'session_id') required String sessionId,
  }) = _ChatResponse;

  factory ChatResponse.fromJson(Map<String, dynamic> json) =>
      _$ChatResponseFromJson(json);

  factory ChatResponse.fromEntity(ChatResponseEntity entity) {
    return ChatResponse(
      messages:
          entity.messages.map((msg) => ChatMessage.fromEntity(msg)).toList(),
      sessionId: entity.sessionId,
    );
  }

  ChatResponseEntity toEntity() {
    return ChatResponseEntity(
      messages: messages.map((msg) => msg.toEntity()).toList(),
      sessionId: sessionId,
    );
  }
}

@freezed
class ChatMessage with _$ChatMessage {
  const ChatMessage._();

  const factory ChatMessage({
    required String role,
    required String content,
    @Default([]) List<dynamic> artifacts,
    ChatMetadata? metadata,
  }) = _ChatMessage;

  factory ChatMessage.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageFromJson(json);

  factory ChatMessage.fromEntity(ChatMessageEntity entity) {
    return ChatMessage(
      role: entity.role,
      content: entity.content,
      artifacts: entity.artifacts,
      metadata:
          entity.metadata != null ? ChatMetadata.fromEntity(entity.metadata!) : null,
    );
  }

  ChatMessageEntity toEntity() {
    return ChatMessageEntity(
      role: role,
      content: content,
      artifacts: artifacts,
      metadata: metadata?.toEntity(),
    );
  }
}

@freezed
class ChatMetadata with _$ChatMetadata {
  const ChatMetadata._();

  const factory ChatMetadata({
    @JsonKey(name: 'sources_used') @Default([]) List<dynamic> sourcesUsed,
    @Default(1.0) double confidence,
    @JsonKey(name: 'processing_time') @Default(0.0) double processingTime,
  }) = _ChatMetadata;

  factory ChatMetadata.fromJson(Map<String, dynamic> json) =>
      _$ChatMetadataFromJson(json);

  factory ChatMetadata.fromEntity(ChatMetadataEntity entity) {
    return ChatMetadata(
      sourcesUsed: entity.sourcesUsed,
      confidence: entity.confidence,
      processingTime: entity.processingTime,
    );
  }

  ChatMetadataEntity toEntity() {
    return ChatMetadataEntity(
      sourcesUsed: sourcesUsed,
      confidence: confidence,
      processingTime: processingTime,
    );
  }
}
