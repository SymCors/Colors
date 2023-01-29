import 'package:colors/core/constants/dimension_constants.dart';
import 'package:colors/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';

/// [SheetErrorWidget] is the widget that displays the error message.
class SheetErrorWidget extends StatelessWidget {
  /// [message] is the error message.
  final String message;

  /// Constructor for [SheetErrorWidget].
  const SheetErrorWidget({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.error_outline,
            size: DimensionConstants.px50,
          ),
          CustomText(message),
        ],
      ),
    );
  }
}
