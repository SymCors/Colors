import 'package:colors/view/widgets/custom_app_bar/contents/appbar_popup_menu_button.dart';
import 'package:colors/view/widgets/custom_app_bar/contents/appbar_search_bar.dart';
import 'package:flutter/material.dart';

/// [CustomAppBar] is the custom app bar for the app.
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// Animation controller to animate background color.
  final AnimationController? animationController;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  /// Constructor for [CustomAppBar].
  const CustomAppBar({super.key, required this.animationController});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: AppBarSearchBar(animationController: animationController),
      actions: [
        AppBarPopupMenuButton(animationController: animationController)
      ],
    );
  }
}
