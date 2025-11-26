import 'package:dio/dio.dart';
import 'package:lexora/features/auth/data/models/auth_model/auth_model.dart';
import 'package:lexora/features/auth/data/models/token_model/token_model.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_api_service.g.dart';

@RestApi()
abstract class AuthApiService {
  factory AuthApiService(Dio dio, {String baseUrl}) = _AuthApiService;

  @POST('/auth/register')
  Future<void> register(@Body() AuthModel authModel);

  @POST('/auth/login')
  Future<TokenModel> login(@Body() AuthModel authModel);
}
