import 'package:dartz/dartz.dart';
import 'package:lexora/core/exceptions/failures.dart';
import 'package:lexora/features/auth/data/models/auth_model/auth_model.dart';

abstract class AuthRepository {
  Future<Either<Failure, void>> register(AuthModel authModel);

  Future<Either<Failure, void>> login(AuthModel authModel);

  Future<Either<Failure, void>> logout();
}
