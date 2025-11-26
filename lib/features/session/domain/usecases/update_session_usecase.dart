import 'package:dartz/dartz.dart';
import 'package:lexora/core/exceptions/failures.dart';
import 'package:lexora/core/usecase/usecase.dart';
import 'package:lexora/features/session/domain/entities/session_entity.dart';
import 'package:lexora/features/session/domain/repositories/session_repository.dart';

class UpdateSessionNameUseCase
    implements UseCase<SessionEntity, UpdateSessionNameParams> {
  final SessionRepository repository;

  UpdateSessionNameUseCase(this.repository);

  @override
  Future<Either<Failure, SessionEntity>> call(
      UpdateSessionNameParams params) async {
    return await repository.updateSessionName(
      id: params.id,
      name: params.name,
    );
  }
}

class UpdateSessionNameParams {
  final int id;
  final String name;

  const UpdateSessionNameParams({
    required this.id,
    required this.name,
  });
}
