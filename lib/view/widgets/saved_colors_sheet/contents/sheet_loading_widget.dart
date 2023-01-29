import 'package:colors/core/constants/dimension_constants.dart';
import 'package:colors/core/constants/strings.dart';
import 'package:colors/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';

/// [SheetLoadingWidget] is the widget that displays the loading indicator.
class SheetLoadingWidget extends StatelessWidget {
  /// Constructor for [SheetLoadingWidget].
  const SheetLoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CircularProgressIndicator(),
          const SizedBox(height: DimensionConstants.px10),
          CustomText(Strings.colorsAreLoading),
        ],
      ),
    );
  }
}
