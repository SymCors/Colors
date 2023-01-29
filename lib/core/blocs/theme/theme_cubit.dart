import 'package:colors/core/theme/theme_preference.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'theme_state.dart';

/// [ThemeCubit] handles the theme mode.
class ThemeCubit extends Cubit<ThemeState> {
  /// [ThemeCubit] constructor.
  ThemeCubit() : super(LightTheme());

  /// [initTheme] initializes the theme mode.
  Future<void> initTheme() async {
    final isDarkMode = await ThemePreference().getTheme();
    if (isDarkMode) {
      emit(DarkTheme());
    } else {
      emit(LightTheme());
    }
  }

  /// [switchTheme] switches the theme mode.
  Future<void> switchTheme() async {
    if (state is LightTheme) {
      emit(DarkTheme());
    } else {
      emit(LightTheme());
    }
    await ThemePreference().setTheme(isDarkTheme: state is DarkTheme);
  }
}
