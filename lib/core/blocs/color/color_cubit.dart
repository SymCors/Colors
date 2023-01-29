import 'dart:math';

import 'package:colors/core/constants/app_colors.dart';
import 'package:colors/core/constants/extensions.dart';
import 'package:colors/core/models/color_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'color_state.dart';

/// [ColorCubit] is a [Cubit] that handles the color state.
class ColorCubit extends Cubit<ColorState> {
  /// Returns the previous color.
  final List<Color> previousColors = [];

  /// Constructor for [ColorCubit].
  ColorCubit()
      : super(
          ColorLoaded(
            colorModel: ColorModel(
              previousColor: AppColors.appColor,
              newColor: AppColors.appColor,
              circleCenter: Offset.zero,
              previousColors: const [],
            ),
          ),
        );

  /// Changes the color of the circle and the background.
  void changeColor(Offset position, Color oldCircleColor) {
    final random = Random();
    final generatedColor = Color.fromRGBO(
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
      1,
    );
    previousColors.insert(0, oldCircleColor);
    emit(
      ColorLoaded(
        colorModel: ColorModel(
          previousColor: oldCircleColor,
          newColor: generatedColor,
          circleCenter: position,
          previousColors: previousColors,
        ),
      ),
    );
  }

  /// Searches for the color with the given [value].
  void onSearch(Offset position, String value) {
    final color = Extensions.fromHex(value);
    final oldNewColor = (state as ColorLoaded).colorModel.newColor;
    previousColors.insert(0, oldNewColor);
    emit(
      ColorLoaded(
        colorModel: ColorModel(
          previousColor: oldNewColor,
          newColor: color,
          circleCenter: position,
          previousColors: previousColors,
        ),
      ),
    );
  }

  /// Sets new color with the given [color].
  void setNewColor(Offset position, Color color) {
    final oldNewColor = (state as ColorLoaded).colorModel.newColor;
    previousColors.insert(0, oldNewColor);
    emit(
      ColorLoaded(
        colorModel: ColorModel(
          previousColor: oldNewColor,
          newColor: color,
          circleCenter: position,
          previousColors: previousColors,
        ),
      ),
    );
  }
}
