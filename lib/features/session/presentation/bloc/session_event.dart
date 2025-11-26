import 'package:freezed_annotation/freezed_annotation.dart';

part 'session_event.freezed.dart';

@freezed
class SessionEvent with _$SessionEvent {
  const factory SessionEvent.getSessions() = GetSessionsEvent;

  const factory SessionEvent.getSessionById({
    required int id,
  }) = GetSessionByIdEvent;

  const factory SessionEvent.createSession({
    required String agentType,
    required String name,
  }) = CreateSessionEvent;

  const factory SessionEvent.updateSessionName({
    required int id,
    required String name,
  }) = UpdateSessionNameEvent;

  const factory SessionEvent.deleteSession({
    required String id,
  }) = DeleteSessionEvent;
}
