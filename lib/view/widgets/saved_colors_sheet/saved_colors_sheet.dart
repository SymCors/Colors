import 'package:colors/core/blocs/saved_colors/saved_colors_cubit.dart';
import 'package:colors/core/constants/dimension_constants.dart';
import 'package:colors/view/widgets/saved_colors_sheet/contents/sheet_error_widget.dart';
import 'package:colors/view/widgets/saved_colors_sheet/contents/sheet_loading_widget.dart';
import 'package:colors/view/widgets/saved_colors_sheet/contents/sheet_no_colors_widget.dart';
import 'package:colors/view/widgets/saved_colors_sheet/contents/sheet_saved_color_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// [SavedColorsSheet] is the widget that displays the saved colors.
class SavedColorsSheet extends StatefulWidget {
  /// Constructor for [SavedColorsSheet].
  const SavedColorsSheet({Key? key}) : super(key: key);

  @override
  State<SavedColorsSheet> createState() => _SavedColorsSheetState();
}

class _SavedColorsSheetState extends State<SavedColorsSheet> {
  @override
  void initState() {
    super.initState();
    context.read<SavedColorsCubit>().getSavedColors();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(
        top: Radius.circular(DimensionConstants.px25),
      ),
      child: BlocBuilder<SavedColorsCubit, SavedColorsState>(
        builder: (context, state) {
          if (state is SavedColorsError) {
            return SheetErrorWidget(message: state.message);
          } else if (state is SavedColorsLoading) {
            return const SheetLoadingWidget();
          } else if (state is SavedColorsLoaded) {
            if (state.colors.isEmpty) {
              return const SheetNoColorsWidget();
            }

            return SheetSavedColorContainer(state: state);
          }

          return const SizedBox();
        },
      ),
    );
  }
}
