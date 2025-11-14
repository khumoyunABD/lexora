import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:lexora/core/exceptions/exceptions.dart';
import 'package:lexora/core/exceptions/failures.dart';
import 'package:lexora/features/auth/data/datasources/auth_datasource.dart';
import 'package:lexora/features/auth/data/models/auth_model/auth_model.dart';
import 'package:lexora/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthDatasource datasource;

  AuthRepositoryImpl({required this.datasource});

  @override
  Future<Either<Failure, void>> login(AuthModel authModel) async {
    try {
      await datasource.login(authModel);
      return const Right(null);
    } on ServerException catch (e) {
      // HandleError converts errors to ServerException
      return Left(ServerFailure(
          errorMessage: e.errorMessage, statusCode: e.statusCode));
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    } on DioException catch (e) {
      // Fallback for uncaught DioExceptions
      return Left(ServerFailure(
        errorMessage: e.message ?? 'Network error occurred',
        statusCode: e.response?.statusCode ?? 500,
      ));
    } catch (e) {
      // Catch-all for any unexpected exceptions
      return Left(ServerFailure(
        errorMessage: 'An unexpected error occurred',
        statusCode: 500,
      ));
    }
  }

  @override
  Future<Either<Failure, void>> register(AuthModel authModel) async {
    try {
      await datasource.register(authModel);
      return const Right(null);
    } on ServerException catch (e) {
      // HandleError converts errors to ServerException
      return Left(ServerFailure(
          errorMessage: e.errorMessage, statusCode: e.statusCode));
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    } on DioException catch (e) {
      // Fallback for uncaught DioExceptions
      return Left(ServerFailure(
        errorMessage: e.message ?? 'Network error occurred',
        statusCode: e.response?.statusCode ?? 500,
      ));
    } catch (e) {
      // Catch-all for any unexpected exceptions
      return Left(ServerFailure(
        errorMessage: 'An unexpected error occurred',
        statusCode: 500,
      ));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      await datasource.logout();
      return const Right(null);
    } on ServerException catch (e) {
      // HandleError converts errors to ServerException
      return Left(
        ServerFailure(
          errorMessage: e.errorMessage,
          statusCode: e.statusCode,
        ),
      );
    } on ParsingException catch (e) {
      return Left(
        ParsingFailure(errorMessage: e.errorMessage),
      );
    } on DioException catch (e) {
      // Fallback for uncaught DioExceptions
      return Left(ServerFailure(
        errorMessage: e.message ?? 'Network error occurred',
        statusCode: e.response?.statusCode ?? 500,
      ));
    } catch (e) {
      // Catch-all for any unexpected exceptions
      return Left(ServerFailure(
        errorMessage: 'An unexpected error occurred',
        statusCode: 500,
      ));
    }
  }
}
