import 'package:dartz/dartz.dart';
import 'package:lexora/core/exceptions/failures.dart';
import 'package:lexora/core/usecase/usecase.dart';
import 'package:lexora/features/auth/domain/repositories/auth_repository.dart';

/// Use case for logging out a user
/// Takes [NoParams] as it doesn't require any parameters
/// Returns [Either<Failure, void>] indicating success or failure
class LogoutUseCase implements UseCase<void, NoParams> {
  final AuthRepository repository;

  LogoutUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    return await repository.logout();
  }
}
