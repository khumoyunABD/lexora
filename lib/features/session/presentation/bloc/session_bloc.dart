import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lexora/core/usecase/usecase.dart';
import 'package:lexora/features/session/domain/usecases/create_session_usecase.dart';
import 'package:lexora/features/session/domain/usecases/delete_session_usecase.dart';
import 'package:lexora/features/session/domain/usecases/end_session_usecase.dart';
import 'package:lexora/features/session/domain/usecases/get_session_by_id_usecase.dart';
import 'package:lexora/features/session/domain/usecases/get_sessions_usecase.dart';
import 'package:lexora/features/session/domain/usecases/update_session_usecase.dart';
import 'package:lexora/features/session/presentation/bloc/session_event.dart';
import 'package:lexora/features/session/presentation/bloc/session_state.dart';

class SessionBloc extends Bloc<SessionEvent, SessionState> {
  final GetSessionsUseCase getSessionsUseCase;
  final GetSessionByIdUseCase getSessionByIdUseCase;
  final CreateSessionUseCase createSessionUseCase;
  final UpdateSessionUseCase updateSessionUseCase;
  final DeleteSessionUseCase deleteSessionUseCase;
  final EndSessionUseCase endSessionUseCase;

  SessionBloc({
    required this.getSessionsUseCase,
    required this.getSessionByIdUseCase,
    required this.createSessionUseCase,
    required this.updateSessionUseCase,
    required this.deleteSessionUseCase,
    required this.endSessionUseCase,
  }) : super(const SessionState.initial()) {
    on<GetSessionsEvent>(_onGetSessions);
    on<GetSessionByIdEvent>(_onGetSessionById);
    on<CreateSessionEvent>(_onCreateSession);
    on<UpdateSessionEvent>(_onUpdateSession);
    on<DeleteSessionEvent>(_onDeleteSession);
    on<EndSessionEvent>(_onEndSession);
  }

  Future<void> _onGetSessions(
    GetSessionsEvent event,
    Emitter<SessionState> emit,
  ) async {
    emit(const SessionState.loading());
    final result = await getSessionsUseCase(const NoParams());
    result.fold(
      (failure) {
        log('Failed to get sessions: ${failure.errorMessage}');
        emit(SessionState.error(failure: failure));
      },
      (sessions) {
        log('Successfully loaded ${sessions.length} sessions');
        emit(SessionState.sessionsLoaded(sessions: sessions));
      },
    );
  }

  Future<void> _onGetSessionById(
    GetSessionByIdEvent event,
    Emitter<SessionState> emit,
  ) async {
    emit(const SessionState.loading());
    final params = GetSessionByIdParams(id: event.id);
    final result = await getSessionByIdUseCase(params);
    result.fold(
      (failure) {
        log('Failed to get session ${event.id}: ${failure.errorMessage}');
        emit(SessionState.error(failure: failure));
      },
      (session) {
        log('Successfully loaded session ${session.id}');
        emit(SessionState.sessionLoaded(session: session));
      },
    );
  }

  Future<void> _onCreateSession(
    CreateSessionEvent event,
    Emitter<SessionState> emit,
  ) async {
    emit(const SessionState.loading());
    final params = CreateSessionParams(
      title: event.title,
      description: event.description,
    );
    final result = await createSessionUseCase(params);
    result.fold(
      (failure) {
        log('Failed to create session: ${failure.errorMessage}');
        emit(SessionState.error(failure: failure));
      },
      (session) {
        log('Successfully created session ${session.id}');
        emit(SessionState.sessionCreated(session: session));
      },
    );
  }

  Future<void> _onUpdateSession(
    UpdateSessionEvent event,
    Emitter<SessionState> emit,
  ) async {
    emit(const SessionState.loading());
    final params = UpdateSessionParams(
      id: event.id,
      title: event.title,
      description: event.description,
      status: event.status,
    );
    final result = await updateSessionUseCase(params);
    result.fold(
      (failure) {
        log('Failed to update session ${event.id}: ${failure.errorMessage}');
        emit(SessionState.error(failure: failure));
      },
      (session) {
        log('Successfully updated session ${session.id}');
        emit(SessionState.sessionUpdated(session: session));
      },
    );
  }

  Future<void> _onDeleteSession(
    DeleteSessionEvent event,
    Emitter<SessionState> emit,
  ) async {
    emit(const SessionState.loading());
    final params = DeleteSessionParams(id: event.id);
    final result = await deleteSessionUseCase(params);
    result.fold(
      (failure) {
        log('Failed to delete session ${event.id}: ${failure.errorMessage}');
        emit(SessionState.error(failure: failure));
      },
      (_) {
        log('Successfully deleted session ${event.id}');
        emit(const SessionState.sessionDeleted());
      },
    );
  }

  Future<void> _onEndSession(
    EndSessionEvent event,
    Emitter<SessionState> emit,
  ) async {
    emit(const SessionState.loading());
    final params = EndSessionParams(id: event.id);
    final result = await endSessionUseCase(params);
    result.fold(
      (failure) {
        log('Failed to end session ${event.id}: ${failure.errorMessage}');
        emit(SessionState.error(failure: failure));
      },
      (session) {
        log('Successfully ended session ${session.id}');
        emit(SessionState.sessionEnded(session: session));
      },
    );
  }
}
