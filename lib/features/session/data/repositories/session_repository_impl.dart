import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:lexora/core/exceptions/exceptions.dart';
import 'package:lexora/core/exceptions/failures.dart';
import 'package:lexora/features/session/data/datasources/session_datasource.dart';
import 'package:lexora/features/session/data/models/artifact_model/artifact_model.dart';
import 'package:lexora/features/session/data/models/message_model/message_model.dart';
import 'package:lexora/features/session/data/models/session_model/create_session_request.dart';
import 'package:lexora/features/session/data/models/session_model/session_model.dart';
import 'package:lexora/features/session/data/models/session_model/update_session_request.dart';
import 'package:lexora/features/session/data/models/source_model/source_model.dart';
import 'package:lexora/features/session/domain/entities/artifact_entity.dart';
import 'package:lexora/features/session/domain/entities/message_entity.dart';
import 'package:lexora/features/session/domain/entities/session_entity.dart';
import 'package:lexora/features/session/domain/entities/source_entity.dart';
import 'package:lexora/features/session/domain/repositories/session_repository.dart';

class SessionRepositoryImpl extends SessionRepository {
  final SessionDatasource datasource;

  SessionRepositoryImpl({required this.datasource});

  @override
  Future<Either<Failure, List<SessionEntity>>> getSessions() async {
    try {
      final sessions = await datasource.getSessions();
      return Right(sessions.map((s) => s.toEntity()).toList());
    } on ServerException catch (e) {
      return Left(ServerFailure(
        errorMessage: e.errorMessage,
        statusCode: e.statusCode,
      ));
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    } on DioException catch (e) {
      return Left(ServerFailure(
        errorMessage: e.message ?? 'Network error occurred',
        statusCode: e.response?.statusCode ?? 500,
      ));
    } catch (e) {
      return Left(ServerFailure(
        errorMessage: 'An unexpected error occurred',
        statusCode: 500,
      ));
    }
  }

  @override
  Future<Either<Failure, SessionEntity>> getSessionById(int id) async {
    try {
      final session = await datasource.getSessionById(id);
      return Right(session.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(
        errorMessage: e.errorMessage,
        statusCode: e.statusCode,
      ));
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    } on DioException catch (e) {
      return Left(ServerFailure(
        errorMessage: e.message ?? 'Network error occurred',
        statusCode: e.response?.statusCode ?? 500,
      ));
    } catch (e) {
      return Left(ServerFailure(
        errorMessage: 'An unexpected error occurred',
        statusCode: 500,
      ));
    }
  }

  @override
  Future<Either<Failure, SessionEntity>> createSession({
    required String title,
    String? description,
  }) async {
    try {
      final request = CreateSessionRequest(
        title: title,
        description: description,
      );
      final session = await datasource.createSession(request);
      return Right(session.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(
        errorMessage: e.errorMessage,
        statusCode: e.statusCode,
      ));
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    } on DioException catch (e) {
      return Left(ServerFailure(
        errorMessage: e.message ?? 'Network error occurred',
        statusCode: e.response?.statusCode ?? 500,
      ));
    } catch (e) {
      return Left(ServerFailure(
        errorMessage: 'An unexpected error occurred',
        statusCode: 500,
      ));
    }
  }

  @override
  Future<Either<Failure, SessionEntity>> updateSession({
    required int id,
    String? title,
    String? description,
    String? status,
  }) async {
    try {
      final request = UpdateSessionRequest(
        title: title,
        description: description,
        status: status,
      );
      final session = await datasource.updateSession(id, request);
      return Right(session.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(
        errorMessage: e.errorMessage,
        statusCode: e.statusCode,
      ));
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    } on DioException catch (e) {
      return Left(ServerFailure(
        errorMessage: e.message ?? 'Network error occurred',
        statusCode: e.response?.statusCode ?? 500,
      ));
    } catch (e) {
      return Left(ServerFailure(
        errorMessage: 'An unexpected error occurred',
        statusCode: 500,
      ));
    }
  }

  @override
  Future<Either<Failure, void>> deleteSession(int id) async {
    try {
      await datasource.deleteSession(id);
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure(
        errorMessage: e.errorMessage,
        statusCode: e.statusCode,
      ));
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    } on DioException catch (e) {
      return Left(ServerFailure(
        errorMessage: e.message ?? 'Network error occurred',
        statusCode: e.response?.statusCode ?? 500,
      ));
    } catch (e) {
      return Left(ServerFailure(
        errorMessage: 'An unexpected error occurred',
        statusCode: 500,
      ));
    }
  }

  @override
  Future<Either<Failure, SessionEntity>> endSession(int id) async {
    try {
      final session = await datasource.endSession(id);
      return Right(session.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(
        errorMessage: e.errorMessage,
        statusCode: e.statusCode,
      ));
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    } on DioException catch (e) {
      return Left(ServerFailure(
        errorMessage: e.message ?? 'Network error occurred',
        statusCode: e.response?.statusCode ?? 500,
      ));
    } catch (e) {
      return Left(ServerFailure(
        errorMessage: 'An unexpected error occurred',
        statusCode: 500,
      ));
    }
  }

  @override
  Future<Either<Failure, MessageResponseEntity>> getMessages(String id) async {
    try {
      final messages = await datasource.getMessages(id);
      return Right(messages.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(
        errorMessage: e.errorMessage,
        statusCode: e.statusCode,
      ));
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    } on DioException catch (e) {
      return Left(ServerFailure(
        errorMessage: e.message ?? 'Network error occurred',
        statusCode: e.response?.statusCode ?? 500,
      ));
    } catch (e) {
      return Left(ServerFailure(
        errorMessage: 'An unexpected error occurred',
        statusCode: 500,
      ));
    }
  }

  @override
  Future<Either<Failure, SourcesResponseEntity>> getSources(String id) async {
    try {
      final sources = await datasource.getSources(id);
      return Right(sources.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(
        errorMessage: e.errorMessage,
        statusCode: e.statusCode,
      ));
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    } on DioException catch (e) {
      return Left(ServerFailure(
        errorMessage: e.message ?? 'Network error occurred',
        statusCode: e.response?.statusCode ?? 500,
      ));
    } catch (e) {
      return Left(ServerFailure(
        errorMessage: 'An unexpected error occurred',
        statusCode: 500,
      ));
    }
  }

  @override
  Future<Either<Failure, ArtifactsResponseEntity>> getArtifacts(
      String id) async {
    try {
      final artifacts = await datasource.getArtifacts(id);
      return Right(artifacts.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(
        errorMessage: e.errorMessage,
        statusCode: e.statusCode,
      ));
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    } on DioException catch (e) {
      return Left(ServerFailure(
        errorMessage: e.message ?? 'Network error occurred',
        statusCode: e.response?.statusCode ?? 500,
      ));
    } catch (e) {
      return Left(ServerFailure(
        errorMessage: 'An unexpected error occurred',
        statusCode: 500,
      ));
    }
  }
}
