import 'dart:developer';

import 'package:lexora/core/services/api/handle_error.dart';
import 'package:lexora/features/session/data/datasources/session_api_service.dart';
import 'package:lexora/features/session/data/models/session_model/session_model.dart';
import 'package:lexora/features/session/data/models/session_model/create_session_request.dart';
import 'package:lexora/features/session/data/models/session_model/update_session_request.dart';

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
}
