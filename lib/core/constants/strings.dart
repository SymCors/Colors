import 'package:colors/core/widgets/custom_outlined_textform_field.dart';
import 'package:colors/view/widgets/bottom_dialog/bottom_dialog.dart';
import 'package:colors/view/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:easy_localization/easy_localization.dart';

/// This file contains all the strings used in the app
class Strings {
  /// Returns the app name.
  static const String appName = 'Colors';

  /// returns Hex.
  static const String hex = 'Hex';

  /// Returns R.
  static const String r = 'R';

  /// Returns G.
  static const String g = 'G';

  /// Returns B.
  static const String b = 'B';

  /// Returns in case the colors are not loaded.
  static String get colorsCouldNotBeLoaded => 'title'.tr();

  /// Returns the text centered on the home screen.
  static String get heyThere => 'heyThere'.tr();

  /// Returns OK for the snackbar.
  static String get ok => 'ok'.tr();

  /// Returns Cancel for alert dialogs.
  static String get cancel => 'cancel'.tr();

  /// Returns Recent Colors for [BottomDialog].
  static String get recent => 'recentColors'.tr();

  /// Returns Search for [CustomOutlinedTextFormField] as a default value.
  static String get search => 'search'.tr();

  /// Returns Find Color for [CustomAppBar].
  static String get showColorFromHex => 'showColorFromHex'.tr();

  /// Returns the invalid color for color search.
  static String get invalidColor => 'invalidColor'.tr();

  /// Colors are loading
  static String get colorsAreLoading => 'colorsAreLoading'.tr();

  /// No saved colors are found
  static String get noSavedColors => 'noSavedColors'.tr();

  /// Delete
  static String get delete => 'delete'.tr();

  /// Copy
  static String get copy => 'copy'.tr();

  /// Import from an image
  static String get importFromImage => 'importFromImage'.tr();

  /// Camera
  static String get camera => 'camera'.tr();

  /// Gallery
  static String get gallery => 'gallery'.tr();

  /// Saved Colors
  static String get savedColors => 'savedColors'.tr();

  /// Light Theme
  static String get lightTheme => 'lightTheme'.tr();

  /// Dark Theme
  static String get darkTheme => 'darkTheme'.tr();

  /// Camera Permission
  static String get cameraPermission => 'cameraPermission'.tr();

  /// Permission Denied
  static String get permissionDenied => 'permissionDenied'.tr();

  /// Permission Denied
  static String get pleaseGoToAppSettings => 'pleaseGoToAppSettings'.tr();

  /// Image is being processed
  static String get imageIsBeingProcessed => 'imageIsBeingProcessed'.tr();

  /// Preparing
  static String get preparing => 'preparing'.tr();

  /// Preparing
  static String get changeLanguage => 'changeLanguage'.tr();

  /// Image cannot be loaded
  static String get imageCannotBeLoaded => 'imageCannotBeLoaded'.tr();

  /// Change Theme
  static String get changeTheme => 'changeTheme'.tr();

  /// Returns the text for the snackbar.
  static String colorCopied(String color) =>
      'colorCopied'.tr(namedArgs: {'color': color});

  /// Returns the text for the snackbar.
  static String colorSaved(String color) =>
      'colorSaved'.tr(namedArgs: {'color': color});
}
