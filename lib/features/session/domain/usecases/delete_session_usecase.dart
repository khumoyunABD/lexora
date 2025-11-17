import 'package:dartz/dartz.dart';
import 'package:lexora/core/exceptions/failures.dart';
import 'package:lexora/core/usecase/usecase.dart';
import 'package:lexora/features/session/domain/repositories/session_repository.dart';

class DeleteSessionUseCase implements UseCase<void, DeleteSessionParams> {
  final SessionRepository repository;

  DeleteSessionUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(DeleteSessionParams params) async {
    return await repository.deleteSession(params.id);
  }
}

class DeleteSessionParams {
  final int id;

  const DeleteSessionParams({required this.id});
}
