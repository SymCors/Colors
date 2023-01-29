import 'package:colors/core/blocs/color/color_cubit.dart';
import 'package:colors/core/constants/app_regex.dart';
import 'package:colors/core/constants/constants.dart';
import 'package:colors/core/constants/dimension_constants.dart';
import 'package:colors/core/constants/strings.dart';
import 'package:colors/core/helpers/app_helper.dart';
import 'package:colors/core/widgets/custom_inherited_widget.dart';
import 'package:colors/core/widgets/custom_outlined_textform_field.dart';
import 'package:colors/view/widgets/custom_app_bar/contents/appbar_close_icon.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// [AppBarSearchBar] is the widget that displays the search bar.
class AppBarSearchBar extends StatefulWidget {
  /// animationController is the controller for the animation.
  final AnimationController? animationController;

  /// Constructor for [AppBarSearchBar].
  const AppBarSearchBar({
    super.key,
    required this.animationController,
  });

  @override
  State<AppBarSearchBar> createState() => _AppBarSearchBarState();
}

class _AppBarSearchBarState extends State<AppBarSearchBar> {
  final TextEditingController _searchController = TextEditingController();
  final GlobalKey<FormState> _searchKey = GlobalKey<FormState>();

  void _onDismissPressed() {
    AppHelper.dismissKeyboard(context);
    setState(() {
      _searchController.text = '';
    });
    _searchKey.currentState?.validate();
  }

  void _onChanged(String value) {
    setState(() {
      if (_searchKey.currentState?.validate() != true) {
        return;
      } else if (value.length < Constants.appColorLength) {
        return;
      }
      final Offset center = AppHelper.getCenter(context);
      context.read<ColorCubit>().onSearch(center, value);
      widget.animationController?.forward(from: 0);
    });
  }

  String? _validator(String? value) {
    if (value == null || value.isEmpty) {
      return null;
    } else if (value.length < Constants.appColorLength) {
      return null;
    } else if (value.length == Constants.appMaxColorLength &&
        !value.startsWith('#')) {
      return Strings.invalidColor;
    } else if (!AppRegex.hexColorRegexp.hasMatch(value)) {
      return Strings.invalidColor;
    }

    return null;
  }

  @override
  void dispose() {
    _searchKey.currentState?.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomInheritedWidget(
      locale: context.locale,
      body: Form(
        key: _searchKey,
        child: CustomOutlinedTextFormField(
          controller: _searchController,
          padding: const EdgeInsets.symmetric(
            horizontal: DimensionConstants.px10,
          ),
          hintText: '${Strings.showColorFromHex}...',
          inputFormatters: [
            LengthLimitingTextInputFormatter(Constants.appMaxColorLength),
          ],
          errorBorder: _errorBorder(),
          errorStyle: const TextStyle(fontSize: 0),
          onChanged: _onChanged,
          suffixIcon: AppBarCloseIcon(
            visibility: _searchController.text.isNotEmpty,
            onPressed: _onDismissPressed,
          ),
          validator: _validator,
        ),
      ),
    );
  }

  OutlineInputBorder _errorBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(DimensionConstants.px10),
      borderSide: const BorderSide(
        color: Colors.red,
      ),
    );
  }
}
