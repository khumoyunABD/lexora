import 'package:dio/dio.dart';
import 'package:lexora/features/user/data/models/user_model.dart';
import 'package:retrofit/retrofit.dart';

part 'user_api_service.g.dart';

@RestApi()
abstract class UserApiService {
  factory UserApiService(Dio dio, {String baseUrl}) = _UserApiService;

  @GET('/auth/me')
  Future<UserModel> fetchUserInfo();
}
