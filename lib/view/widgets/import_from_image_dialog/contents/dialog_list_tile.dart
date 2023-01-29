import 'package:colors/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';

/// DialogListTile is the widget to show a list tile in the dialog.
class DialogListTile extends StatefulWidget {
  /// [icon] is the icon to show in the list tile.
  final IconData icon;

  /// [text] is the text to show in the list tile.
  final String text;

  /// [onTap] is the callback to call when the list tile is tapped.
  final Future<void> Function() onTap;

  /// Constructor for [DialogListTile].
  const DialogListTile({
    Key? key,
    required this.icon,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  State<DialogListTile> createState() => _DialogListTileState();
}

class _DialogListTileState extends State<DialogListTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(widget.icon),
      title: CustomText(widget.text),
      trailing: const Icon(Icons.chevron_right),
      onTap: widget.onTap,
    );
  }
}
