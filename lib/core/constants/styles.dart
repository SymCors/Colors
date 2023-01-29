import 'package:colors/core/constants/extensions.dart';
import 'package:colors/core/constants/fonts.dart';
import 'package:colors/core/widgets/custom_display_field.dart';
import 'package:colors/view/widgets/saved_colors_sheet/saved_colors_sheet.dart';
import 'package:flutter/material.dart';

/// [Styles] contains all the [TextStyle]s used in the app.
class Styles {
  /// Text style for the center text of the main screen.
  static TextStyle? centerTextStyle(
    BuildContext context,
    Color backgroundColor,
  ) {
    const double appCenterTextSize = 50;

    return Theme.of(context).textTheme.titleLarge?.copyWith(
          fontSize: appCenterTextSize,
          fontFamily: Fonts.courgette,
          fontWeight: FontWeight.bold,
          color: backgroundColor.contrastingColor,
        );
  }

  /// Text Style for the title [Text] widget in the [CustomDisplayField].
  static TextStyle? defaultTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.titleSmall;
  }

  /// Text Style for the colors in [SavedColorsSheet].
  static TextStyle? colorTextStyle(BuildContext context, Color fromHex) {
    return Theme.of(context).textTheme.bodyLarge?.copyWith(
          fontWeight: FontWeight.bold,
          color: fromHex.contrastingColor,
        );
  }
}
