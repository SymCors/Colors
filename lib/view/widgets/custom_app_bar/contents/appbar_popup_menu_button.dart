import 'package:colors/core/blocs/theme/theme_cubit.dart';
import 'package:colors/core/constants/dimension_constants.dart';
import 'package:colors/core/constants/popup_values.dart';
import 'package:colors/core/constants/strings.dart';
import 'package:colors/core/helpers/app_helper.dart';
import 'package:colors/core/localization/localization.dart';
import 'package:colors/core/widgets/custom_text.dart';
import 'package:colors/view/widgets/custom_app_bar/contents/appbar_localization_alert.dart';
import 'package:colors/view/widgets/import_from_image_dialog/import_from_image_dialog.dart';
import 'package:colors/view/widgets/saved_colors_sheet/saved_colors_sheet.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// [AppBarPopupMenuButton] is the widget that displays the popup menu button.
class AppBarPopupMenuButton extends StatefulWidget {
  /// Animation controller to animate background color.
  final AnimationController? animationController;

  /// Constructor for [AppBarPopupMenuButton].
  const AppBarPopupMenuButton({
    Key? key,
    required this.animationController,
  }) : super(key: key);

  @override
  State<AppBarPopupMenuButton> createState() => _AppBarPopupMenuButtonState();
}

class _AppBarPopupMenuButtonState extends State<AppBarPopupMenuButton> {
  String language = '';

  void _onSelected(int value) {
    switch (value) {
      case PopUpValues.value0:
        value0();
        break;
      case PopUpValues.value1:
        value1();
        break;
      case PopUpValues.value2:
        value2();
        break;
      case PopUpValues.value3:
        value3();
        break;
    }
  }

  void value0() {
    showModalBottomSheet<String>(
      context: context,
      constraints: const BoxConstraints.expand(
        height: DimensionConstants.px160,
      ),
      builder: (context) => ImportFromImageDialog(
        animationController: widget.animationController,
      ),
    );
  }

  void value1() {
    showModalBottomSheet<String>(
      context: context,
      builder: (context) => const SavedColorsSheet(),
    );
  }

  void value2() {
    context.read<ThemeCubit>().switchTheme();
  }

  void value3() {
    language = context.locale.toString();
    AppHelper.showAlertDialog(
      context: context,
      title: Strings.changeLanguage,
      content: AppBarLocalizationAlert(
        language: language,
        onLanguageChanged: _onLanguageChanged,
      ),
      onPressed: () {
        if (language != context.locale.toString()) {
          Localization.changeLanguage(context, Locale(language));
        }
        Navigator.pop(context);
      },
    );
  }

  void _onLanguageChanged(Object? selectedLanguage) {
    language = selectedLanguage.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: DimensionConstants.px10),
      child: PopupMenuButton(
        itemBuilder: (context) {
          return [
            _popupMenuItem(
              icon: Icons.image_outlined,
              text: Strings.importFromImage,
              value: PopUpValues.value0,
            ),
            _popupMenuItem(
              icon: Icons.bookmark_outline,
              text: Strings.savedColors,
              value: PopUpValues.value1,
            ),
            _popupMenuItem(
              icon: Icons.brightness_4_outlined,
              text: Strings.changeTheme,
              value: PopUpValues.value2,
            ),
            _popupMenuItem(
              icon: Icons.language_outlined,
              text: Strings.changeLanguage,
              value: PopUpValues.value3,
            ),
          ];
        },
        onSelected: _onSelected,
        child: CircleAvatar(
          radius: DimensionConstants.px24,
          backgroundColor: Theme.of(context).cardColor,
          child: Icon(Icons.adaptive.more),
        ),
      ),
    );
  }

  PopupMenuItem<int> _popupMenuItem({
    required int value,
    required String text,
    required IconData icon,
  }) {
    return PopupMenuItem(
      value: value,
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(width: DimensionConstants.px10),
          Expanded(
            child: CustomText(text),
          ),
        ],
      ),
    );
  }
}
