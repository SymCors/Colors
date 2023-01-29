// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:colors/core/constants/dimension_constants.dart';
import 'package:colors/core/constants/strings.dart';
import 'package:colors/core/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Custom text form field with outlined border.
class CustomOutlinedTextFormField extends StatelessWidget {
  /// Padding of the text form field.
  final EdgeInsetsGeometry? padding;

  /// Style of the text form field.
  final TextStyle? style;

  /// Fill color of the text form field.
  final Color? fillColor;

  /// Whether the text form field is filled or not.
  final bool? filled;

  /// Border of the text form field.
  final InputBorder? border;

  /// Focused Border of the text form field.
  final InputBorder? focusedBorder;

  /// Enabled Border of the text form field.
  final InputBorder? enabledBorder;

  /// Error Border of the text form field.
  final InputBorder? errorBorder;

  /// Content padding of the text form field.
  final EdgeInsetsGeometry? contentPadding;

  /// Max lines of the text form field.
  final int? maxLines;

  /// Max length of the text form field.
  final int? maxLength;

  /// Hint text of the text form field.
  final String? hintText;

  /// Text alignment of the text form field.
  final TextAlign? textAlign;

  /// Prefix icon of the text form field.
  final Widget? prefixIcon;

  /// Prefix icon of the text form field.
  final Widget? suffixIcon;

  /// On changed callback of the text form field.
  final void Function(String)? onChanged;

  /// Controller of the text form field.
  final TextEditingController? controller;

  /// Input formatters of the text form field.
  final List<TextInputFormatter>? inputFormatters;

  /// Validator of the text form field.
  final String? Function(String?)? validator;

  /// Error style of the text form field.
  final TextStyle? errorStyle;

  /// Constructor for [CustomOutlinedTextFormField].
  const CustomOutlinedTextFormField({
    Key? key,
    this.padding,
    this.style,
    this.fillColor,
    this.filled,
    this.border,
    this.focusedBorder,
    this.enabledBorder,
    this.errorBorder,
    this.contentPadding,
    this.maxLines,
    this.maxLength,
    this.hintText,
    this.textAlign,
    this.prefixIcon,
    this.suffixIcon,
    this.onChanged,
    this.controller,
    this.inputFormatters,
    this.validator,
    this.errorStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ??
          const EdgeInsets.symmetric(horizontal: DimensionConstants.px20),
      child: TextFormField(
        controller: controller,
        onChanged: onChanged,
        textAlign: textAlign ?? TextAlign.start,
        style: style ?? Styles.defaultTextStyle(context),
        maxLines: maxLines ?? 1,
        maxLength: maxLength,
        inputFormatters: inputFormatters,
        validator: validator,
        decoration: _decoration(context),
      ),
    );
  }

  InputDecoration _decoration(BuildContext context) {
    return InputDecoration(
      prefixIcon: prefixIcon ?? const Icon(Icons.color_lens_outlined),
      suffixIcon: suffixIcon,
      hintText: hintText ?? '${Strings.search}...',
      fillColor: fillColor ?? Theme.of(context).cardColor,
      filled: filled ?? true,
      errorStyle: errorStyle,
      border: border ?? _border(),
      focusedBorder: focusedBorder ?? _border(),
      enabledBorder: enabledBorder ?? _border(),
      errorBorder: errorBorder ?? _border(),
      contentPadding: contentPadding ??
          const EdgeInsets.symmetric(
            horizontal: DimensionConstants.px10,
          ),
    );
  }

  OutlineInputBorder _border() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(DimensionConstants.px10),
      borderSide: const BorderSide(style: BorderStyle.none),
    );
  }
}
