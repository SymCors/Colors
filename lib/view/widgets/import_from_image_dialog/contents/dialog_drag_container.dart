import 'package:colors/core/constants/dimension_constants.dart';
import 'package:flutter/material.dart';

/// [DialogDragContainer] is the widget to show drag indicator.
class DialogDragContainer extends StatelessWidget {
  /// Constructor for [DialogDragContainer].
  const DialogDragContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: DimensionConstants.px5,
      width: DimensionConstants.px50,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(DimensionConstants.px10),
      ),
    );
  }
}
