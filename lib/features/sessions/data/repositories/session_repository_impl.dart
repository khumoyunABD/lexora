import '../../domain/entities/session.dart';
import '../../domain/repositories/session_repository.dart';
import '../datasources/session_api_service.dart';

class SessionRepositoryImpl implements SessionRepository {
  final SessionApiService apiService;

  SessionRepositoryImpl({required this.apiService});

  @override
  Future<List<Session>> fetchSessions() async {
    return await apiService.fetchSessions();
  }

  @override
  Future<Session> getSessionById(String sessionId) async {
    return await apiService.getSessionById(sessionId);
  }
}
