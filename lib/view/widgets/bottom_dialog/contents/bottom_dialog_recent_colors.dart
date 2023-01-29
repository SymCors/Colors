import 'package:colors/core/constants/dimension_constants.dart';
import 'package:colors/core/constants/strings.dart';
import 'package:colors/core/models/color_model.dart';
import 'package:colors/core/widgets/color_indicator.dart';
import 'package:colors/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';

/// [BottomDialogRecentColors] is the widget that displays the recent colors.
class BottomDialogRecentColors extends StatelessWidget {
  /// colorModel is the [ColorModel] that contains the color details.
  final ColorModel colorModel;

  /// Constructor for [BottomDialogRecentColors].
  const BottomDialogRecentColors({
    super.key,
    required this.colorModel,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      height: colorModel.previousColors.isNotEmpty
          ? DimensionConstants.px20
          : DimensionConstants.px0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomText('${Strings.recent}:'),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: colorModel.previousColors.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(
                  left: DimensionConstants.px10,
                ),
                child: ColorIndicator(
                  color: colorModel.previousColors[index],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
