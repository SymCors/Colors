import 'package:shared_preferences/shared_preferences.dart';

/// [SharedPrefHelper] handles the shared preferences.
class SharedPrefHelper {
  /// [getBool] gets the bool value for the given key.
  static Future<bool> getBool({required String key}) async {
    final SharedPreferences instance = await SharedPreferences.getInstance();
    final value = instance.getBool(key) ?? false;

    return value;
  }

  /// [saveBool] saves the bool value for the given key.
  static Future saveBool({
    required String key,
    required bool value,
  }) async {
    final SharedPreferences instance = await SharedPreferences.getInstance();
    await instance.setBool(key, value);
  }
}
