import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:qalam_noor_parents/controllers/auth_controller.dart';
import 'package:qalam_noor_parents/controllers/student_controller.dart';
import 'package:qalam_noor_parents/helpers/assets_helper.dart';
import 'package:qalam_noor_parents/helpers/shared_prefs_helper.dart';

import 'package:qalam_noor_parents/shared/global_params.dart';
import 'package:qalam_noor_parents/tools/dialogs_services/snack_bar_service.dart';
import 'package:qalam_noor_parents/tools/ui_tools/custom_scaffold.dart';
import 'package:qalam_noor_parents/tools/ui_tools/ui_tools.dart';
import 'package:qalam_noor_parents/views/login_page/login_page.dart';
import 'package:qalam_noor_parents/views/student_list_page/student_list_page.dart';

import '../../models/agendas/families.dart';
import '../../models/agendas/student.dart';
import '../../shared/item_or.dart';
import '../bottom_nav_bar_scaffold_page/bottom_nav_bar_scaffold_page.dart';

class LoaderPage extends StatelessWidget {
  static const String routeName = '/loaderPage';
  const LoaderPage({super.key});

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
    await Future.delayed(const Duration(seconds: 2));
    //If User previously logged in
    if (!SharedPrefsHelper.instance.isLoggedIn()) {
      Get.offAllNamed(LoginPage.routeName);

      return;
    }
    String? username = SharedPrefsHelper.instance.getUsername();
    String? password = SharedPrefsHelper.instance.getPassword();
    if (username == null) {
      SnackbarService.showErrorSnackBar(
        title: 'Login Failed',
        message: 'Username Failed To Load',
      );
      Get.offAllNamed(LoginPage.routeName);
      return;
    }
    if (password == null) {
      Get.offAllNamed(LoginPage.routeName);

      SnackbarService.showErrorSnackBar(
        title: 'Login Failed',
        message: 'Password Failed To Load',
      );
      return;
    }

    ItemOr<Family?, String> loginResult = await AuthController.instance
        .loginUserByCredentials(username: username, password: password);
    if (!loginResult.didSucceed) {
      SnackbarService.showErrorSnackBar(
        title: 'Login Failed',
        message: loginResult.other,
      );
      SharedPrefsHelper().clearSharedPrefs();
      Get.offAllNamed(LoginPage.routeName);
      return;
    }

    GlobalParams.currentUser = loginResult.item!;
    int? currentStudentId = SharedPrefsHelper.instance.getCurrentStudentId();
    if (currentStudentId == null) {
      Get.offAllNamed(StudentListPage.routeName);
      return;
    }
    Student student = await StudentController.instance
        .getStudentById(studentId: currentStudentId);
    GlobalParams.selectedStudent = student;
    print(student.toString());
    Get.offAllNamed(BottomNavBarScaffoldPage.routeName);
    //Get Username and password
    //try login with username and password
    //if failed to login redirect to login page and clear shared preferences
  }
}
