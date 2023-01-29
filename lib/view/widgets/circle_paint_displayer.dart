import 'dart:math';

import 'package:colors/core/blocs/color/color_cubit.dart';
import 'package:colors/core/constants/dimension_constants.dart';
import 'package:colors/core/helpers/app_helper.dart';
import 'package:colors/core/models/color_model.dart';
import 'package:colors/core/widgets/circle_painter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// [CirclePaintDisplayer] is a widget that displays a [CustomPaint] widget
class CirclePaintDisplayer extends StatefulWidget {
  /// [controller] is the [AnimationController] that is used to animate the
  /// [CustomPaint] widget
  final AnimationController? controller;

  /// [colorModel] is the [ColorModel] that is used to display the [CustomPaint]
  final ColorModel colorModel;

  /// Constructor for [CirclePaintDisplayer].
  const CirclePaintDisplayer({
    Key? key,
    required this.controller,
    required this.colorModel,
  }) : super(key: key);

  @override
  State<CirclePaintDisplayer> createState() => _CirclePaintDisplayerState();
}

class _CirclePaintDisplayerState extends State<CirclePaintDisplayer> {
  void _changeBackgroundColor(Offset position, Color oldCircleColor) {
    AppHelper.dismissKeyboard(context);
    BlocProvider.of<ColorCubit>(context).changeColor(position, oldCircleColor);
    widget.controller?.forward(from: 0);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) => _changeBackgroundColor(
        details.localPosition,
        widget.colorModel.newColor,
      ),
      child: AnimatedBuilder(
        animation: widget.controller ?? const AlwaysStoppedAnimation(0),
        builder: (context, child) {
          final radius = (widget.controller?.value ?? 1) *
              max(
                MediaQuery.of(context).size.width + DimensionConstants.px50,
                MediaQuery.of(context).size.height + DimensionConstants.px50,
              );

          return SizedBox.expand(
            child: RepaintBoundary(
              child: CustomPaint(
                painter: CirclePainter(
                  center: widget.colorModel.circleCenter,
                  radius: radius,
                  color: widget.colorModel.newColor,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
