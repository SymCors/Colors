import 'package:colors/core/blocs/saved_colors/saved_colors_cubit.dart';
import 'package:colors/core/constants/dimension_constants.dart';
import 'package:colors/core/constants/extensions.dart';
import 'package:colors/core/constants/strings.dart';
import 'package:colors/core/helpers/app_helper.dart';
import 'package:colors/core/models/color_model.dart';
import 'package:colors/core/widgets/custom_display_field.dart';
import 'package:colors/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// [BottomDialogColorInfos] is the widget that displays the color details.
class BottomDialogColorInfos extends StatelessWidget {
  /// colorModel is the [ColorModel] that contains the color details.
  final ColorModel colorModel;

  /// Constructor for [BottomDialogColorInfos].
  const BottomDialogColorInfos({
    super.key,
    required this.colorModel,
  });

  void _listener(BuildContext context, SavedColorsState state) {
    if (state is SavedColorsSaveFailed) {
      AppHelper.showSnackBar(
        context,
        state.message,
      );
    } else if (state is SavedColorsSaved) {
      AppHelper.showSnackBar(
        context,
        Strings.colorSaved(colorModel.newColor.toHex()),
      );
    }
  }

  void _saveColor(BuildContext context) {
    context.read<SavedColorsCubit>().saveColor(colorModel.newColor.toHex());
  }

  void _copyToClipboard(BuildContext context) {
    AppHelper.copyToClipboard(
      colorModel.newColor.toHex(),
    );
    AppHelper.showSnackBar(
      context,
      Strings.colorCopied(colorModel.newColor.toHex()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SavedColorsCubit, SavedColorsState>(
      listener: _listener,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CustomDisplayField(
            child: const Icon(Icons.save_alt),
            onTap: () => _saveColor(context),
          ),
          CustomDisplayField(
            width: DimensionConstants.px100,
            description: Strings.hex,
            child: CustomText(colorModel.newColor.toHex()),
            onLongPress: () => _copyToClipboard(context),
          ),
          CustomDisplayField(
            description: Strings.r,
            child: CustomText(colorModel.newColor.red.toString()),
          ),
          CustomDisplayField(
            description: Strings.g,
            child: CustomText(colorModel.newColor.green.toString()),
          ),
          CustomDisplayField(
            description: Strings.b,
            child: CustomText(colorModel.newColor.blue.toString()),
          ),
        ],
      ),
    );
  }
}
