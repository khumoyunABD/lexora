import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lexora/core/exceptions/failures.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  /// Initial state when the bloc is first created
  const factory AuthState.initial() = AuthInitial;

  /// State when authentication is in progress
  const factory AuthState.loading() = AuthLoading;

  /// State when authentication is successful
  const factory AuthState.authenticated() = AuthAuthenticated;

  /// State when user is not authenticated
  const factory AuthState.unauthenticated() = AuthUnauthenticated;

  /// State when authentication fails
  const factory AuthState.error({
    required Failure failure,
  }) = AuthError;
}
