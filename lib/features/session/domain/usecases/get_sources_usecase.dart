import 'package:dartz/dartz.dart';
import 'package:lexora/core/exceptions/failures.dart';
import 'package:lexora/core/usecase/usecase.dart';
import 'package:lexora/features/session/domain/entities/source_entity.dart';
import 'package:lexora/features/session/domain/repositories/session_repository.dart';

class GetSourcesUseCase
    implements UseCase<SourcesResponseEntity, GetSourcesParams> {
  final SessionRepository repository;

  GetSourcesUseCase(this.repository);

  @override
  Future<Either<Failure, SourcesResponseEntity>> call(
      GetSourcesParams params) async {
    return await repository.getSources(params.sessionId);
  }
}

class GetSourcesParams {
  final String sessionId;

  const GetSourcesParams({required this.sessionId});
}
