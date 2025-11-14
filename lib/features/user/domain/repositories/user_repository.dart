import 'package:dartz/dartz.dart';
import 'package:lexora/core/exceptions/failures.dart';
import 'package:lexora/features/user/domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<Either<Failure, UserEntity>> fetchUserInfo();
}
