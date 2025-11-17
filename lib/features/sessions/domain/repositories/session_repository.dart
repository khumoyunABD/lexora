import '../entities/session.dart';

abstract class SessionRepository {
  Future<List<Session>> fetchSessions();
  Future<Session> getSessionById(String sessionId);
}
