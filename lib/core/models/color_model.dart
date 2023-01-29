import 'package:flutter/material.dart';

/// [ColorModel] contains all the color related data.
class ColorModel {
  /// [previousColor] is the previous color.
  final Color previousColor;

  /// [newColor] is the new color.
  final Color newColor;

  /// [circleCenter] is the center of the circle.
  final Offset circleCenter;

  /// [previousColors] is the list of previous colors.
  final List<Color> previousColors;

  /// [ColorModel] constructor.
  ColorModel({
    required this.previousColor,
    required this.newColor,
    required this.circleCenter,
    required this.previousColors,
  });

  /// [copyWith] copies the [ColorModel] with the given parameters.
  ColorModel copyWith({
    Color? previousColor,
    Color? newColor,
    Offset? circleCenter,
    List<Color>? previousColors,
  }) {
    return ColorModel(
      previousColor: previousColor ?? this.previousColor,
      newColor: newColor ?? this.newColor,
      circleCenter: circleCenter ?? this.circleCenter,
      previousColors: previousColors ?? this.previousColors,
    );
  }
}
