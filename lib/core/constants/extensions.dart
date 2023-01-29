import 'package:colors/core/constants/constants.dart';
import 'package:flutter/material.dart';

/// This extension is used to convert a [Color] to a hex [String],
/// and a hex [String] to [Color].
extension Extensions on Color {
  /// This method converts a hex [String] to a [Color].
  static Color fromHex(String hexString) {
    final StringBuffer buffer = StringBuffer();
    if (hexString.length == Constants.appColorLength ||
        hexString.length == Constants.appMaxColorLength) {
      buffer.write('ff');
    }
    buffer.write(hexString.replaceFirst('#', ''));

    return Color(int.parse(buffer.toString(), radix: Constants.radix));
  }

  /// This method converts a [Color] to a hex [String].
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
          '${red.toRadixString(Constants.radix).padLeft(Constants.pad, '0')}'
          '${green.toRadixString(Constants.radix).padLeft(Constants.pad, '0')}'
          '${blue.toRadixString(Constants.radix).padLeft(Constants.pad, '0')}'
      .toUpperCase();

  /// This method computes the luminance of a [Color].
  Color get contrastingColor =>
      computeLuminance() > Constants.luminanceThreshold
          ? Colors.black
          : Colors.white;
}
