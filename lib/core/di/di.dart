import 'package:get_it/get_it.dart';
import 'package:lexora/core/services/api/api_client.dart';
import 'package:lexora/core/services/local_storage/local_storage_repository.dart';
import 'package:lexora/core/services/local_storage/secure_local_storage_repository.dart';
import 'package:lexora/features/auth/data/datasources/auth_api_service.dart';
import 'package:lexora/features/auth/data/datasources/auth_datasource.dart';
import 'package:lexora/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:lexora/features/auth/domain/repositories/auth_repository.dart';
import 'package:lexora/features/auth/domain/usecases/login_usecase.dart';
import 'package:lexora/features/auth/domain/usecases/logout_usecase.dart';
import 'package:lexora/features/auth/domain/usecases/register_usecase.dart';
import 'package:lexora/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:lexora/features/session/data/datasources/session_api_service.dart';
import 'package:lexora/features/session/data/datasources/session_datasource.dart';
import 'package:lexora/features/session/data/repositories/session_repository_impl.dart';
import 'package:lexora/features/session/domain/repositories/session_repository.dart';
import 'package:lexora/features/session/domain/usecases/create_session_usecase.dart';
import 'package:lexora/features/session/domain/usecases/delete_session_usecase.dart';
import 'package:lexora/features/session/domain/usecases/get_artifacts_usecase.dart';
import 'package:lexora/features/session/domain/usecases/get_messages_usecase.dart';
import 'package:lexora/features/session/domain/usecases/get_session_by_id_usecase.dart';
import 'package:lexora/features/session/domain/usecases/get_sessions_usecase.dart';
import 'package:lexora/features/session/domain/usecases/get_sources_usecase.dart';
import 'package:lexora/features/session/domain/usecases/send_chat_usecase.dart';
import 'package:lexora/features/session/domain/usecases/update_session_usecase.dart';
import 'package:lexora/features/session/presentation/bloc/session_bloc.dart';
import 'package:lexora/features/session/presentation/bloc/session_details_bloc.dart';
import 'package:lexora/features/user/data/datasources/user_api_service.dart';
import 'package:lexora/features/user/data/datasources/user_datasource.dart';
import 'package:lexora/features/user/data/repositories/user_repository_impl.dart';
import 'package:lexora/features/user/domain/repositories/user_repository.dart';
import 'package:lexora/features/user/domain/usecases/get_user_info_usecase.dart';
import 'package:lexora/features/user/presentation/bloc/user_bloc.dart';

final di = GetIt.I;

void setupDI() {
  // core
  di.registerSingleton<LocalStorageRepository>(SecureLocalStorageRepository());
  di.registerSingleton<ApiClient>(ApiClient(di<LocalStorageRepository>()));

  // retrofit
  di.registerLazySingleton<AuthApiService>(
      () => AuthApiService(di<ApiClient>().dio));
  di.registerLazySingleton<UserApiService>(
      () => UserApiService(di<ApiClient>().dio));
  di.registerLazySingleton<SessionApiService>(
      () => SessionApiService(di<ApiClient>().dio));

  // datasources
  di.registerLazySingleton(
    () => AuthDatasource(
      di<AuthApiService>(),
      di<LocalStorageRepository>(),
    ),
  );
  di.registerLazySingleton(
    () => UserDatasource(di<UserApiService>()),
  );
  di.registerLazySingleton(
    () => SessionDatasource(di<SessionApiService>()),
  );

  // repositories
  di.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(datasource: di<AuthDatasource>()));
  di.registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(datasource: di<UserDatasource>()));
  di.registerLazySingleton<SessionRepository>(
      () => SessionRepositoryImpl(datasource: di<SessionDatasource>()));

  // usecases
  di.registerLazySingleton(() => LoginUseCase(di<AuthRepository>()));
  di.registerLazySingleton(() => RegisterUseCase(di<AuthRepository>()));
  di.registerLazySingleton(() => LogoutUseCase(di<AuthRepository>()));
  di.registerLazySingleton(() => GetUserInfoUseCase(di<UserRepository>()));
  di.registerLazySingleton(() => GetSessionsUseCase(di<SessionRepository>()));
  di.registerLazySingleton(
      () => GetSessionByIdUseCase(di<SessionRepository>()));
  di.registerLazySingleton(() => CreateSessionUseCase(di<SessionRepository>()));
  di.registerLazySingleton(() => UpdateSessionNameUseCase(di<SessionRepository>()));
  di.registerLazySingleton(() => DeleteSessionUseCase(di<SessionRepository>()));
  di.registerLazySingleton(() => GetMessagesUseCase(di<SessionRepository>()));
  di.registerLazySingleton(() => GetSourcesUseCase(di<SessionRepository>()));
  di.registerLazySingleton(() => GetArtifactsUseCase(di<SessionRepository>()));
  di.registerLazySingleton(() => SendChatUseCase(di<SessionRepository>()));

  //  blocs
  di.registerLazySingleton(() => AuthBloc(
        loginUseCase: di<LoginUseCase>(),
        registerUseCase: di<RegisterUseCase>(),
        logoutUseCase: di<LogoutUseCase>(),
      ));
  di.registerLazySingleton(() => UserBloc(
        getUserInfoUseCase: di<GetUserInfoUseCase>(),
      ));
  di.registerLazySingleton(() => SessionBloc(
        getSessionsUseCase: di<GetSessionsUseCase>(),
        getSessionByIdUseCase: di<GetSessionByIdUseCase>(),
        createSessionUseCase: di<CreateSessionUseCase>(),
        updateSessionNameUseCase: di<UpdateSessionNameUseCase>(),
        deleteSessionUseCase: di<DeleteSessionUseCase>(),
      ));
  di.registerLazySingleton(() => SessionDetailsBloc(
        getMessagesUseCase: di<GetMessagesUseCase>(),
        getSourcesUseCase: di<GetSourcesUseCase>(),
        getArtifactsUseCase: di<GetArtifactsUseCase>(),
        sendChatUseCase: di<SendChatUseCase>(),
      ));
}
