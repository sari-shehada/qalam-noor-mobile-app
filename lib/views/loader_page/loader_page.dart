import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../controllers/auth_controller.dart';
import '../../controllers/student_controller.dart';
import '../../helpers/assets_helper.dart';
import '../../helpers/shared_prefs_helper.dart';
import '../../models/agendas/families.dart';
import '../../models/agendas/student.dart';
import '../../shared/global_params.dart';
import '../../shared/item_or.dart';
import '../../tools/dialogs_services/snack_bar_service.dart';
import '../../tools/ui_tools/custom_scaffold.dart';
import '../../tools/ui_tools/ui_tools.dart';
import '../bottom_nav_bar_scaffold_page/bottom_nav_bar_scaffold_page.dart';
import '../login_page/login_page.dart';
import '../student_list_page/student_list_page.dart';

class LoaderPage extends StatelessWidget {
  const LoaderPage({super.key});
  static const String routeName = '/loaderPage';

  @override
  Widget build(BuildContext context) {
    _handleNavigationAccordingToLoginStatus();
    return CustomScaffold(
      bodyPadding: EdgeInsets.symmetric(horizontal: 40.w),
      body: Column(
        children: [
          const Spacer(),
          AspectRatio(
            aspectRatio: 1,
            child: Image.asset(AssetsHelper.appLogoPath),
          ),
          Text(
            'قلم و نور',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          AddVerticalSpacing(value: 10.h),
          Text(
            'التطبيق الخاص بالاهل',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const Spacer(),
          LoadingAnimationWidget.threeRotatingDots(
            color: Get.theme.colorScheme.primary,
            size: 50.w,
          ),
          const Spacer(),
        ],
      ),
    );
  }

  Future<void> _handleNavigationAccordingToLoginStatus() async {
    await Future<void>.delayed(const Duration(seconds: 2));
    //If User previously logged in
    if (!SharedPrefsHelper.instance.isLoggedIn()) {
      await Get.offAllNamed<void>(LoginPage.routeName);
      return;
    }
    final String? username = SharedPrefsHelper.instance.getUsername();
    final String? password = SharedPrefsHelper.instance.getPassword();
    if (username == null) {
      SnackbarService.showErrorSnackBar(
        title: 'Login Failed',
        message: 'Username Failed To Load',
      );
      await Get.offAllNamed<void>(LoginPage.routeName);
      return;
    }
    if (password == null) {
      await Get.offAllNamed<void>(LoginPage.routeName);

      SnackbarService.showErrorSnackBar(
        title: 'Login Failed',
        message: 'Password Failed To Load',
      );
      return;
    }

    final ItemOr<Family?, String> loginResult = await AuthController.instance
        .loginUserByCredentials(username: username, password: password);
    if (!loginResult.didSucceed) {
      SnackbarService.showErrorSnackBar(
        title: 'Login Failed',
        message: loginResult.other,
      );
      await SharedPrefsHelper().clearSharedPrefs();
      await Get.offAllNamed<void>(LoginPage.routeName);
      return;
    }

    GlobalParams.currentUser = loginResult.item!;
    final int? currentStudentId =
        SharedPrefsHelper.instance.getCurrentStudentId();
    if (currentStudentId == null) {
      await Get.offAllNamed<void>(StudentListPage.routeName);
      return;
    }
    final Student student = await StudentController.instance
        .getStudentById(studentId: currentStudentId);
    GlobalParams.selectedStudent = student;
    log(student.toString());
    await Get.offAllNamed<void>(BottomNavBarScaffoldPage.routeName);
  }
}
