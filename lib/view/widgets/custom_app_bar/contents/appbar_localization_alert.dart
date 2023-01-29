import 'package:colors/core/constants/dimension_constants.dart';
import 'package:colors/core/localization/localization.dart';
import 'package:colors/core/widgets/custom_dropdown.dart';
import 'package:colors/core/widgets/custom_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

/// [AppBarLocalizationAlert] is the widget that displays the localization alert
class AppBarLocalizationAlert extends StatelessWidget {
  /// Language.
  final String language;

  /// On language changed.
  final void Function(Object?)? onLanguageChanged;

  /// Constructor for [AppBarLocalizationAlert].
  const AppBarLocalizationAlert({
    Key? key,
    required this.language,
    required this.onLanguageChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: DimensionConstants.px10),
        CustomDropDown<String>(
          customItems: Localization.supportedLanguages.entries
              .map(
                (e) => DropdownMenuItem<String>(
                  value: e.key,
                  child: CustomText(e.value.tr()),
                ),
              )
              .toList(),
          selectedValue: language,
          onChanged: onLanguageChanged,
        ),
      ],
    );
  }
}
