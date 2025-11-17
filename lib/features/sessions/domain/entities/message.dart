import 'package:equatable/equatable.dart';
import 'message_metadata.dart';

class Message extends Equatable {
  final String role;
  final String content;
  final List<dynamic> artifacts;
  final MessageMetadata metadata;

  const Message({
    required this.role,
    required this.content,
    required this.artifacts,
    required this.metadata,
  });

  @override
  List<Object?> get props => [role, content, artifacts, metadata];
}
