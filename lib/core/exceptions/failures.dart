import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final String? errorMessage;
  final int? statusCode;

  const Failure({
    this.errorMessage,
    this.statusCode,
  });

  @override
  List<Object?> get props => [errorMessage, statusCode];
}

class ServerFailure extends Failure {
  const ServerFailure({required super.errorMessage, required super.statusCode});
}

class DioFailure extends Failure {}

class ParsingFailure extends Failure {
  const ParsingFailure({required super.errorMessage});
}

class CacheFailure extends Failure {}
