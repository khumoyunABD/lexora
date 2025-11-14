import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lexora/core/usecase/usecase.dart';
import 'package:lexora/features/auth/domain/usecases/login_usecase.dart';
import 'package:lexora/features/auth/domain/usecases/logout_usecase.dart';
import 'package:lexora/features/auth/domain/usecases/register_usecase.dart';
import 'package:lexora/features/auth/presentation/bloc/auth_event.dart';
import 'package:lexora/features/auth/presentation/bloc/auth_state.dart';

/// BLoC for managing authentication state
/// Handles login, register, and logout operations
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;
  final LogoutUseCase logoutUseCase;

  AuthBloc({
    required this.loginUseCase,
    required this.registerUseCase,
    required this.logoutUseCase,
  }) : super(const AuthState.initial()) {
    on<LoginEvent>(_onLogin);
    on<RegisterEvent>(_onRegister);
    on<LogoutEvent>(_onLogout);
  }

  /// Handles login event
  Future<void> _onLogin(
    LoginEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());

    final params = LoginParams(
      email: event.email,
      password: event.password,
    );

    final result = await loginUseCase(params);

    result.fold(
      (failure) {
        log('Login failed: ${failure.errorMessage}');
        emit(AuthState.error(failure: failure));
      },
      (_) {
        log('Login successful');
        emit(const AuthState.authenticated());
      },
    );
  }

  /// Handles register event
  Future<void> _onRegister(
    RegisterEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());

    final params = RegisterParams(
      email: event.email,
      password: event.password,
    );

    final result = await registerUseCase(params);

    result.fold(
      (failure) {
        log('Registration failed: ${failure.errorMessage}');
        emit(AuthState.error(failure: failure));
      },
      (_) {
        log('Registration successful');
        emit(const AuthState.authenticated());
      },
    );
  }

  /// Handles logout event
  Future<void> _onLogout(
    LogoutEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());

    final result = await logoutUseCase(const NoParams());

    result.fold(
      (failure) {
        log('Logout failed: ${failure.errorMessage}');
        emit(AuthState.error(failure: failure));
      },
      (_) {
        log('Logout successful');
        emit(const AuthState.unauthenticated());
      },
    );
  }
}
