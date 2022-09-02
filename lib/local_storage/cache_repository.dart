import 'package:hive_flutter/hive_flutter.dart';
import 'package:shoppingnp/local_storage/db_constants.dart';
import 'package:shoppingnp/local_storage/hive_service.dart';

class CacheRepository{
  late HiveService _hiveService;

  CacheRepository(){
    _hiveService = HiveService();
  }

  //set user information
  Future<void> setUserInformationCached(Map<String, dynamic> data) async{
    _hiveService.addBox(data, DbConstants.userProfileBox);
  }

  //set home data
  Future setHomeDataCached(String data) async {
    return _hiveService.setStringInBox(DbConstants.homeDataBox, DbConstants.homeDataCached, data);
  }

  //get home cached data
  Future getCachedHomeData() async {
    return _hiveService.getStringFromBox(DbConstants.homeDataBox, DbConstants.homeDataCached);
  }

  //set categories data
  Future setCategoriesDaraCached(String data) async{
    return _hiveService.setStringInBox(DbConstants.homeDataBox, DbConstants.categoriesDataCached, data);
  }

  //get categories cached data
  Future getCategoriesDataCached() async{
    return _hiveService.getStringFromBox(DbConstants.homeDataBox, DbConstants.categoriesDataCached);
  }

  //get userInfo synchronously (since we have already opened the box on the app start
  Map getCachedUserInfo() {
    return _hiveService.getOpenBox(DbConstants.userProfileBox);
  }

  //  open normal box
  Future openBox(String boxName) async{
    await Hive.openBox(boxName);
  }

  Future clearBox(String boxName) async{
    await _hiveService.clearBox(boxName);
  }

  //  set intro screen setting
  //ignore: avoid_positional_boolean_parameters
  void setIntroSettingPref(String key, bool value){
    _hiveService.setBoolInBox(DbConstants.appSettingBox, key, value);
  }

  //set intro screen setting
  bool getIntroSettingPref(String key){
    return _hiveService.getBoolFromBox(DbConstants.appSettingBox, key);
  }
}