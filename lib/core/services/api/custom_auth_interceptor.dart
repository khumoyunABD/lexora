import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:lexora/core/services/local_storage/local_storage_repository.dart';
import 'package:lexora/core/services/notifiers/auth_state_notifier.dart';

/// Custom authentication interceptor for handling JWT tokens
/// Handles authentication for protected endpoints
class CustomAuthInterceptor extends InterceptorsWrapper {
  final LocalStorageRepository _localStorageRepository;

  /// Public endpoints that don't require authentication
  static const List<String> noAuthEndpoints = [
    '/auth/register',
    '/auth/login',
  ];

  CustomAuthInterceptor(this._localStorageRepository);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // Skip auth logic for public endpoints
    final isNoAuthEndpoint = noAuthEndpoints.any(
      (endpoint) => options.path.contains(endpoint),
    );

    // Add auth token for authenticated endpoints
    if (!isNoAuthEndpoint) {
      final token = await _getAccessToken();

      if (token == null) {
        // No token available for authenticated endpoint - reject request
        log('⚠️ No access token available for authenticated endpoint: ${options.path}');
        await _handleAuthFailure();
        return handler.reject(
          DioException(
            requestOptions: options,
            error: 'Authentication required. Please login.',
            type: DioExceptionType.cancel,
          ),
        );
      }

      // Add the token to the Authorization header
      options.headers['Authorization'] = 'Bearer $token';
      log('✅ Added access token to request: ${options.path}');
    }

    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    // Handle 401 Unauthorized errors
    if (err.response?.statusCode == 401) {
      log('🚨 Received 401 Unauthorized - token may be expired or invalid');
      await _handleAuthFailure();
    }

    handler.next(err);
  }

  /// Gets the access token from secure storage
  Future<String?> _getAccessToken() async {
    try {
      final accessToken = await _localStorageRepository.getToken();
      return accessToken;
    } catch (e) {
      log('Error getting access token: $e');
      return null;
    }
  }

  /// Handles authentication failure by clearing tokens and notifying listeners
  Future<void> _handleAuthFailure() async {
    try {
      await _localStorageRepository.removeToken();
      log('Authentication failed, tokens cleared');

      // Notify listeners that authentication has failed
      // This will trigger redirect to login page
      AuthStateNotifier.instance.notifyAuthFailure();
    } catch (e) {
      log('Error handling auth failure: $e');
      // Still notify even if token removal fails
      AuthStateNotifier.instance.notifyAuthFailure();
    }
  }
}
