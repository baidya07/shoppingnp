/*

boxes are like collection in mongodb but can store multiple types of data (Dart Object, Maps, JSON)

We will store our data in the form of json document format,

This class will hold the box name or document name to store our local data

and map documents are equivalent to BSON document in mongodb


*/

//collection name or box name
class DbConstants{
  //following constant's will be used to access box or our saved collection from local storage
  static const String homeDataBox = "HomeDataBox"; //To store home data

  static const String userProfileBox = "UserProfileInfoBox"; //To store user data data

  static const String appSettingBox = "AppSettingsBox"; //To store app setting data


  /// key value name constants
  static const String isFirstTime = "isFirstTime";

  static const String homeDataCached = "homeData";

  static const String categoriesDataCached = "categoriesData";

  static const String profileInfoCached = "profileInfo";
}