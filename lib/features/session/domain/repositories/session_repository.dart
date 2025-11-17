import 'package:dartz/dartz.dart';
import 'package:lexora/core/exceptions/failures.dart';
import 'package:lexora/features/session/domain/entities/session_entity.dart';

abstract class SessionRepository {
  Future<Either<Failure, List<SessionEntity>>> getSessions();
  Future<Either<Failure, SessionEntity>> getSessionById(int id);
  Future<Either<Failure, SessionEntity>> createSession({
    required String title,
    String? description,
  });
  Future<Either<Failure, SessionEntity>> updateSession({
    required int id,
    String? title,
    String? description,
    String? status,
  });
  Future<Either<Failure, void>> deleteSession(int id);
  Future<Either<Failure, SessionEntity>> endSession(int id);
}
