import '../../domain/entities/message.dart';
import 'message_metadata_model.dart';

class MessageModel extends Message {
  const MessageModel({
    required super.role,
    required super.content,
    required super.artifacts,
    required MessageMetadataModel super.metadata,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      role: json['role'] as String,
      content: json['content'] as String,
      artifacts: List<dynamic>.from(json['artifacts'] ?? []),
      metadata: MessageMetadataModel.fromJson(
        json['metadata'] as Map<String, dynamic>,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'role': role,
      'content': content,
      'artifacts': artifacts,
      'metadata': (metadata as MessageMetadataModel).toJson(),
    };
  }

  factory MessageModel.fromEntity(Message entity) {
    return MessageModel(
      role: entity.role,
      content: entity.content,
      artifacts: entity.artifacts,
      metadata: MessageMetadataModel.fromEntity(entity.metadata),
    );
  }
}
