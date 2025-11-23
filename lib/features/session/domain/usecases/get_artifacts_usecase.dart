import 'package:dartz/dartz.dart';
import 'package:lexora/core/exceptions/failures.dart';
import 'package:lexora/core/usecase/usecase.dart';
import 'package:lexora/features/session/domain/entities/artifact_entity.dart';
import 'package:lexora/features/session/domain/repositories/session_repository.dart';

class GetArtifactsUseCase
    implements UseCase<ArtifactsResponseEntity, GetArtifactsParams> {
  final SessionRepository repository;

  GetArtifactsUseCase(this.repository);

  @override
  Future<Either<Failure, ArtifactsResponseEntity>> call(
      GetArtifactsParams params) async {
    return await repository.getArtifacts(params.sessionId);
  }
}

class GetArtifactsParams {
  final String sessionId;

  const GetArtifactsParams({required this.sessionId});
}
