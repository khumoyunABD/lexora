import 'dart:developer';

import 'package:lexora/core/services/api/handle_error.dart';
import 'package:lexora/features/user/data/datasources/user_api_service.dart';
import 'package:lexora/features/user/data/models/user_model.dart';

class UserDatasource {
  UserDatasource(this._apiService);

  final UserApiService _apiService;

  Future<UserModel> fetchUserInfo() async {
    try {
      return await _apiService.fetchUserInfo();
    } catch (e) {
      log('Fetching user info failed: $e');
      throw HandleError.handleError(e);
    }
  }
}
