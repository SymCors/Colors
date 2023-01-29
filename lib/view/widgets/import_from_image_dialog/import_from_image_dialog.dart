import 'dart:io';

import 'package:app_settings/app_settings.dart';
import 'package:colors/core/blocs/color/color_cubit.dart';
import 'package:colors/core/constants/dimension_constants.dart';
import 'package:colors/core/constants/strings.dart';
import 'package:colors/core/helpers/app_helper.dart';
import 'package:colors/core/utils/color_utils.dart';
import 'package:colors/view/widgets/import_from_image_dialog/contents/dialog_drag_container.dart';
import 'package:colors/view/widgets/import_from_image_dialog/contents/dialog_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

/// [ImportFromImageDialog] is the widget to import colors from an image.
class ImportFromImageDialog extends StatefulWidget {
  /// Animation controller to animate background color.
  final AnimationController? animationController;

  /// Constructor for [ImportFromImageDialog].
  const ImportFromImageDialog({
    Key? key,
    required this.animationController,
  }) : super(key: key);

  @override
  State<ImportFromImageDialog> createState() => _ImportFromImageDialogState();
}

class _ImportFromImageDialogState extends State<ImportFromImageDialog> {
  Future<XFile?> getImage(ImageSource imageSource) async {
    final permission = imageSource == ImageSource.camera
        ? Permission.camera
        : (Platform.isIOS ? Permission.photos : Permission.storage);
    final permissionStatus = await AppHelper.getPermission(permission);
    if (!mounted) {
      return null;
    }
    if (!permissionStatus) {
      AppHelper.showAlertDialog(
        context: context,
        title: Strings.permissionDenied,
        content: Text(Strings.pleaseGoToAppSettings),
        onPressed: () async {
          Navigator.of(context).pop();
          await AppSettings.openAppSettings();
        },
      );

      return null;
    }
    const double maxSize = 100;

    return ImagePicker().pickImage(
      source: imageSource,
      maxWidth: maxSize,
      maxHeight: maxSize,
    );
  }

  Future<void> processImage(ImageSource imageSource) async {
    try {
      await EasyLoading.show(
        status: Strings.preparing,
        dismissOnTap: false,
      );
      final XFile? image = await getImage(imageSource);
      if (image == null || !mounted) {
        return await EasyLoading.dismiss();
      }
      await EasyLoading.show(
        status: Strings.imageIsBeingProcessed,
        dismissOnTap: false,
      );
      await Future.delayed(const Duration(seconds: 1), () async {
        final imageColor = await ColorUtils.getDominantColor(File(image.path));
        await EasyLoading.dismiss();
        if (!mounted) {
          return;
        }
        final Offset center = AppHelper.getCenter(context);
        context.read<ColorCubit>().setNewColor(center, imageColor);
        Navigator.pop(context);
        await widget.animationController?.forward(from: 0);
      });
    } on Exception {
      await EasyLoading.showError(Strings.imageCannotBeLoaded);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: DimensionConstants.px5),
        const DialogDragContainer(),
        const SizedBox(height: DimensionConstants.px10),
        DialogListTile(
          icon: Icons.camera_alt_rounded,
          text: Strings.camera,
          onTap: () => processImage(ImageSource.camera),
        ),
        DialogListTile(
          icon: Icons.image,
          text: Strings.gallery,
          onTap: () => processImage(ImageSource.gallery),
        ),
      ],
    );
  }
}
