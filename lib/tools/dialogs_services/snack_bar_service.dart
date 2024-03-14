import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../helpers/theme_helper.dart';
import '../ui_tools/ui_tools.dart';

class SnackbarService extends GetxService {
  static void showErrorSnackBar(
      {required String title, required String message}) {
    Get.showSnackbar(
      GetSnackBar(
        borderRadius: 15,
        margin: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
        // padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        icon: Row(
          children: <Widget>[
            AddHorizontalSpacing(value: 20.w),
            FaIcon(
              FontAwesomeIcons.x,
              color: Colors.white,
              size: 15.sp,
            ),
          ],
        ),
        title: title,
        message: message,
        backgroundColor: lightColorScheme.error,
        duration: const Duration(seconds: 2),
        snackPosition: SnackPosition.TOP,
      ),
    );
  }

  static void showSuccessSnackBar(
      {required String title, required String message}) {
    Get.showSnackbar(
      GetSnackBar(
        borderRadius: 15,
        margin: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
        icon: Row(
          children: <Widget>[
            AddHorizontalSpacing(value: 20.w),
            FaIcon(
              FontAwesomeIcons.check,
              color: Colors.white,
              size: 15.sp,
            ),
          ],
        ),
        title: title,
        message: message,
        backgroundColor: Colors.green.shade400,
        duration: const Duration(seconds: 2),
        snackPosition: SnackPosition.TOP,
      ),
    );
  }
}
