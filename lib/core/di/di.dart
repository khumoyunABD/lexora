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

  // repositories
  di.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(datasource: di<AuthDatasource>()));
  di.registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(datasource: di<UserDatasource>()));

  // usecases
  di.registerLazySingleton(() => LoginUseCase(di<AuthRepository>()));
  di.registerLazySingleton(() => RegisterUseCase(di<AuthRepository>()));
  di.registerLazySingleton(() => LogoutUseCase(di<AuthRepository>()));
  di.registerLazySingleton(() => GetUserInfoUseCase(di<UserRepository>()));

  //  blocs
  di.registerLazySingleton(() => AuthBloc(
        loginUseCase: di<LoginUseCase>(),
        registerUseCase: di<RegisterUseCase>(),
        logoutUseCase: di<LogoutUseCase>(),
      ));
  di.registerLazySingleton(() => UserBloc(
        getUserInfoUseCase: di<GetUserInfoUseCase>(),
      ));
}
