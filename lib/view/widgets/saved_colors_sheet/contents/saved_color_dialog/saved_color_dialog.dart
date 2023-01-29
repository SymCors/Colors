import 'package:colors/core/blocs/saved_colors/saved_colors_cubit.dart';
import 'package:colors/core/constants/strings.dart';
import 'package:colors/core/constants/styles.dart';
import 'package:colors/core/helpers/app_helper.dart';
import 'package:colors/core/widgets/custom_text.dart';
import 'package:colors/view/widgets/saved_colors_sheet/contents/saved_color_dialog/saved_color_dialog_title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// [SavedColorDialog] is the dialog that is displayed when a color is long
/// pressed.
class SavedColorDialog extends StatelessWidget {
  /// [color] is the color to be displayed.
  final String color;

  /// Constructor for [SavedColorDialog].
  const SavedColorDialog({
    super.key,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: SavedColorDialogTitle(color: color),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            context.read<SavedColorsCubit>().deleteSavedColor(color);
          },
          child: CustomText(
            Strings.delete,
            style:
                Styles.defaultTextStyle(context)?.copyWith(color: Colors.red),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            AppHelper.copyToClipboard(color);
          },
          child: CustomText(Strings.copy),
        ),
      ],
    );
  }
}
