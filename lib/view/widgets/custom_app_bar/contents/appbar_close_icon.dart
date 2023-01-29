import 'package:flutter/material.dart';

/// [AppBarCloseIcon] is the widget that displays the close icon.
class AppBarCloseIcon extends StatelessWidget {
  /// onPressed is the function that will be called when the icon is pressed.
  final void Function() onPressed;

  /// searchController is the controller for the search bar.
  final bool visibility;

  /// Constructor for [AppBarCloseIcon].
  const AppBarCloseIcon({
    Key? key,
    required this.onPressed,
    required this.visibility,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visibility,
      child: IconButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
        ),
        onPressed: onPressed,
        icon: const Icon(Icons.close),
      ),
    );
  }
}
