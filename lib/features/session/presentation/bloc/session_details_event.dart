import 'package:freezed_annotation/freezed_annotation.dart';

part 'session_details_event.freezed.dart';

@freezed
class SessionDetailsEvent with _$SessionDetailsEvent {
  const factory SessionDetailsEvent.getMessages({
    required String sessionId,
  }) = GetMessagesEvent;

  const factory SessionDetailsEvent.getSources({
    required String sessionId,
  }) = GetSourcesEvent;

  const factory SessionDetailsEvent.getArtifacts({
    required String sessionId,
  }) = GetArtifactsEvent;
}
