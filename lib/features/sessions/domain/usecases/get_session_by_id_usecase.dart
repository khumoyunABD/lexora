import '../entities/session.dart';
import '../repositories/session_repository.dart';

class GetSessionByIdUseCase {
  final SessionRepository repository;

  GetSessionByIdUseCase(this.repository);

  Future<Session> call(String sessionId) async {
    return await repository.getSessionById(sessionId);
  }
}
