import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageUtil{
  static StorageUtil? _storageUtil;
  static SharedPreferences? _storage;

  StorageUtil._(); //private constructor i.e(._)

  static Future<StorageUtil?> getInstance() async{
    if(_storageUtil == null){
    //  keep local instance till it is fully initialized
      final secureStorage = StorageUtil._();
      await secureStorage._init();
      _storageUtil = secureStorage;
    }
    return _storageUtil;
  }

  Future _init() async{
    _storage = await SharedPreferences.getInstance();
  }

  // get string
  static String getString(String key, {String defValue = ''}) {
    if (_storage == null) return defValue;
    return _storage!.getString(key) ?? defValue;
  }

  // put string
  static Future<bool?> putString(String key, String value) async {
    if (_storage == null) return null;
    return _storage!.setString(key, value);
  }

  // put string
  static Future<bool?> removeString(String key) async {
    if (_storage == null) return null;
    return _storage!.remove(key);
  }
}

final secureStorageUtil = SecureStorageUtil();

class SecureStorageUtil{
  //To keep sensitive data of use
  final String accessToken = 'accessToken';
  final String refreshToken = 'refreshToken';
  final String isLoggedIn = "isLoggedIn";
  final String isFirst = "isFirstTime";
  final String userInfo = "userInfo";

  static SecureStorageUtil? _secureStorage;

  //  create storage
  static FlutterSecureStorage? _storage;

  //  create secureStorage singleton
  SecureStorageUtil._createInstance(); // Named constructor to create a instance of SecureStorage

  // ignore: sort_unnamed_constructors_first
  factory SecureStorageUtil(){
    if(_secureStorage == null){
    //  keep local instance till it is fully initialized
      final secureStorage = SecureStorageUtil._createInstance();
      _storage = const FlutterSecureStorage();
      _secureStorage = secureStorage;
    }
    return _secureStorage!;
  }

  //set whether user is first time in application
  Future<void> setFirstTime() async {
    await _storage!.write(key: isFirst, value: "true");
  }

  //check whether user is first time in application
  Future<Future<String?>> isFirstTime() async {
    return _storage!.read(key: isFirst);
  }

  Future<Future<String?>> getRefreshToken() async {
    return _storage!.read(key: refreshToken);
  }

  //to store refresh token so that we can ask for new access token
  Future<void> setRefreshToken(String newRefreshToken) async {
    await _storage!.write(key: refreshToken, value: newRefreshToken);
  }

  //to store valid access token in local storage so that we can make authenticated network request
  Future<void> setAccessToken(String newAccessToken) async {
    await _storage!.write(key: accessToken, value: newAccessToken);
  }

  Future<Object> getAccessToken() async {
    return _storage!.read(key: accessToken) ?? "";
  }

  // clear all secured_storage writes on logout
  Future<void> clearAllData() async {
    await _storage!.deleteAll();
  }

  //set user status to logged in
  Future<void> setAuthenticated() async {
    _storage!.write(key: isLoggedIn, value: isLoggedIn);
  }

  //get/check whether user is logged in or not (if returns value: logged in else unauthenticated
  Future<Future<String?>> isAuthenticated() async {
    return _storage!.read(key: isLoggedIn);
  }
}
