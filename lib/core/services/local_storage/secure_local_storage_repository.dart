import 'dart:developer';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:lexora/core/services/local_storage/local_storage_repository.dart';

class SecureLocalStorageRepository implements LocalStorageRepository {
  static const _accessTokenKey = 'access_token';

  // Create FlutterSecureStorage instance with default secure options
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  @override
  Future<String?> getToken() async {
    try {
      final accessToken = await _secureStorage.read(key: _accessTokenKey);

      // Return null if access token is missing
      // Note: refresh token can be null in TokenModel (it's optional)
      if (accessToken == null) {
        log('Access token not found in secure storage');
        return null;
      }

      return accessToken;
    } catch (e) {
      log('Error reading token from secure storage: $e');
      return null;
    }
  }

  @override
  Future<void> saveToken(String accessToken) async {
    try {
      await _secureStorage.write(
        key: _accessTokenKey,
        value: accessToken,
      );

      log('Token saved to secure storage');
    } catch (e) {
      log('Error saving token to secure storage: $e');
      rethrow;
    }
  }

  @override
  Future<bool> checkIfUserIsLoggedIn() async {
    try {
      final token = await getToken();
      return token != null;
    } catch (e) {
      log('Error checking login status: $e');
      return false;
    }
  }

  @override
  Future<void> removeToken() async {
    try {
      await _secureStorage.delete(key: _accessTokenKey);
      log('Token removed from secure storage');
    } catch (e) {
      log('Error removing token from secure storage: $e');
      rethrow;
    }
  }
}
