import 'package:colors/core/constants/dimension_constants.dart';
import 'package:flutter/material.dart';

/// [ColorIndicator] is a widget that displays [Color]
class ColorIndicator extends StatelessWidget {
  /// [color] is the [Color] that is displayed
  final Color color;

  /// Constructor for [ColorIndicator]
  const ColorIndicator({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: color,
      radius: DimensionConstants.px10,
    );
  }
}
