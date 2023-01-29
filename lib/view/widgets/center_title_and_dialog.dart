import 'package:colors/core/constants/strings.dart';
import 'package:colors/core/constants/styles.dart';
import 'package:colors/core/models/color_model.dart';
import 'package:colors/core/widgets/custom_text.dart';
import 'package:colors/view/widgets/bottom_dialog/bottom_dialog.dart';
import 'package:flutter/material.dart';

/// [CenterTitleAndDialog] is the widget that displays the title and the dialog.
class CenterTitleAndDialog extends StatelessWidget {
  /// [colorModel] is the [ColorModel] that contains the colors.
  final ColorModel colorModel;

  /// Constructor for [CenterTitleAndDialog].
  const CenterTitleAndDialog({
    super.key,
    required this.colorModel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            child: CustomText(
              Strings.heyThere,
              key: GlobalKey(),
              style: Styles.centerTextStyle(
                context,
                colorModel.newColor,
              ),
            ),
          ),
        ),
        const BottomDialog(),
      ],
    );
  }
}
