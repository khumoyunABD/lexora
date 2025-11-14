import 'package:dartz/dartz.dart';
import 'package:lexora/core/exceptions/failures.dart';

/// Base class for all use cases
/// [Type] is the return type
/// [Params] is the parameter type
abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

/// Used for use cases that don't require parameters
class NoParams {
  const NoParams();
}
