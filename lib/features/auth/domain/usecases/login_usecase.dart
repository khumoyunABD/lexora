import 'package:dartz/dartz.dart';
import 'package:lexora/core/exceptions/failures.dart';
import 'package:lexora/core/usecase/usecase.dart';
import 'package:lexora/features/auth/data/models/auth_model/auth_model.dart';
import 'package:lexora/features/auth/domain/repositories/auth_repository.dart';

/// Use case for logging in a user
/// Takes [LoginParams] containing email and password
/// Returns [Either<Failure, void>] indicating success or failure
class LoginUseCase implements UseCase<void, LoginParams> {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(LoginParams params) async {
    final authModel = AuthModel(
      email: params.email,
      password: params.password,
    );
    return await repository.login(authModel);
  }
}

/// Parameters for login use case
class LoginParams {
  final String email;
  final String password;

  const LoginParams({
    required this.email,
    required this.password,
  });
}
