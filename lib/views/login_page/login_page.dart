import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../helpers/assets_helper.dart';
import '../../tools/ui_tools/buttons.dart';
import '../../tools/ui_tools/custom_scaffold.dart';
import '../../tools/ui_tools/text_fields.dart';
import '../../tools/ui_tools/ui_tools.dart';
import 'controllers/login_page_controller.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  static const String routeName = '/loginPage';

  @override
  Widget build(BuildContext context) {
    final LoginPageController controller = Get.put(LoginPageController());
    return CustomScaffold(
      bodyPadding: EdgeInsets.symmetric(horizontal: 30.w),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            AddVerticalSpacing(
              value: Platform.isIOS
                  ? MediaQuery.of(context).viewPadding.top * 1.7
                  : 100.h,
            ),
            Image.asset(
              AssetsHelper.appLogoPath,
              height: 220.h,
              width: 220.h,
              fit: BoxFit.cover,
            ),
            AddVerticalSpacing(value: 30.h),
            Text(
              'قلم و نور',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            AddVerticalSpacing(value: 10.h),
            Text(
              'التطبيق الخاص بالاهل',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            AddVerticalSpacing(value: 30.h),
            LabeledTextField(
              label: 'اسم المستخدم',
              controller: controller.usernameTxtEditingCtrl,
              fillColor: const Color(0xFFBACCE2),
              validator: (String? txt) {
                return 'test';
              },
            ),
            AddVerticalSpacing(value: 10.h),
            LabeledTextField(
              label: 'كلمة المرور',
              controller: controller.passwordTxtEditingCtrl,
              fillColor: const Color(0xFFBACCE2),
              isObscure: true,
            ),
            AddVerticalSpacing(value: 30.h),
            CustomFilledButton(
              onTap: controller.executeLogin,
              child: 'تسجيل الدخول',
              buttonStatus: controller.loginButtonStatus,
            ),
          ],
        ),
      ),
    );
  }
}
