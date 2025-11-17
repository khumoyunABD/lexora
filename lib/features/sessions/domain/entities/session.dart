import 'package:equatable/equatable.dart';
import 'message.dart';

class Session extends Equatable {
  final String sessionId;
  final List<Message> messages;

  const Session({
    required this.sessionId,
    required this.messages,
  });

  @override
  List<Object?> get props => [sessionId, messages];
}
