import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lexora/core/exceptions/failures.dart';
import 'package:lexora/features/session/domain/entities/session_entity.dart';

part 'session_state.freezed.dart';

@freezed
class SessionState with _$SessionState {
  const factory SessionState.initial() = SessionInitial;

  const factory SessionState.loading() = SessionLoading;

  const factory SessionState.sessionsLoaded({
    required List<SessionEntity> sessions,
  }) = SessionsLoaded;

  const factory SessionState.sessionLoaded({
    required SessionEntity session,
  }) = SessionLoaded;

  const factory SessionState.sessionCreated({
    required SessionEntity session,
  }) = SessionCreated;

  const factory SessionState.sessionUpdated({
    required SessionEntity session,
  }) = SessionUpdated;

  const factory SessionState.sessionDeleted() = SessionDeleted;

  const factory SessionState.sessionEnded({
    required SessionEntity session,
  }) = SessionEnded;

  const factory SessionState.error({
    required Failure failure,
  }) = SessionError;
}
