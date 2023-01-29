/// This class contains all the regex used in the app
class AppRegex {
  /// [hexColorRegexp] is the regexp for the hex color.
  static final RegExp hexColorRegexp = RegExp(
    r'(?=^#?[0-9a-fA-F]{1,7}$)(^#[0-9a-fA-F]{1,6}$)|(^[0-9a-fA-F]{1,6}$)',
  );
}
