import 'package:colors/core/constants/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';

/// [AppHelper] is the helper class for the app.
class AppHelper {
  /// Shows a [SnackBar] with the given [message].
  static void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
      ..clearSnackBars()
      ..showSnackBar(
        SnackBar(
          content: Text(
            message,
          ),
          action: SnackBarAction(
            label: Strings.ok,
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            },
          ),
        ),
      );
  }

  /// Shows an [AlertDialog].
  static void showAlertDialog({
    required BuildContext context,
    required String title,
    required Widget content,
    required void Function()? onPressed,
  }) {
    showCupertinoDialog<bool>(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text(title),
          content: content,
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(Strings.cancel),
            ),
            TextButton(
              onPressed: onPressed,
              child: Text(Strings.ok),
            ),
          ],
        );
      },
    );
  }

  /// Dismisses the keyboard.
  static void dismissKeyboard(BuildContext context) {
    final currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }

  /// Returns the center of the screen.
  static Offset getCenter(BuildContext context) {
    final double width = MediaQuery.of(context).size.width / 2;
    final double height = MediaQuery.of(context).size.height / 2;

    return Offset(width, height);
  }

  /// Copies the given [text] to the clipboard.
  static Future<void> copyToClipboard(String text) async {
    await Clipboard.setData(ClipboardData(text: text));
  }

  /// Returns the permission status.
  static Future<bool> getPermission(Permission permission) async {
    final cameraStatus = await permission.isGranted;
    if (cameraStatus) {
      return true;
    }

    final request = await permission.request();
    if (request.isGranted) {
      return true;
    }

    return false;
  }
}
