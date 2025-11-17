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
      title: params.title,
      description: params.description,
    );
  }
}

class CreateSessionParams {
  final String title;
  final String? description;

  const CreateSessionParams({
    required this.title,
    this.description,
  });
}
