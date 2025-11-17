import 'package:freezed_annotation/freezed_annotation.dart';

part 'session_event.freezed.dart';

@freezed
class SessionEvent with _$SessionEvent {
  const factory SessionEvent.getSessions() = GetSessionsEvent;

  const factory SessionEvent.getSessionById({
    required int id,
  }) = GetSessionByIdEvent;

  const factory SessionEvent.createSession({
    required String title,
    String? description,
  }) = CreateSessionEvent;

  const factory SessionEvent.updateSession({
    required int id,
    String? title,
    String? description,
    String? status,
  }) = UpdateSessionEvent;

  const factory SessionEvent.deleteSession({
    required int id,
  }) = DeleteSessionEvent;

  const factory SessionEvent.endSession({
    required int id,
  }) = EndSessionEvent;
}
