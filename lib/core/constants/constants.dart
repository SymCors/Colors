/// [Constants] contains all the constants used in the app.
class Constants {
  /// [appStorageKey] is the key used to store the encryption key in the
  /// secure storage.
  static const String appStorageKey = 'appStorageKey';

  /// appColorHex is the hex color of the app.
  static const String appColorHex = '#246EE9';

  /// The [radix] must be in the range 2..36. The digits used are
  /// first the decimal digits 0..9, and then the letters 'a'..'z'
  /// with values 10 through 35. Also accepts upper-case letters
  /// with the same values as the lower-case ones.
  static const int radix = 16;

  /// Pads this string on the left if it is shorter than width.
  static const int pad = 2;

  /// Threshold for the luminance of a Color.
  static const double luminanceThreshold = 0.5;

  /// Length of the [appColorLength] without the '#' symbol.
  static const int appColorLength = 6;

  /// Max length of the [appColorHex] with the '#' symbol.
  static const int appMaxColorLength = 7;

  /// [snackbarBackground] is the background color of the snackbar.
  static const int snackbarBackground = 0xFF323232;
}
