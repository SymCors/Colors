import 'package:colors/core/base/base_view.dart';
import 'package:colors/core/blocs/color/color_cubit.dart';
import 'package:colors/view/widgets/center_title_and_dialog.dart';
import 'package:colors/view/widgets/circle_paint_displayer.dart';
import 'package:colors/view/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// [HomeView] is the main screen of the app.
class HomeView extends StatefulWidget {
  /// Constructor for [HomeView].
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  DateTime? currentBackPressTime;
  AnimationController? _controller;

  Future<bool> _onWillPop() async {
    final now = DateTime.now();
    final backButton = currentBackPressTime == null ||
        now.difference(currentBackPressTime ?? DateTime.now()) >
            const Duration(seconds: 2);
    if (backButton) {
      currentBackPressTime = now;

      return false;
    }

    return true;
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ColorCubit, ColorState>(
      builder: (context, state) {
        final colorModel = (state as ColorLoaded).colorModel;

        return BaseView(
          onWillPop: _onWillPop,
          appBar: CustomAppBar(animationController: _controller),
          backgroundColor: colorModel.previousColor,
          body: Stack(
            alignment: Alignment.topCenter,
            children: [
              CirclePaintDisplayer(
                controller: _controller,
                colorModel: colorModel,
              ),
              CenterTitleAndDialog(colorModel: colorModel),
            ],
          ),
        );
      },
    );
  }
}
