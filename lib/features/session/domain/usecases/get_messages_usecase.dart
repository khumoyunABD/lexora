import 'package:dartz/dartz.dart';
import 'package:lexora/core/exceptions/failures.dart';
import 'package:lexora/core/usecase/usecase.dart';
import 'package:lexora/features/session/domain/entities/message_entity.dart';
import 'package:lexora/features/session/domain/repositories/session_repository.dart';

class GetMessagesUseCase
    implements UseCase<MessageResponseEntity, GetMessagesParams> {
  final SessionRepository repository;

  GetMessagesUseCase(this.repository);

  @override
  Future<Either<Failure, MessageResponseEntity>> call(
      GetMessagesParams params) async {
    return await repository.getMessages(params.sessionId);
  }
}

class GetMessagesParams {
  final String sessionId;

  const GetMessagesParams({required this.sessionId});
}
