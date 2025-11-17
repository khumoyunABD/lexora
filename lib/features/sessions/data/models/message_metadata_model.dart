import '../../domain/entities/message_metadata.dart';

class MessageMetadataModel extends MessageMetadata {
  const MessageMetadataModel({
    required super.sourcesUsed,
    required super.confidence,
    required super.processingTime,
  });

  factory MessageMetadataModel.fromJson(Map<String, dynamic> json) {
    return MessageMetadataModel(
      sourcesUsed: List<String>.from(json['sources_used'] ?? []),
      confidence: (json['confidence'] ?? 1).toDouble(),
      processingTime: json['processing_time'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'sources_used': sourcesUsed,
      'confidence': confidence,
      'processing_time': processingTime,
    };
  }

  factory MessageMetadataModel.fromEntity(MessageMetadata entity) {
    return MessageMetadataModel(
      sourcesUsed: entity.sourcesUsed,
      confidence: entity.confidence,
      processingTime: entity.processingTime,
    );
  }
}
