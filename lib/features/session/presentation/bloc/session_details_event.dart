import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lexora/features/session/domain/entities/chat_request_entity.dart';

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

  const factory SessionDetailsEvent.sendChat({
    required String sessionId,
    required ChatRequestEntity request,
  }) = SendChatEvent;

  //reset event
  const factory SessionDetailsEvent.reset() = ResetEvent;
}
