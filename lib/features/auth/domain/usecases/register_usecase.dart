import 'package:dartz/dartz.dart';
import 'package:lexora/core/exceptions/failures.dart';
import 'package:lexora/core/usecase/usecase.dart';
import 'package:lexora/features/auth/data/models/auth_model/auth_model.dart';
import 'package:lexora/features/auth/domain/repositories/auth_repository.dart';

/// Use case for registering a new user
/// Takes [RegisterParams] containing email and password
/// Returns [Either<Failure, void>] indicating success or failure
class RegisterUseCase implements UseCase<void, RegisterParams> {
  final AuthRepository repository;

  RegisterUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(RegisterParams params) async {
    final authModel = AuthModel(
      email: params.email,
      password: params.password,
    );
    return await repository.register(authModel);
  }
}

/// Parameters for register use case
class RegisterParams {
  final String email;
  final String password;

  const RegisterParams({
    required this.email,
    required this.password,
  });
}
