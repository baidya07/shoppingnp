import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {

  //To keep sensitive data of use
  final String accessToken = 'accessToken';
  final String refreshToken = 'refreshToken';
  final String isLoggedIn = "isLoggedIn";
  final String isFirst = "isFirstTime";
  final String userInfo = "userInfo";

  static SecureStorage? _secureStorage;

  // Create storage
  static FlutterSecureStorage? _storage;

  //  Create secureStorage singleton
  SecureStorage._createInstance(); // Named constructor to create a instance of DatabaseHelper

  // AndroidOptions _getAndroidOptions() => const AndroidOptions(
  //   encryptedSharedPreferences: true,
  // );

  // ignore: sort_unnamed_constructors_first
  factory SecureStorage() {

    if (_secureStorage == null) {
      // keep local instance till it is fully initialized.
      final secureStorage = SecureStorage._createInstance();
      _storage = const FlutterSecureStorage();
      _secureStorage = secureStorage;
    }
    return _secureStorage!;//remove (!)
  }



  //set whether user is first time in application
  Future<void> setFirstTime() async {
    await _storage?.write(key: isFirst, value: "true");
  }

  //check whether user is first time in application
  Future<String?> isFirstTime() async {
    return _storage?.read(key: isFirst);
  }

  Future<String?> getRefreshToken() async {
    return _storage?.read(key: refreshToken);
  }

  //to store refresh token so that we can ask for new access token
  Future<void> setRefreshToken(String newRefreshToken) async {
    await _storage?.write(key: refreshToken, value: newRefreshToken);
  }

  //to store valid access token in local storage so that we can make authenticated network request
  Future<void> setAccessToken(String newAccessToken) async {
    await _storage?.write(key: accessToken, value: newAccessToken);
  }

  Future<Object> getAccessToken() async {
    return _storage?.read(key: accessToken) ?? "";
  }


  // clear all secured_storage writes on logout
  Future<void> clearAllData() async {
    await _storage?.deleteAll();
  }

  //set user status to logged in
  Future<void> setAuthenticated() async {
    _storage?.write(key: isLoggedIn, value: isLoggedIn);
  }

  //get/check whether user is logged in or not (if returns value: logged in else unauthenticated
  Future<String?> isAuthenticated() async {
    return _storage?.read(key: isLoggedIn);
  }

}
