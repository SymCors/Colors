import 'package:colors/core/constants/app_colors.dart';
import 'package:colors/core/constants/dimension_constants.dart';
import 'package:flutter/material.dart';

/// Dark theme class of the app
class AppTheme {
  /// Returns the light theme data
  static ThemeData get light => ThemeData.light(useMaterial3: true).copyWith(
        cardColor: Colors.white54,
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: DimensionConstants.px0,
          backgroundColor: Colors.transparent,
          titleSpacing: 0,
        ),
        popupMenuTheme: PopupMenuThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(DimensionConstants.px10),
          ),
        ),
        iconButtonTheme: IconButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.white54),
            padding: MaterialStateProperty.all(
              const EdgeInsets.all(DimensionConstants.px12),
            ),
          ),
        ),
        snackBarTheme: SnackBarThemeData(
          backgroundColor: AppColors.snackbarBackground,
          contentTextStyle: const TextStyle(color: Colors.white),
        ),
      );

  /// Returns the dark theme data
  static ThemeData get dark => ThemeData.dark(useMaterial3: true).copyWith(
        cardColor: Colors.black45,
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: DimensionConstants.px0,
          backgroundColor: Colors.transparent,
          titleSpacing: 0,
        ),
        popupMenuTheme: PopupMenuThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(DimensionConstants.px10),
          ),
        ),
        iconButtonTheme: IconButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.black45),
            padding: MaterialStateProperty.all(
              const EdgeInsets.all(DimensionConstants.px10),
            ),
          ),
        ),
        snackBarTheme: SnackBarThemeData(
          backgroundColor: AppColors.snackbarBackground,
          contentTextStyle: const TextStyle(color: Colors.white),
        ),
      );
}
