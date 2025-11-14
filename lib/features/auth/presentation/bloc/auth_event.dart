import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_event.freezed.dart';

@freezed
class AuthEvent with _$AuthEvent {
  /// Event triggered when user attempts to login
  const factory AuthEvent.login({
    required String email,
    required String password,
  }) = LoginEvent;

  /// Event triggered when user attempts to register
  const factory AuthEvent.register({
    required String email,
    required String password,
  }) = RegisterEvent;

  /// Event triggered when user attempts to logout
  const factory AuthEvent.logout() = LogoutEvent;
}
