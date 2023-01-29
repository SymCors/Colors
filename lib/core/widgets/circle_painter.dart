import 'package:flutter/material.dart';

/// [CirclePainter] is the custom painter that draws a circle.
class CirclePainter extends CustomPainter {
  /// The center of the circle.
  final Offset center;

  /// The radius of the circle.
  final double radius;

  /// The color of the circle.
  final Color color;

  /// Constructor for [CirclePainter].
  CirclePainter({
    required this.center,
    required this.radius,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
