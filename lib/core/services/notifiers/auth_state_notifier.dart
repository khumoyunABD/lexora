import 'dart:async';
import 'dart:developer';

/// Global notifier for authentication state changes
/// Used by ApiClient to notify when authentication fails
class AuthStateNotifier {
  AuthStateNotifier._();

  static final AuthStateNotifier instance = AuthStateNotifier._();

  final _authFailureController = StreamController<void>.broadcast();

  /// Stream that emits when authentication fails
  /// Listen to this to redirect users to login
  Stream<void> get onAuthFailure => _authFailureController.stream;

  /// Notify that authentication has failed
  /// This should trigger a redirect to login page
  void notifyAuthFailure() {
    log('🚨 Auth failure notified - user should be redirected to login');
    if (!_authFailureController.isClosed) {
      _authFailureController.add(null);
    }
  }

  /// Dispose the notifier (call on app termination)
  void dispose() {
    _authFailureController.close();
  }
}
