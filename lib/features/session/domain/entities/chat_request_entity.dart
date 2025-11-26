import 'package:equatable/equatable.dart';

class ChatRequestEntity extends Equatable {
  final List<ChatRequestMessageEntity> messages;
  final List<dynamic> sources;

  const ChatRequestEntity({
    required this.messages,
    this.sources = const [],
  });

  @override
  List<Object?> get props => [
        messages,
        sources,
      ];
}

class ChatRequestMessageEntity extends Equatable {
  final String role;
  final String content;
  final List<dynamic> artifacts;
  final ChatRequestMetadataEntity? metadata;

  const ChatRequestMessageEntity({
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

class ChatRequestMetadataEntity extends Equatable {
  final List<dynamic> sourcesUsed;
  final int confidence;
  final int processingTime;

  const ChatRequestMetadataEntity({
    this.sourcesUsed = const [],
    this.confidence = 1,
    this.processingTime = 0,
  });

  @override
  List<Object?> get props => [
        sourcesUsed,
        confidence,
        processingTime,
      ];
}
