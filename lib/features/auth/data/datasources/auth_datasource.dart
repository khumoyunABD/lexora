import 'dart:developer';

import 'package:lexora/core/services/api/handle_error.dart';
import 'package:lexora/core/services/local_storage/local_storage_repository.dart';
import 'package:lexora/features/auth/data/datasources/auth_api_service.dart';
import 'package:lexora/features/auth/data/models/auth_model/auth_model.dart';

/// AuthDatasource with Retrofit API client
class AuthDatasource {
  final AuthApiService _apiService;
  final LocalStorageRepository _localStorageRepository;

  AuthDatasource(this._apiService, this._localStorageRepository);

  Future<void> register(AuthModel authModel) async {
    try {
      await _apiService.register(authModel);
    } catch (e) {
      log('Registration failed: $e');
      throw HandleError.handleError(e);
    }
  }

  Future<void> login(AuthModel authModel) async {
    try {
      // Perform login using Retrofit
      final tokenModel = await _apiService.login(authModel);
      await _localStorageRepository.saveToken(tokenModel.accessToken);
      log('Login successful, token saved');
    } catch (e) {
      log('Login failed: $e');
      throw HandleError.handleError(e);
    }
  }

  Future<void> logout() async {
    try {
      // Always remove local token first
      await _localStorageRepository.removeToken();
      log('Local token removed');
    } catch (e) {
      log('Logout error: $e');
      throw HandleError.handleError(e);
    }
  }
}
