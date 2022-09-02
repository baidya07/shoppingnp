/// Author:    Nabraj Khadka
/// Created:   17.01.2022
/// Description:
/// (c) Copyright by AllPasal.com.
///

class LocalStorageConst{
  static const kAccessToken = 'ACCESS_TOKEN';
  static const kRefreshToken = 'REFRESH_TOKEN';
  static const kIsFirstTime = 'ISFIRST_TIME';
  static const kLoginData = 'LOGIN_DATA';
  static const kRememberMe = 'REMEMBER_ME';
  static const kLoginCredential = 'LOGIN_CREDENTIAL';
}

// class StorageUtil {
//   static late final SharedPreferences instance;
//
//   static Future<SharedPreferences> init() async {
//   return  instance = await SharedPreferences.getInstance();
//   }
//
//
//   // Getter
//   static bool getBool(String key) => instance.getBool(key) ?? true;
//
// // Setter
//   static Future<bool> setBool(String key, bool value) => instance.setBool(key, value);
//
//   static Future<bool> setString(String key, String value) => instance.setString(key, value);
//
//   static String? getString(String key) => instance.getString(key);
// }
