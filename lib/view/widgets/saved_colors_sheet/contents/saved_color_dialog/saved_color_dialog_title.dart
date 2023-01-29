import 'package:colors/core/constants/extensions.dart';
import 'package:colors/core/widgets/color_indicator.dart';
import 'package:colors/core/widgets/custom_text.dart';
import 'package:colors/view/widgets/saved_colors_sheet/contents/saved_color_dialog/saved_color_dialog.dart';
import 'package:flutter/material.dart';

/// [SavedColorDialogTitle] is the title of the [SavedColorDialog].
class SavedColorDialogTitle extends StatelessWidget {
  /// [color] is the color to be displayed.
  final String color;

  /// [color] is the color to be displayed.
  const SavedColorDialogTitle({
    super.key,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: CustomText(color),
        ),
        ColorIndicator(
          color: Extensions.fromHex(color),
        ),
      ],
    );
  }
}
