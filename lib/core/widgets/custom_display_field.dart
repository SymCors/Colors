import 'package:colors/core/constants/dimension_constants.dart';
import 'package:colors/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';

/// [CustomDisplayField] is a widget that displays a [child] in a [Container]
class CustomDisplayField extends StatelessWidget {
  /// [child] is the [Widget] that is displayed in the [Container].
  final Widget? child;

  /// [description] is the [String] that is displayed below the [Container].
  final String? description;

  /// [padding] is the [EdgeInsets] that is applied to the [Container].
  final EdgeInsets padding;

  /// [width] is the width of the [Container].
  final double width;

  /// [height] is the height of the [Container].
  final double height;

  /// [onTap] is the [Function] that is called when the [Container] is tapped.
  final void Function()? onTap;

  /// [onLongPress] is the [Function] that is called
  /// when the [CustomDisplayField] is long pressed.
  final void Function()? onLongPress;

  /// [CustomDisplayField] is a widget that displays a [child] in a [Container]
  const CustomDisplayField({
    Key? key,
    this.child,
    this.description,
    this.width = DimensionConstants.px50,
    this.height = DimensionConstants.px40,
    this.padding = const EdgeInsets.all(10),
    this.onTap,
    this.onLongPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _ChildWrapper(
          onTap: onTap,
          onLongPress: onLongPress,
          width: width,
          height: height,
          padding: padding,
          child: child,
        ),
        const SizedBox(height: 5),
        CustomText(description ?? ''),
      ],
    );
  }
}

class _ChildWrapper extends StatelessWidget {
  /// [onTap] is the [Function] that is called when the [Container] is tapped.
  final void Function()? onTap;

  /// [onLongPress] is the [Function] that is called
  /// when the [CustomDisplayField] is long pressed.
  final void Function()? onLongPress;

  /// [width] is the width of the [Container].
  final double width;

  /// [height] is the height of the [Container].
  final double height;

  /// [padding] is the [EdgeInsets] that is applied to the [Container].
  final EdgeInsets padding;

  /// [child] is the [Widget] that is displayed in the [Container].
  final Widget? child;

  const _ChildWrapper({
    Key? key,
    required this.onTap,
    required this.onLongPress,
    required this.width,
    required this.height,
    required this.padding,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      onLongPress: onLongPress,
      child: Container(
        width: width,
        height: height,
        alignment: Alignment.center,
        padding: padding,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(DimensionConstants.px10),
        ),
        child: child,
      ),
    );
  }
}
