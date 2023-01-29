import 'package:colors/core/constants/constants.dart';
import 'package:colors/core/constants/extensions.dart';
import 'package:flutter/material.dart';

/// [AppColors] contains all the colors used in the app.
class AppColors {
  /// The main color of the app.
  static Color get appColor => Extensions.fromHex(Constants.appColorHex);

  /// The background color of the snackbar.
  static Color get snackbarBackground =>
      const Color(Constants.snackbarBackground);
}
