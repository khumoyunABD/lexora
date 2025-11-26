import 'package:dartz/dartz.dart';
import 'package:lexora/core/exceptions/failures.dart';
import 'package:lexora/core/usecase/usecase.dart';
import 'package:lexora/features/session/domain/entities/session_entity.dart';
import 'package:lexora/features/session/domain/repositories/session_repository.dart';

class CreateSessionUseCase implements UseCase<SessionEntity, CreateSessionParams> {
  final SessionRepository repository;

  CreateSessionUseCase(this.repository);

  @override
  Future<Either<Failure, SessionEntity>> call(CreateSessionParams params) async {
    return await repository.createSession(
      agentType: params.agentType,
      name: params.name,
    );
  }
}

class CreateSessionParams {
  final String agentType;
  final String name;

  const CreateSessionParams({
    required this.agentType,
    required this.name,
  });
}
