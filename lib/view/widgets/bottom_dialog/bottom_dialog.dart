import 'package:colors/core/blocs/color/color_cubit.dart';
import 'package:colors/core/constants/dimension_constants.dart';
import 'package:colors/view/widgets/bottom_dialog/bottom_dialog_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// [BottomDialog] is the bottom dialog that shows the color details.
class BottomDialog extends StatelessWidget {
  /// Constructor for [BottomDialog].
  const BottomDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).cardColor,
      margin: const EdgeInsets.all(DimensionConstants.px10),
      child: Padding(
        padding: const EdgeInsets.all(DimensionConstants.px10),
        child: BlocBuilder<ColorCubit, ColorState>(
          builder: (context, state) {
            if (state is ColorLoaded) {
              final colorModel = state.colorModel;

              return BottomDialogContent(colorModel: colorModel);
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}
