import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDropDownMenu<T> extends StatelessWidget {
  const CustomDropDownMenu({
    required this.dropdownMenuEntries, required this.onSelected, super.key,
    this.width = 750,
    this.initialSelection,
    this.controller,
    this.enabled = true,
  });

  final T? initialSelection;
  final double width;
  final bool enabled;
  final List<DropdownMenuEntry<T>> dropdownMenuEntries;
  final void Function(T? item)? onSelected;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<T>(
      width: width.w,
      initialSelection: initialSelection,
      dropdownMenuEntries: dropdownMenuEntries,
      onSelected: onSelected,
      enabled: enabled,
      controller: controller,
    );
  }
}
