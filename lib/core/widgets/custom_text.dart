import 'package:colors/core/constants/styles.dart';
import 'package:flutter/material.dart';

/// CustomText is the base widget for all text widgets.
class CustomText extends StatelessWidget {
  /// [text] is the [String] that is displayed.
  final String text;

  /// [style] is the [TextStyle] that is applied to the [Text].
  final TextStyle? style;

  /// Constructor for [CustomText].
  const CustomText(
    this.text, {
    Key? key,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style ?? Styles.defaultTextStyle(context),
    );
  }
}
