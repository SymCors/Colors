import 'package:colors/core/blocs/saved_colors/saved_colors_cubit.dart';
import 'package:colors/core/constants/dimension_constants.dart';
import 'package:colors/core/constants/extensions.dart';
import 'package:colors/core/constants/styles.dart';
import 'package:colors/view/widgets/saved_colors_sheet/contents/saved_color_dialog/saved_color_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// [SheetSavedColorContainer] is the widget that displays the saved colors.
class SheetSavedColorContainer extends StatelessWidget {
  /// [state] is the [SavedColorsLoaded] state.
  final SavedColorsLoaded state;

  /// Constructor for [SheetSavedColorContainer].
  const SheetSavedColorContainer({
    super.key,
    required this.state,
  });

  Future<String?> _showDialog(BuildContext context, int index) {
    return showCupertinoDialog<String>(
      context: context,
      builder: (context) => SavedColorDialog(color: state.colors[index]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: state.colors.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => InkWell(
        onLongPress: () => _showDialog(context, index),
        child: Container(
          height: double.infinity,
          width: DimensionConstants.px150,
          color: Extensions.fromHex(state.colors[index]),
          child: Center(
            child: Text(
              state.colors[index],
              style: Styles.colorTextStyle(
                context,
                Extensions.fromHex(state.colors[index]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
