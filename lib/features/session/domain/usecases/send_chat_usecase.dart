import 'package:dartz/dartz.dart';
import 'package:lexora/core/exceptions/failures.dart';
import 'package:lexora/core/usecase/usecase.dart';
import 'package:lexora/features/session/domain/entities/chat_request_entity.dart';
import 'package:lexora/features/session/domain/entities/chat_response_entity.dart';
import 'package:lexora/features/session/domain/repositories/session_repository.dart';

class SendChatUseCase implements UseCase<ChatResponseEntity, SendChatParams> {
  final SessionRepository repository;

  SendChatUseCase(this.repository);

  @override
  Future<Either<Failure, ChatResponseEntity>> call(
      SendChatParams params) async {
    return await repository.sendChat(
      sessionId: params.sessionId,
      request: params.request,
    );
  }
}

class SendChatParams {
  final String sessionId;
  final ChatRequestEntity request;

  const SendChatParams({
    required this.sessionId,
    required this.request,
  });
}
