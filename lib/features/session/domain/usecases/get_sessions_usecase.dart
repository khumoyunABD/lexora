import 'package:dartz/dartz.dart';
import 'package:lexora/core/exceptions/failures.dart';
import 'package:lexora/core/usecase/usecase.dart';
import 'package:lexora/features/session/domain/entities/session_entity.dart';
import 'package:lexora/features/session/domain/repositories/session_repository.dart';

class GetSessionsUseCase implements UseCase<List<SessionEntity>, NoParams> {
  final SessionRepository repository;

  GetSessionsUseCase(this.repository);

  @override
  Future<Either<Failure, List<SessionEntity>>> call(NoParams params) async {
    return await repository.getSessions();
  }
}
