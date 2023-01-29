import 'package:flutter/material.dart';

/// [CustomInheritedWidget] is the custom inherited widget for the app.
class CustomInheritedWidget extends InheritedWidget {
  /// [locale] is the locale of the app.
  final Locale locale;

  /// [child] is the child widget of [CustomInheritedWidget
  final Widget body;

  /// Constructor for [CustomInheritedWidget].
  const CustomInheritedWidget({
    Key? key,
    required this.locale,
    required this.body,
  }) : super(key: key, child: body);

  /// [of] is the method to get the [CustomInheritedWidget] from the context.
  static CustomInheritedWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CustomInheritedWidget>();
  }

  @override
  bool updateShouldNotify(CustomInheritedWidget oldWidget) {
    return locale != oldWidget.locale;
  }
}
