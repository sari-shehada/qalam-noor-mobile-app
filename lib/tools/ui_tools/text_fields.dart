import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'ui_tools.dart';

class HintedTextField extends StatelessWidget {
  const HintedTextField({
    required this.hintText, required this.controller, super.key,
    this.textAlign = TextAlign.start,
    this.fillColor,
    this.textColor = Colors.black, //TODO: Change later
    this.hintColor = Colors.grey, //TODO: Change later
    this.contentPadding,
    this.inputFormatters,
    this.fontSize,
    this.isDense = true,
    this.validator,
    this.isObscure = false,
  });

  final String hintText;
  final TextEditingController controller;
  final TextAlign textAlign;
  final Color? fillColor;
  final Color hintColor;
  final Color textColor;
  final bool isDense;
  final EdgeInsets? contentPadding;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final double? fontSize;
  final bool isObscure;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isObscure,
      inputFormatters: inputFormatters,
      validator: validator,
      style: TextStyle(
        fontSize: fontSize ?? 22.sp,
        color: textColor,
      ),
      controller: controller,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        // counterText: containsLetterCount ? null : '',
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: fontSize ?? 22.sp,
          color: hintColor,
        ),
        contentPadding: contentPadding ?? EdgeInsets.symmetric(vertical: 18.h),
        isDense: isDense,
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent, width: 2.w),
          borderRadius: BorderRadius.circular(14.r),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(14.r),
        ),
        filled: true,
        //TODO: Change based on seed color
        fillColor: fillColor ?? const Color(0xFFE3E3E3),
      ),
    );
  }
}

class LabeledTextField extends StatelessWidget {
  const LabeledTextField(
      {required this.controller, required this.label, super.key,
      this.titleColor,
      this.fillColor,
      this.validator,
      this.isObscure = false});

  final String label;
  final Color? titleColor;
  final TextEditingController controller;
  final Color? fillColor;
  final String? Function(String?)? validator;
  final bool isObscure;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            AddHorizontalSpacing(value: 12.w),
            Text(
              label,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                color: titleColor,
              ),
            ),
          ],
        ),
        AddVerticalSpacing(value: 12.h),
        HintedTextField(
          controller: controller,
          hintText: '',
          fillColor: fillColor,
          validator: validator,
          isObscure: isObscure,
        )
      ],
    );
  }
}
