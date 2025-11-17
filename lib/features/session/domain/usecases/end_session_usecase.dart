import 'package:dartz/dartz.dart';
import 'package:lexora/core/exceptions/failures.dart';
import 'package:lexora/core/usecase/usecase.dart';
import 'package:lexora/features/session/domain/entities/session_entity.dart';
import 'package:lexora/features/session/domain/repositories/session_repository.dart';

class EndSessionUseCase implements UseCase<SessionEntity, EndSessionParams> {
  final SessionRepository repository;

  EndSessionUseCase(this.repository);

  @override
  Future<Either<Failure, SessionEntity>> call(EndSessionParams params) async {
    return await repository.endSession(params.id);
  }
}

class EndSessionParams {
  final int id;

  const EndSessionParams({required this.id});
}
