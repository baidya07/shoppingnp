import 'package:hive_flutter/hive_flutter.dart';

class HiveService{

/*

What are boxes?
All data stored in Hive is organized in boxes. A box can be compared to a table in SQL, but it does not have a structure and can contain anything.

For a small app, a single box might be enough. For more advanced problems, boxes are a great way to organize your data.
Boxes can also be encrypted to store sensitive data.

 */

  /*

 Box:  By default, the entire content of a box is stored in memory as soon as it is opened.
 This behavior is great for small and medium-sized boxes because you can access their contents without async calls.

 */

  /*

 LazyBox:  For larger boxes or very memory critical applications, it may be useful to load values lazily.
 When a lazy box is opened, all of its keys are read and stored in memory.
 Once you access a value, Hive knows its exact position on the disk and gets the value.

 */
  /// check if box exist
  Future<bool> isExists(String boxName) async {
    final openBox = await Hive.openBox(boxName);
    final length = openBox.length;
    return length != 0;
  }

  /// add single item or object type
  Future<void> addBox<T>(T item, String boxName) async {
    final openBox = await Hive.openBox(boxName);
    if(openBox.isNotEmpty){
      await openBox.clear();
    }
    openBox.add(item);
  }

  /// add array of maps in box
  Future<void> addBoxes<T>(List<T> items, String boxName) async {
    final openBox = await Hive.openBox(boxName);
    if(openBox.isNotEmpty){
      await openBox.clear();
    }
    for (final item in items) {
      openBox.add(item);
    }
  }

  /// fetch through async method for performance issue
  Future<void> addLazyBox(Map<String, dynamic> item, String boxName) async {
    final openBox = await Hive.openLazyBox(boxName);
    if(openBox.isNotEmpty){
      await openBox.clear();
    }
    openBox.putAll(item);
  }
  /// add multiple items[] in lazy box
  Future<void> addLazyBoxes<T>(List<T> items, String boxName) async {
    final openBox = await Hive.openLazyBox(boxName);
    if(openBox.isNotEmpty){
      await openBox.clear();
    }
    for (final item in items) {
      openBox.add(item);
    }
  }

  /// dispose all boxes before app close or if there is no complete use of hive db
  Future disposeAllHiveBoxes() async {
    Hive.close();
  }
  /// clear box
  Future<void> clearBox(String boxName) async {
    final box = await Hive.openBox(boxName);
    await box.clear();
  }

  /// clear lazy box
  Future<void> clearLazyBox(String boxName) async {
    final box = await Hive.openLazyBox(boxName);
    await box.clear();
  }

  /// store items in list
  Future<List<T>> getBoxes<T>(String boxName) async {
    final List<T> boxList = <T>[];
    final openBox = await Hive.openBox(boxName);
    final int length = openBox.length;
    for (int i = 0; i < length; i++) {boxList.add(openBox.getAt(i));}
    return boxList;
  }

  /// get box - synchronized function ( value can be fetched in instant)
  Future getBox<T>(String boxName) async {
    final openBox = await Hive.openBox(boxName);
    return openBox.isNotEmpty ? openBox.values.first : null;
  }

  /// get Already opened box
  dynamic getOpenBox<T>(String boxName) {
    final openBox = Hive.box(boxName); //get Already opened box
    return openBox.isNotEmpty ? openBox.values.first : null;
  }

  /// get first value from lazy box
  Future getLazyBox<T>(String boxName) async {
    final openBox = await Hive.openLazyBox(boxName);
    return openBox.isNotEmpty ? openBox.getAt(0) : null;
  }

  /// get all value from lazy box
  Future getLazyBoxes<T>(String boxName) async {
    final List<T> boxList = <T>[];
    final openBox = await Hive.openLazyBox(boxName);
    for (int i = 0; i < openBox.length; i++) {
      boxList.add(await openBox.getAt(i));
    }
    return boxList;
  }

  String getStringFromBox(String boxName,String key) {
    final box = Hive.box(boxName);
    return box.get(key);
  }

  //set string value
  Future setStringInBox(String boxName,String key, String value) async{
    final box = Hive.box(boxName);
    box.put(key, value);
  }

  //set string value
  // ignore: avoid_positional_boolean_parameters
  Future setBoolInBox(String boxName,String key, bool value) async{
    final box = Hive.box(boxName);
    box.put(key, value);
  }
  //set string value
  bool getBoolFromBox(String boxName,String key) {
    final box = Hive.box(boxName);
    return box.get(key);
  }

}