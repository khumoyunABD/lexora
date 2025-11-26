import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lexora/core/exceptions/failures.dart';
import 'package:lexora/features/session/domain/entities/artifact_entity.dart';
import 'package:lexora/features/session/domain/entities/chat_response_entity.dart';
import 'package:lexora/features/session/domain/entities/message_entity.dart';
import 'package:lexora/features/session/domain/entities/source_entity.dart';

part 'session_details_state.freezed.dart';

@freezed
class SessionDetailsState with _$SessionDetailsState {
  const factory SessionDetailsState.initial() = SessionDetailsInitial;

  const factory SessionDetailsState.loading() = SessionDetailsLoading;

  const factory SessionDetailsState.messagesLoaded({
    required MessageResponseEntity messages,
  }) = MessagesLoaded;

  const factory SessionDetailsState.sourcesLoaded({
    required SourcesResponseEntity sources,
  }) = SourcesLoaded;

  const factory SessionDetailsState.artifactsLoaded({
    required ArtifactsResponseEntity artifacts,
  }) = ArtifactsLoaded;

  const factory SessionDetailsState.chatSent({
    required ChatResponseEntity response,
  }) = ChatSent;

  const factory SessionDetailsState.error({
    required Failure failure,
  }) = SessionDetailsError;
}
