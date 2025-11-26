import 'package:dartz/dartz.dart';
import 'package:lexora/core/exceptions/failures.dart';
import 'package:lexora/features/session/domain/entities/artifact_entity.dart';
import 'package:lexora/features/session/domain/entities/chat_request_entity.dart';
import 'package:lexora/features/session/domain/entities/chat_response_entity.dart';
import 'package:lexora/features/session/domain/entities/message_entity.dart';
import 'package:lexora/features/session/domain/entities/session_entity.dart';
import 'package:lexora/features/session/domain/entities/source_entity.dart';

abstract class SessionRepository {
  Future<Either<Failure, List<SessionEntity>>> getSessions();
  Future<Either<Failure, SessionEntity>> getSessionById(int id);
  Future<Either<Failure, SessionEntity>> createSession({
    required String agentType,
    required String name,
  });
  Future<Either<Failure, SessionEntity>> updateSessionName({
    required int id,
    required String name,
  });
  Future<Either<Failure, void>> deleteSession(String id);
  Future<Either<Failure, MessageResponseEntity>> getMessages(String id);
  Future<Either<Failure, SourcesResponseEntity>> getSources(String id);
  Future<Either<Failure, ArtifactsResponseEntity>> getArtifacts(String id);
  Future<Either<Failure, ChatResponseEntity>> sendChat({
    required String sessionId,
    required ChatRequestEntity request,
  });
}
