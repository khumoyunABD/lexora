import 'package:dio/dio.dart';
import 'package:lexora/features/session/data/models/artifact_model/artifact_model.dart';
import 'package:lexora/features/session/data/models/message_model/message_model.dart';
import 'package:lexora/features/session/data/models/session_model/create_session_request.dart';
import 'package:lexora/features/session/data/models/session_model/session_model.dart';
import 'package:lexora/features/session/data/models/session_model/update_session_request.dart';
import 'package:lexora/features/session/data/models/source_model/source_model.dart';
import 'package:retrofit/retrofit.dart';

part 'session_api_service.g.dart';

@RestApi()
abstract class SessionApiService {
  factory SessionApiService(Dio dio, {String baseUrl}) = _SessionApiService;

  /// Sessions
  @GET('agents/sessions')
  Future<List<SessionModel>> getSessions();

  @GET('agents/sessions/{id}')
  Future<SessionModel> getSessionById(@Path('id') int id);

  @POST('agents/sessions')
  Future<SessionModel> createSession(@Body() CreateSessionRequest request);

  @PUT('agents/sessions/{id}')
  Future<SessionModel> updateSession(
    @Path('id') int id,
    @Body() UpdateSessionRequest request,
  );

  @DELETE('agents/sessions/{id}')
  Future<void> deleteSession(@Path('id') String id);

  /// Messages
  @GET('agents/research/sessions/{id}/messages')
  Future<MessageResponse> getMessages(@Path('id') String id);

  /// Sources
  @GET('agents/research/sessions/{id}/sources')
  Future<SourcesResponse> getSources(@Path('id') String id);

  /// Artifacts
  @GET('agents/research/sessions/{id}/artifacts')
  Future<ArtifactsResponse> getArtifacts(@Path('id') String id);
}
