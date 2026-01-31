import 'package:hive/hive.dart';

class LocalStorage {
  static Future<void> save(String boxName, String key, dynamic value) async {
    final box = await Hive.openBox(boxName);
    await box.put(key, value);
  }

  static Future<T?> read<T>(String boxName, String key) async {
    final box = await Hive.openBox(boxName);
    return box.get(key);
  }

  static Future<void> delete(String boxName, String key) async {
    final box = await Hive.openBox(boxName);
    await box.delete(key);
  }
}
