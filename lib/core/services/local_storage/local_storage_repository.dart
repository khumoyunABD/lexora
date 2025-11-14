abstract class LocalStorageRepository {
  Future<void> saveToken(String accessToken);

  Future<String?> getToken();

  Future<void> removeToken();

  Future<bool> checkIfUserIsLoggedIn();
}
