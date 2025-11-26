import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lexora/features/session/domain/entities/chat_request_entity.dart';

part 'chat_request_model.freezed.dart';
part 'chat_request_model.g.dart';

@freezed
class ChatRequest with _$ChatRequest {
  const ChatRequest._();

  const factory ChatRequest({
    required List<ChatRequestMessage> messages,
    @Default([]) List<dynamic> sources,
  }) = _ChatRequest;

  factory ChatRequest.fromJson(Map<String, dynamic> json) =>
      _$ChatRequestFromJson(json);

  factory ChatRequest.fromEntity(ChatRequestEntity entity) {
    return ChatRequest(
      messages: entity.messages
          .map((msg) => ChatRequestMessage.fromEntity(msg))
          .toList(),
      sources: entity.sources,
    );
  }

  ChatRequestEntity toEntity() {
    return ChatRequestEntity(
      messages: messages.map((msg) => msg.toEntity()).toList(),
      sources: sources,
    );
  }
}

@freezed
class ChatRequestMessage with _$ChatRequestMessage {
  const ChatRequestMessage._();

  const factory ChatRequestMessage({
    required String role,
    required String content,
    @Default([]) List<dynamic> artifacts,
    ChatRequestMetadata? metadata,
  }) = _ChatRequestMessage;

  factory ChatRequestMessage.fromJson(Map<String, dynamic> json) =>
      _$ChatRequestMessageFromJson(json);

  factory ChatRequestMessage.fromEntity(ChatRequestMessageEntity entity) {
    return ChatRequestMessage(
      role: entity.role,
      content: entity.content,
      artifacts: entity.artifacts,
      metadata: entity.metadata != null
          ? ChatRequestMetadata.fromEntity(entity.metadata!)
          : null,
    );
  }

  ChatRequestMessageEntity toEntity() {
    return ChatRequestMessageEntity(
      role: role,
      content: content,
      artifacts: artifacts,
      metadata: metadata?.toEntity(),
    );
  }
}

@freezed
class ChatRequestMetadata with _$ChatRequestMetadata {
  const ChatRequestMetadata._();

  const factory ChatRequestMetadata({
    @JsonKey(name: 'sources_used') @Default([]) List<dynamic> sourcesUsed,
    @Default(1) int confidence,
    @JsonKey(name: 'processing_time') @Default(0) int processingTime,
  }) = _ChatRequestMetadata;

  factory ChatRequestMetadata.fromJson(Map<String, dynamic> json) =>
      _$ChatRequestMetadataFromJson(json);

  factory ChatRequestMetadata.fromEntity(ChatRequestMetadataEntity entity) {
    return ChatRequestMetadata(
      sourcesUsed: entity.sourcesUsed,
      confidence: entity.confidence,
      processingTime: entity.processingTime,
    );
  }

  ChatRequestMetadataEntity toEntity() {
    return ChatRequestMetadataEntity(
      sourcesUsed: sourcesUsed,
      confidence: confidence,
      processingTime: processingTime,
    );
  }
}
