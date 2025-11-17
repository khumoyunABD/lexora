import 'package:dio/dio.dart';
import 'package:lexora/features/session/data/models/session_model/session_model.dart';
import 'package:lexora/features/session/data/models/session_model/create_session_request.dart';
import 'package:lexora/features/session/data/models/session_model/update_session_request.dart';
import 'package:retrofit/retrofit.dart';

part 'session_api_service.g.dart';

@RestApi()
abstract class SessionApiService {
  factory SessionApiService(Dio dio, {String baseUrl}) = _SessionApiService;

  @GET('/sessions')
  Future<List<SessionModel>> getSessions();

  @GET('/sessions/{id}')
  Future<SessionModel> getSessionById(@Path('id') int id);

  @POST('/sessions')
  Future<SessionModel> createSession(@Body() CreateSessionRequest request);

  @PUT('/sessions/{id}')
  Future<SessionModel> updateSession(
    @Path('id') int id,
    @Body() UpdateSessionRequest request,
  );

  @DELETE('/sessions/{id}')
  Future<void> deleteSession(@Path('id') int id);

  @POST('/sessions/{id}/end')
  Future<SessionModel> endSession(@Path('id') int id);
}
