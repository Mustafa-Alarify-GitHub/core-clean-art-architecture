import 'package:hive/hive.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import '../constants/storage_keys.dart';

class TokenManager {
  static Future<void> saveToken(String token) async {
    final box = await Hive.openBox(StorageKeys.authBox);
    await box.put(StorageKeys.token, token);
  }

  static Future<String?> getToken() async {
    final box = await Hive.openBox(StorageKeys.authBox);
    return box.get(StorageKeys.token);
  }

  static Future<bool> isTokenExpired() async {
    final token = await getToken();
    if (token == null) return true;

    return JwtDecoder.isExpired(token);
  }

  static Future<void> clear() async {
    final box = await Hive.openBox(StorageKeys.authBox);
    await box.clear();
  }
}
