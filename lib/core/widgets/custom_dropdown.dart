import 'package:colors/core/constants/dimension_constants.dart';
import 'package:colors/core/constants/styles.dart';
import 'package:colors/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';

/// [CustomDropDown] is the custom dropdown widget.
class CustomDropDown<T> extends StatefulWidget {
  /// List of items to be shown in the dropdown.
  final List<T?>? items;

  /// List of custom items to be shown in the dropdown.
  final List<DropdownMenuItem<T>>? customItems;

  /// Callback to be called when the value of the dropdown changes.
  final void Function(Object?)? onChanged;

  /// The value of the dropdown.
  final T? selectedValue;

  /// The label text for the dropdown.
  final String? labelText;

  /// Constructor for [CustomDropDown].
  const CustomDropDown({
    Key? key,
    required this.onChanged,
    this.items,
    this.customItems,
    this.selectedValue,
    this.labelText,
  }) : super(key: key);

  @override
  State<CustomDropDown<T>> createState() => _CustomDropDownState();
}

class _CustomDropDownState<T> extends State<CustomDropDown<T>> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      borderRadius:
          const BorderRadius.all(Radius.circular(DimensionConstants.px5)),
      value: widget.selectedValue,
      decoration: InputDecoration(
        labelText: widget.labelText,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(DimensionConstants.px5),
          ),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: DimensionConstants.px10),
      ),
      isDense: true,
      isExpanded: true,
      style: Styles.defaultTextStyle(context),
      items: widget.customItems ??
          widget.items?.map((item) {
            return DropdownMenuItem<T>(
              value: item,
              child: CustomText(item.toString()),
            );
          }).toList(),
      onChanged: widget.onChanged,
    );
  }
}
