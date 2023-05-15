import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<T?> openDialog<T>({
  String title = "Alert",
  EdgeInsetsGeometry? titlePadding,
  TextStyle? titleStyle,
  Widget? content,
  EdgeInsetsGeometry? contentPadding,
  T? Function()? onConfirm,
  T? Function()? onCancel,
  Color? cancelTextColor,
  Color? confirmTextColor,
  String? textConfirm,
  String? textCancel,
  String? textCustom,
  Widget? confirm,
  Widget? cancel,
  Widget? custom,
  Color? backgroundColor,
  bool barrierDismissible = true,
  Color? buttonColor,
  String middleText = "Dialog made in 3 lines of code",
  TextStyle? middleTextStyle,
  double radius = 20.0,
  List<Widget>? actions,
  Future<bool> Function()? onWillPop,
  GlobalKey<NavigatorState>? navigatorKey,
}) async {
  Completer<T?> completer = Completer<T?>();
  Get.defaultDialog<T>(
    title: title,
    titlePadding: titlePadding,
    titleStyle: titleStyle,
    content: content,
    contentPadding: contentPadding,
    onConfirm: () {
      if (onConfirm != null) {
        completer.complete(onConfirm());
        Get.back();
        return;
      }
      Get.back();
      completer.complete();
    },
    onCancel: () {
      if (onCancel != null) {
        completer.complete(onCancel());
        Get.back();
        return;
      }
      Get.back();
      completer.complete();
    },
    onCustom: null,
    cancelTextColor: cancelTextColor,
    confirmTextColor: confirmTextColor,
    textConfirm: textConfirm,
    textCancel: textCancel,
    textCustom: textCustom,
    confirm: confirm,
    cancel: cancel,
    custom: custom,
    backgroundColor: backgroundColor,
    barrierDismissible: barrierDismissible,
    buttonColor: buttonColor,
    middleText: middleText,
    middleTextStyle: middleTextStyle,
    radius: radius,
    actions: actions,
    onWillPop: onWillPop,
    navigatorKey: navigatorKey,
  );
  return completer.future;
}
