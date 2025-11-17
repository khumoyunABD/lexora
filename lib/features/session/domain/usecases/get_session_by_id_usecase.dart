import 'package:dartz/dartz.dart';
import 'package:lexora/core/exceptions/failures.dart';
import 'package:lexora/core/usecase/usecase.dart';
import 'package:lexora/features/session/domain/entities/session_entity.dart';
import 'package:lexora/features/session/domain/repositories/session_repository.dart';

class GetSessionByIdUseCase implements UseCase<SessionEntity, GetSessionByIdParams> {
  final SessionRepository repository;

  GetSessionByIdUseCase(this.repository);

  @override
  Future<Either<Failure, SessionEntity>> call(GetSessionByIdParams params) async {
    return await repository.getSessionById(params.id);
  }
}

class GetSessionByIdParams {
  final int id;

  const GetSessionByIdParams({required this.id});
}
