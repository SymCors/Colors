// ignore_for_file: depend_on_referenced_packages

import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;

/// [ColorUtils] is the utility class for color related operations.
class ColorUtils {
  /// Returns the dominant color of the image.
  static Future<Color> getDominantColor(File file) async {
    final Uint8List bytes = await file.readAsBytes();
    final img.Image? image = img.decodeImage(bytes);
    if (image == null) {
      return Colors.white;
    }
    final img.Image imageWithDominantColor =
        img.quantize(image, numberOfColors: 1);
    final img.Color dominantColor = imageWithDominantColor.getPixel(0, 0);

    return Color.fromRGBO(
      dominantColor.r.toInt(),
      dominantColor.g.toInt(),
      dominantColor.b.toInt(),
      1,
    );
  }
}
