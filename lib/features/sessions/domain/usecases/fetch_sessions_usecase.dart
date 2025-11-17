import '../entities/session.dart';
import '../repositories/session_repository.dart';

class FetchSessionsUseCase {
  final SessionRepository repository;

  FetchSessionsUseCase(this.repository);

  Future<List<Session>> call() async {
    return await repository.fetchSessions();
  }
}
