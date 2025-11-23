import 'package:dartz/dartz.dart';
import 'package:lexora/core/exceptions/failures.dart';
import 'package:lexora/core/usecase/usecase.dart';
import 'package:lexora/features/session/domain/entities/session_entity.dart';
import 'package:lexora/features/session/domain/repositories/session_repository.dart';

class UpdateSessionUseCase
    implements UseCase<SessionEntity, UpdateSessionParams> {
  final SessionRepository repository;

  UpdateSessionUseCase(this.repository);

  @override
  Future<Either<Failure, SessionEntity>> call(
      UpdateSessionParams params) async {
    return await repository.updateSession(
      id: params.id,
      title: params.title,
      description: params.description,
      status: params.status,
    );
  }
}

class UpdateSessionParams {
  final int id;
  final String? title;
  final String? description;
  final String? status;

  const UpdateSessionParams({
    required this.id,
    this.title,
    this.description,
    this.status,
  });
}
