import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lexora/features/session/domain/usecases/get_artifacts_usecase.dart';
import 'package:lexora/features/session/domain/usecases/get_messages_usecase.dart';
import 'package:lexora/features/session/domain/usecases/get_sources_usecase.dart';
import 'package:lexora/features/session/domain/usecases/send_chat_usecase.dart';
import 'package:lexora/features/session/presentation/bloc/session_details_event.dart';
import 'package:lexora/features/session/presentation/bloc/session_details_state.dart';

class SessionDetailsBloc
    extends Bloc<SessionDetailsEvent, SessionDetailsState> {
  final GetMessagesUseCase getMessagesUseCase;
  final GetSourcesUseCase getSourcesUseCase;
  final GetArtifactsUseCase getArtifactsUseCase;
  final SendChatUseCase sendChatUseCase;

  SessionDetailsBloc({
    required this.getMessagesUseCase,
    required this.getSourcesUseCase,
    required this.getArtifactsUseCase,
    required this.sendChatUseCase,
  }) : super(const SessionDetailsState.initial()) {
    on<GetMessagesEvent>(_onGetMessages);
    on<GetSourcesEvent>(_onGetSources);
    on<GetArtifactsEvent>(_onGetArtifacts);
    on<SendChatEvent>(_onSendChat);
    on<ResetEvent>(_onReset);
  }

  // ✅ ADD THIS METHOD
  void _onReset(
    ResetEvent event,
    Emitter<SessionDetailsState> emit,
  ) {
    emit(const SessionDetailsState.initial());
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

  Future<void> _onSendChat(
    SendChatEvent event,
    Emitter<SessionDetailsState> emit,
  ) async {
    emit(const SessionDetailsState.loading());

    final params = SendChatParams(
      sessionId: event.sessionId,
      request: event.request,
    );

    final result = await sendChatUseCase(params);

    await result.fold(
      (failure) async {
        log('Failed to send chat to session ${event.sessionId}: ${failure.errorMessage}');
        emit(SessionDetailsState.error(failure: failure));
      },
      (response) async {
        log('Successfully sent chat to session ${event.sessionId}');
        emit(SessionDetailsState.chatSent(response: response));

        // After successful chat send, trigger fetching of updated data
        log('Fetching updated messages, sources, and artifacts for session ${event.sessionId}');

        // Fetch messages
        final messagesParams = GetMessagesParams(sessionId: event.sessionId);
        final messagesResult = await getMessagesUseCase(messagesParams);
        messagesResult.fold(
          (failure) {
            log('Failed to fetch messages after chat send: ${failure.errorMessage}');
          },
          (messages) {
            log('Successfully fetched ${messages.messages.length} messages after chat send');
            emit(SessionDetailsState.messagesLoaded(messages: messages));
          },
        );

        // Fetch sources
        final sourcesParams = GetSourcesParams(sessionId: event.sessionId);
        final sourcesResult = await getSourcesUseCase(sourcesParams);
        sourcesResult.fold(
          (failure) {
            log('Failed to fetch sources after chat send: ${failure.errorMessage}');
          },
          (sources) {
            log('Successfully fetched ${sources.sources.length} sources after chat send');
          },
        );

        // Fetch artifacts
        final artifactsParams = GetArtifactsParams(sessionId: event.sessionId);
        final artifactsResult = await getArtifactsUseCase(artifactsParams);
        artifactsResult.fold(
          (failure) {
            log('Failed to fetch artifacts after chat send: ${failure.errorMessage}');
          },
          (artifacts) {
            log('Successfully fetched ${artifacts.artifacts.length} artifacts after chat send');
          },
        );
      },
    );
  }
}
