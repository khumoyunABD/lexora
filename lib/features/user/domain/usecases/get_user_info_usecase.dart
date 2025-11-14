import 'package:dartz/dartz.dart';
import 'package:lexora/core/exceptions/failures.dart';
import 'package:lexora/core/usecase/usecase.dart';
import 'package:lexora/features/user/domain/entities/user_entity.dart';
import 'package:lexora/features/user/domain/repositories/user_repository.dart';

/// Use case for fetching user information
/// Takes [NoParams] as this operation doesn't require any parameters
/// Returns [Either<Failure, UserEntity>] indicating success or failure
class GetUserInfoUseCase implements UseCase<UserEntity, NoParams> {
  final UserRepository repository;

  GetUserInfoUseCase(this.repository);

  @override
  Future<Either<Failure, UserEntity>> call(NoParams params) async {
    return await repository.fetchUserInfo();
  }
}
