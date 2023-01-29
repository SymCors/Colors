part of 'color_cubit.dart';

/// [ColorState] is the state of the [ColorCubit].
@immutable
abstract class ColorState {}

/// [ColorLoaded] is the initial state of the [ColorCubit].
class ColorLoaded extends ColorState {
  /// [colorModel] is the [ColorModel] of the [ColorCubit].
  final ColorModel colorModel;

  /// [ColorLoaded] constructor.
  ColorLoaded({
    required this.colorModel,
  });
}
