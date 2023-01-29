import 'package:colors/core/models/color_model.dart';
import 'package:colors/view/widgets/bottom_dialog/bottom_dialog.dart';
import 'package:colors/view/widgets/bottom_dialog/contents/bottom_dialog_color_infos.dart';
import 'package:colors/view/widgets/bottom_dialog/contents/bottom_dialog_recent_colors.dart';
import 'package:flutter/material.dart';

/// [BottomDialogContent] is the content of the [BottomDialog].
class BottomDialogContent extends StatelessWidget {
  /// colorModel is the [ColorModel] that contains the color details.
  final ColorModel colorModel;

  /// Constructor for [BottomDialogContent].
  const BottomDialogContent({
    super.key,
    required this.colorModel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BottomDialogRecentColors(colorModel: colorModel),
        const SizedBox(height: 10),
        BottomDialogColorInfos(colorModel: colorModel),
      ],
    );
  }
}
