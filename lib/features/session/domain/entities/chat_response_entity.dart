import 'package:equatable/equatable.dart';

class ChatResponseEntity extends Equatable {
  final List<ChatMessageEntity> messages;
  final String sessionId;

  const ChatResponseEntity({
    required this.messages,
    required this.sessionId,
  });

  @override
  List<Object?> get props => [
        messages,
        sessionId,
      ];
}

class ChatMessageEntity extends Equatable {
  final String role;
  final String content;
  final List<dynamic> artifacts;
  final ChatMetadataEntity? metadata;

  const ChatMessageEntity({
    required this.role,
    required this.content,
    this.artifacts = const [],
    this.metadata,
  });

  @override
  List<Object?> get props => [
        role,
        content,
        artifacts,
        metadata,
      ];
}

class ChatMetadataEntity extends Equatable {
  final List<dynamic> sourcesUsed;
  final double confidence;
  final double processingTime;

  const ChatMetadataEntity({
    this.sourcesUsed = const [],
    this.confidence = 1.0,
    this.processingTime = 0.0,
  });

  @override
  List<Object?> get props => [
        sourcesUsed,
        confidence,
        processingTime,
      ];
}
