import 'dart:developer';

import 'package:lexora/core/services/api/handle_error.dart';
import 'package:lexora/features/session/data/datasources/session_api_service.dart';
import 'package:lexora/features/session/data/models/artifact_model/artifact_model.dart';
import 'package:lexora/features/session/data/models/message_model/message_model.dart';
import 'package:lexora/features/session/data/models/session_model/create_session_request.dart';
import 'package:lexora/features/session/data/models/session_model/session_model.dart';
import 'package:lexora/features/session/data/models/session_model/update_session_request.dart';
import 'package:lexora/features/session/data/models/source_model/source_model.dart';

class SessionDatasource {
  final SessionApiService _apiService;

  SessionDatasource(this._apiService);

  Future<List<SessionModel>> getSessions() async {
    try {
      final sessions = await _apiService.getSessions();
      log('Fetched ${sessions.length} sessions');
      return sessions;
    } catch (e) {
      log('Failed to fetch sessions: $e');
      throw HandleError.handleError(e);
    }
  }

  Future<SessionModel> getSessionById(int id) async {
    try {
      final session = await _apiService.getSessionById(id);
      log('Fetched session with id: $id');
      return session;
    } catch (e) {
      log('Failed to fetch session $id: $e');
      throw HandleError.handleError(e);
    }
  }

  Future<SessionModel> createSession(CreateSessionRequest request) async {
    try {
      final session = await _apiService.createSession(request);
      log('Created session: ${session.id}');
      return session;
    } catch (e) {
      log('Failed to create session: $e');
      throw HandleError.handleError(e);
    }
  }

  Future<SessionModel> updateSession(
    int id,
    UpdateSessionRequest request,
  ) async {
    try {
      final session = await _apiService.updateSession(id, request);
      log('Updated session: $id');
      return session;
    } catch (e) {
      log('Failed to update session $id: $e');
      throw HandleError.handleError(e);
    }
  }

  Future<void> deleteSession(int id) async {
    try {
      await _apiService.deleteSession(id);
      log('Deleted session: $id');
    } catch (e) {
      log('Failed to delete session $id: $e');
      throw HandleError.handleError(e);
    }
  }

  Future<SessionModel> endSession(int id) async {
    try {
      final session = await _apiService.endSession(id);
      log('Ended session: $id');
      return session;
    } catch (e) {
      log('Failed to end session $id: $e');
      throw HandleError.handleError(e);
    }
  }

  Future<MessageResponse> getMessages(String id) async {
    try {
      final messages = await _apiService.getMessages(id);
      log('Fetched messages for session: $id');
      return messages;
    } catch (e) {
      log('Failed to fetch messages for session $id: $e');
      throw HandleError.handleError(e);
    }
  }

  Future<SourcesResponse> getSources(String id) async {
    try {
      final sources = await _apiService.getSources(id);
      log('Fetched sources for session: $id');
      return sources;
    } catch (e) {
      log('Failed to fetch sources for session $id: $e');
      throw HandleError.handleError(e);
    }
  }

  Future<ArtifactsResponse> getArtifacts(String id) async {
    try {
      final artifacts = await _apiService.getArtifacts(id);
      log('Fetched artifacts for session: $id');
      return artifacts;
    } catch (e) {
      log('Failed to fetch artifacts for session $id: $e');
      throw HandleError.handleError(e);
    }
  }
}
