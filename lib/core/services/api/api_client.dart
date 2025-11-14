import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:lexora/core/services/api/custom_auth_interceptor.dart';
import 'package:lexora/core/services/local_storage/local_storage_repository.dart';

class ApiClient {
  late Dio _dio;
  final LocalStorageRepository _localStorageRepository;

  ApiClient(this._localStorageRepository) {
    _dio = Dio(BaseOptions(
      baseUrl: 'https://api.lexora.uz/api/v1/',
      //baseUrl: 'http://localhost:8008/api/v1/',
      connectTimeout: const Duration(milliseconds: 10000),
      receiveTimeout: const Duration(milliseconds: 10000),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ));

    // Add logging interceptor
    _dio.interceptors.add(LogInterceptor(
      responseBody: true,
      requestBody: true,
      requestHeader: true,
      responseHeader: true,
      error: true,
      logPrint: (object) => log(object.toString()),
    ));

    // Add custom authentication interceptor
    _dio.interceptors.add(CustomAuthInterceptor(_localStorageRepository));
  }

  Dio get dio => _dio;
}
