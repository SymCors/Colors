part of 'theme_cubit.dart';

/// [ThemeState] is the state of the [ThemeCubit].
@immutable
abstract class ThemeState {}

/// [LightTheme] is the initial state of the [ThemeCubit].
/// and is the state of the [ThemeCubit] when the theme mode is light.
class LightTheme extends ThemeState {}

/// [DarkTheme] is the state of the [ThemeCubit] when the theme mode is dark.
class DarkTheme extends ThemeState {}
