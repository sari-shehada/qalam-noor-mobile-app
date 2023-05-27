import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../helpers/fonts_helper.dart';
import '../../helpers/styles_helper.dart';

import '../../helpers/theme_helper.dart';

class CustomFilledButton<T> extends StatelessWidget {
  const CustomFilledButton({
    required this.onTap, required this.child, super.key,
    this.labelColor,
    this.backgroundColor,
    this.height,
    this.width = double.infinity,
    this.buttonStatus,
    this.loadingColor = Colors.white,
    this.useShadow = true,
  });

  final Color? labelColor;
  final VoidCallback onTap;
  final Color? backgroundColor;
  final double? height;
  final double width;
  final Rx<CustomButtonStatus>? buttonStatus;
  final Color loadingColor;
  final T child;
  final bool useShadow;

  @override
  Widget build(BuildContext context) {
    final List<BoxShadow> shadow = [
      BoxShadow(
        offset: Offset(0.w, 4.h),
        blurRadius: 12.r,
        color: Colors.black.withOpacity(.08),
      ),
    ];
    if (buttonStatus == null) {
      return Container(
        height: height ?? 58.h,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(StylesHelper.globalBorderRadius),
          boxShadow: !useShadow ? null : shadow,
        ),
        child: Material(
          color: backgroundColor ?? Get.theme.colorScheme.primary,
          borderRadius: BorderRadius.circular(StylesHelper.globalBorderRadius),
          child: InkWell(
            onTap: onTap,
            borderRadius:
                BorderRadius.circular(StylesHelper.globalBorderRadius),
            child: Center(
              child: _buildChild(),
            ),
          ),
        ),
      );
    }
    return Container(
      height: height ?? 58.h,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(StylesHelper.globalBorderRadius),
        boxShadow: [
          BoxShadow(
            offset: Offset(0.w, 4.h),
            blurRadius: 12.r,
            color: Colors.black.withOpacity(.08),
          ),
        ],
      ),
      child: Material(
        color: backgroundColor ?? Get.theme.colorScheme.primary,
        borderRadius: BorderRadius.circular(StylesHelper.globalBorderRadius),
        child: Obx(
          () {
            switch (buttonStatus!.value) {
              case CustomButtonStatus.enabled:
                {
                  return InkWell(
                    onTap: onTap,
                    borderRadius:
                        BorderRadius.circular(StylesHelper.globalBorderRadius),
                    child: Center(
                      child: _buildChild(),
                    ),
                  );
                }
              case CustomButtonStatus.disabled:
                {
                  return InkWell(
                    borderRadius:
                        BorderRadius.circular(StylesHelper.globalBorderRadius),
                    child: Center(
                      child: _buildChild(),
                    ),
                  );
                }
              case CustomButtonStatus.processing:
                {
                  return Center(
                    child: SizedBox.square(
                      dimension: 30.h,
                      child: CircularProgressIndicator(
                        color: loadingColor,
                        strokeWidth: 4.sp,
                      ),
                    ),
                  );
                }
            }
          },
        ),
      ),
    );
  }

  Widget _buildChild() {
    assert(child is String || child is Widget,
        'Expected a widget or string for the child of the CustomFilledButton but got <${child.runtimeType}>');

    if (child is String) {
      return Text(
        child as String,
        style: TextStyle(
          fontFamily: FontsHelper.fontFamily,
          fontSize: 17.sp,
          color: labelColor ?? lightColorScheme.primaryContainer,
        ),
      );
    }
    return child as Widget;
  }
}

enum CustomButtonStatus { enabled, disabled, processing }

class CustomOutlinedButton<T> extends StatelessWidget {
  const CustomOutlinedButton({
    required this.onTap, required this.child, super.key,
    this.outlineColor,
    this.height,
    this.width = double.infinity,
    this.buttonStatus,
    this.useShadow = false,
    this.backgroundColor,
    this.outlineWidth,
  });

  final Color? outlineColor;
  final VoidCallback onTap;
  final double? outlineWidth;
  final Color? backgroundColor;
  final double? height;
  final double width;
  final Rx<CustomButtonStatus>? buttonStatus;
  final T child;
  final bool useShadow;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 58.h,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(StylesHelper.globalBorderRadius),
        color: backgroundColor ?? Colors.transparent,
        border: Border.all(
          color: outlineColor ?? Get.theme.colorScheme.primary,
          width: outlineWidth ?? 2.w,
        ),
        boxShadow: useShadow == true
            ? [
                BoxShadow(
                  offset: Offset(0.w, 4.h),
                  blurRadius: 12.r,
                  color: Colors.black.withOpacity(.08),
                ),
              ]
            : null,
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(StylesHelper.globalBorderRadius),
        child: buttonStatus == null
            ? InkWell(
                onTap: onTap,
                borderRadius:
                    BorderRadius.circular(StylesHelper.globalBorderRadius),
                child: Center(
                  child: _buildChild(),
                ),
              )
            : Obx(
                () {
                  switch (buttonStatus!.value) {
                    case CustomButtonStatus.enabled:
                      {
                        return InkWell(
                          onTap: onTap,
                          borderRadius: BorderRadius.circular(
                              StylesHelper.globalBorderRadius),
                          child: Center(
                            child: _buildChild(),
                          ),
                        );
                      }
                    case CustomButtonStatus.disabled:
                      {
                        return InkWell(
                          borderRadius: BorderRadius.circular(
                              StylesHelper.globalBorderRadius),
                          child: Center(
                            child: _buildChild(),
                          ),
                        );
                      }
                    case CustomButtonStatus.processing:
                      {
                        return Center(
                          child: SizedBox.square(
                            dimension: 30.h,
                            child: CircularProgressIndicator(
                              color: outlineColor,
                              strokeWidth: 4.sp,
                            ),
                          ),
                        );
                      }
                  }
                },
              ),
      ),
    );
  }

  Widget _buildChild() {
    assert(child is String || child is Widget,
        'Expected a widget or string for the child of the CustomOutlinedButton  but got <${child.runtimeType}>');

    if (child is String) {
      return Text(
        child as String,
        style: TextStyle(
          fontFamily: FontsHelper.fontFamily,
          fontSize: 17.sp,
          color: outlineColor ?? lightColorScheme.primary,
        ),
      );
    }
    return child as Widget;
  }
}

class CustomTintedButton<T> extends StatelessWidget {
  const CustomTintedButton({
    required this.onTap, required this.child, super.key,
    this.foregroundColor,
    this.height,
    this.width = double.infinity,
    this.buttonStatus,
    this.useShadow = false,
    this.backgroundColor,
  });

  final Color? foregroundColor;
  final Color? backgroundColor;
  final VoidCallback onTap;
  final double? height;
  final double width;
  final Rx<CustomButtonStatus>? buttonStatus;
  final bool useShadow;
  final T child;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 58.h,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(StylesHelper.globalBorderRadius),
        color: backgroundColor ?? Get.theme.colorScheme.primaryContainer,
        boxShadow: useShadow == true
            ? [
                BoxShadow(
                  offset: Offset(0.w, 4.h),
                  blurRadius: 12.r,
                  color: Colors.black.withOpacity(.08),
                ),
              ]
            : null,
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(StylesHelper.globalBorderRadius),
        child: buttonStatus == null
            ? InkWell(
                onTap: onTap,
                borderRadius:
                    BorderRadius.circular(StylesHelper.globalBorderRadius),
                child: Center(
                  child: _buildChild(),
                ),
              )
            : Obx(
                () {
                  switch (buttonStatus!.value) {
                    case CustomButtonStatus.enabled:
                      {
                        return InkWell(
                          onTap: onTap,
                          borderRadius: BorderRadius.circular(
                              StylesHelper.globalBorderRadius),
                          child: Center(
                            child: _buildChild(),
                          ),
                        );
                      }
                    case CustomButtonStatus.disabled:
                      {
                        return InkWell(
                          borderRadius: BorderRadius.circular(
                              StylesHelper.globalBorderRadius),
                          child: Center(
                            child: _buildChild(),
                          ),
                        );
                      }
                    case CustomButtonStatus.processing:
                      {
                        return Center(
                          child: SizedBox.square(
                            dimension: 30.h,
                            child: CircularProgressIndicator(
                              color: foregroundColor,
                              strokeWidth: 4.sp,
                            ),
                          ),
                        );
                      }
                  }
                },
              ),
      ),
    );
  }

  Widget _buildChild() {
    assert(child is String || child is Widget,
        'Expected a widget or string for the child of the CustomOutlinedButton  but got <${child.runtimeType}>');

    if (child is String) {
      return Text(
        child as String,
        style: TextStyle(
          fontFamily: FontsHelper.fontFamily,
          fontSize: 17.sp,
          color: foregroundColor ?? lightColorScheme.primary,
        ),
      );
    }
    return child as Widget;
  }
}
