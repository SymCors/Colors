import 'package:flutter/material.dart';

/// [BaseView] is the base view that can be used in all the screens.
class BaseView extends StatelessWidget {
  /// [body] is the child of the widget.
  final Widget body;

  /// [backgroundColor] is the background color of the screen.
  final Color? backgroundColor;

  /// [appBar] is the app bar of the screen.
  final PreferredSizeWidget? appBar;

  /// [bottomNavigationBar] is the bottom navigation bar of the screen.
  final Widget? bottomNavigationBar;

  /// [drawer] is the drawer of the screen.
  final Drawer? drawer;

  /// [floatingActionButton] is the floating action button of the screen.
  final FloatingActionButton? floatingActionButton;

  /// [onWillPop] is the callback that will be called when the user tries
  /// to go back to the previous screen.
  final Future<bool> Function()? onWillPop;

  /// Constructor for [BaseView].
  const BaseView({
    Key? key,
    required this.body,
    this.backgroundColor,
    this.appBar,
    this.bottomNavigationBar,
    this.drawer,
    this.floatingActionButton,
    this.onWillPop,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        appBar: appBar,
        bottomNavigationBar: bottomNavigationBar,
        drawer: drawer,
        floatingActionButton: floatingActionButton,
        backgroundColor:
            backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
        body: SafeArea(child: body),
      ),
    );
  }
}
