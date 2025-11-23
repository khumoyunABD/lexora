import 'package:equatable/equatable.dart';

class MessageResponseEntity extends Equatable {
  final List<MessageEntity> messages;
  final String sessionId;

  const MessageResponseEntity({
    required this.messages,
    required this.sessionId,
  });

  @override
  List<Object?> get props => [
        messages,
        sessionId,
      ];
}

class MessageEntity extends Equatable {
  final String role;
  final String content;
  final List<dynamic> artifacts;
  final MetadataEntity? metadata;

  const MessageEntity({
    required this.role,
    required this.content,
    required this.artifacts,
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

class MetadataEntity extends Equatable {
  final List<SourceEntity> sourcesUsed;
  final double confidence;
  final double processingTime;

  const MetadataEntity({
    required this.sourcesUsed,
    required this.confidence,
    required this.processingTime,
  });

  @override
  List<Object?> get props => [
        sourcesUsed,
        confidence,
        processingTime,
      ];
}

class SourceEntity extends Equatable {
  final int sourceId;
  final String name;
  final String sourceType;
  final String sourceUrl;

  const SourceEntity({
    required this.sourceId,
    required this.name,
    required this.sourceType,
    required this.sourceUrl,
  });

  @override
  List<Object?> get props => [
        sourceId,
        name,
        sourceType,
        sourceUrl,
      ];
}
