import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:lexora/core/exceptions/exceptions.dart';
import 'package:lexora/core/exceptions/failures.dart';
import 'package:lexora/features/user/data/datasources/user_datasource.dart';
import 'package:lexora/features/user/domain/entities/user_entity.dart';
import 'package:lexora/features/user/domain/repositories/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  final UserDatasource datasource;

  UserRepositoryImpl({required this.datasource});

  @override
  Future<Either<Failure, UserEntity>> fetchUserInfo() async {
    try {
      final userModel = await datasource.fetchUserInfo();
      return Right(userModel.toEntity());
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
}
