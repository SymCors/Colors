// ignore_for_file: depend_on_referenced_packages

import 'package:colors/core/constants/shared_prefs.dart';
import 'package:colors/core/helpers/shared_pref_helper.dart';

/// [ThemePreference] is a singleton class that handles the theme preference.
class ThemePreference {
  /// [setTheme] sets the theme preference.
  Future<void> setTheme({required bool isDarkTheme}) async {
    await SharedPrefHelper.saveBool(
      key: SharedPrefs.isDarkMode,
      value: isDarkTheme,
    );
  }

  /// [getTheme] gets the theme preference.
  Future<bool> getTheme() async {
    return SharedPrefHelper.getBool(key: SharedPrefs.isDarkMode);
  }
}
