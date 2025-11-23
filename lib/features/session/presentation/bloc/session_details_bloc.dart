import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lexora/features/session/domain/usecases/get_artifacts_usecase.dart';
import 'package:lexora/features/session/domain/usecases/get_messages_usecase.dart';
import 'package:lexora/features/session/domain/usecases/get_sources_usecase.dart';
import 'package:lexora/features/session/presentation/bloc/session_details_event.dart';
import 'package:lexora/features/session/presentation/bloc/session_details_state.dart';

class SessionDetailsBloc
    extends Bloc<SessionDetailsEvent, SessionDetailsState> {
  final GetMessagesUseCase getMessagesUseCase;
  final GetSourcesUseCase getSourcesUseCase;
  final GetArtifactsUseCase getArtifactsUseCase;

  SessionDetailsBloc({
    required this.getMessagesUseCase,
    required this.getSourcesUseCase,
    required this.getArtifactsUseCase,
  }) : super(const SessionDetailsState.initial()) {
    on<GetMessagesEvent>(_onGetMessages);
    on<GetSourcesEvent>(_onGetSources);
    on<GetArtifactsEvent>(_onGetArtifacts);
  }

  Future<void> _onGetMessages(
    GetMessagesEvent event,
    Emitter<SessionDetailsState> emit,
  ) async {
    emit(const SessionDetailsState.loading());
    final params = GetMessagesParams(sessionId: event.sessionId);
    final result = await getMessagesUseCase(params);
    result.fold(
      (failure) {
        log('Failed to get messages for session ${event.sessionId}: ${failure.errorMessage}');
        emit(SessionDetailsState.error(failure: failure));
      },
      (messages) {
        log('Successfully loaded ${messages.messages.length} messages for session ${event.sessionId}');
        emit(SessionDetailsState.messagesLoaded(messages: messages));
      },
    );
  }

  Future<void> _onGetSources(
    GetSourcesEvent event,
    Emitter<SessionDetailsState> emit,
  ) async {
    emit(const SessionDetailsState.loading());
    final params = GetSourcesParams(sessionId: event.sessionId);
    final result = await getSourcesUseCase(params);
    result.fold(
      (failure) {
        log('Failed to get sources for session ${event.sessionId}: ${failure.errorMessage}');
        emit(SessionDetailsState.error(failure: failure));
      },
      (sources) {
        log('Successfully loaded ${sources.sources.length} sources for session ${event.sessionId}');
        emit(SessionDetailsState.sourcesLoaded(sources: sources));
      },
    );
  }

  Future<void> _onGetArtifacts(
    GetArtifactsEvent event,
    Emitter<SessionDetailsState> emit,
  ) async {
    emit(const SessionDetailsState.loading());
    final params = GetArtifactsParams(sessionId: event.sessionId);
    final result = await getArtifactsUseCase(params);
    result.fold(
      (failure) {
        log('Failed to get artifacts for session ${event.sessionId}: ${failure.errorMessage}');
        emit(SessionDetailsState.error(failure: failure));
      },
      (artifacts) {
        log('Successfully loaded ${artifacts.artifacts.length} artifacts for session ${event.sessionId}');
        emit(SessionDetailsState.artifactsLoaded(artifacts: artifacts));
      },
    );
  }
}
