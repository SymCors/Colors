import 'package:colors/core/constants/dimension_constants.dart';
import 'package:colors/core/constants/strings.dart';
import 'package:colors/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';

/// [SheetNoColorsWidget] is the widget that displays the no colors message.
class SheetNoColorsWidget extends StatelessWidget {
  /// Constructor for [SheetNoColorsWidget].
  const SheetNoColorsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.format_color_reset,
            size: DimensionConstants.px50,
          ),
          CustomText(Strings.noSavedColors),
        ],
      ),
    );
  }
}
