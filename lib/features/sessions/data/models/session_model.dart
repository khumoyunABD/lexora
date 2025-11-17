import '../../domain/entities/session.dart';
import 'message_model.dart';

class SessionModel extends Session {
  const SessionModel({
    required super.sessionId,
    required List<MessageModel> super.messages,
  });

  factory SessionModel.fromJson(Map<String, dynamic> json) {
    return SessionModel(
      sessionId: json['session_id'] as String,
      messages: (json['messages'] as List<dynamic>)
          .map((e) => MessageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'session_id': sessionId,
      'messages': messages.map((e) => (e as MessageModel).toJson()).toList(),
    };
  }

  factory SessionModel.fromEntity(Session entity) {
    return SessionModel(
      sessionId: entity.sessionId,
      messages: entity.messages.map((e) => MessageModel.fromEntity(e)).toList(),
    );
  }
}
