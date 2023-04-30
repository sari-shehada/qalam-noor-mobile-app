import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qalam_noor_parents/controllers/auth_controller.dart';
import 'package:qalam_noor_parents/helpers/shared_prefs_helper.dart';
import 'package:qalam_noor_parents/models/agendas/families.dart';
import 'package:qalam_noor_parents/models/user_model.dart';
import 'package:qalam_noor_parents/shared/global_params.dart';
import 'package:qalam_noor_parents/shared/item_or.dart';
import 'package:qalam_noor_parents/views/bottom_nav_bar_scaffold_page/bottom_nav_bar_scaffold_page.dart';

import '../../../controllers/student_controller.dart';
import '../../../models/agendas/student.dart';
import '../../../tools/dialogs_services/snack_bar_service.dart';
import '../../../tools/ui_tools/buttons.dart';
import '../../student_list_page/student_list_page.dart';

class LoginPageController extends GetxController {
  TextEditingController usernameTxtEditingCtrl = TextEditingController();
  TextEditingController passwordTxtEditingCtrl = TextEditingController();
  Rx<CustomButtonStatus> loginButtonStatus = CustomButtonStatus.enabled.obs;

  String? _validateFields() {
    if (usernameTxtEditingCtrl.text.trim().isEmpty) {
      return 'يجب ملئ اسم المستخدم اولاً';
    }
    if (passwordTxtEditingCtrl.text.trim().isEmpty) {
      return 'يجب ملئ كلمة المرور اولاً';
    }
    if (passwordTxtEditingCtrl.text.trim().length < 7) {
      return 'يجب ان تكون كلمة المرور اكثر من ٧ حروف';
    }
    return null;
  }

  Future<void> executeLogin() async {
    String? validationMessage = _validateFields();

    if (validationMessage != null) {
      SnackbarService.showErrorSnackBar(
        title: 'فشل تسجيل الدخول',
        message: validationMessage,
      );
      return;
    }
    loginButtonStatus.value = CustomButtonStatus.processing;
    String username = usernameTxtEditingCtrl.text.trim();
    String password = passwordTxtEditingCtrl.text.trim();
    ItemOr<Family?, String> loginResult = await AuthController.instance
        .loginUserByCredentials(username: username, password: password);
    loginButtonStatus.value = CustomButtonStatus.enabled;

    if (loginResult.didSucceed) {
      GlobalParams.currentUser = loginResult.item!;

      await SharedPrefsHelper.instance.setLoginStatus(true);
      await SharedPrefsHelper.instance.setUsername(username);
      await SharedPrefsHelper.instance.setPassword(password);
      int? currentStudentId = SharedPrefsHelper.instance.getCurrentStudentId();
      if (currentStudentId == null) {
        Get.offAllNamed(StudentListPage.routeName);
        return;
      }
      Student student = await StudentController.instance
          .getStudentById(studentId: currentStudentId);
      GlobalParams.selectedStudent = student;
      Get.offAllNamed(BottomNavBarScaffoldPage.routeName);
      return;
    }
    SnackbarService.showErrorSnackBar(
      title: 'فشل تسجيل الدخول',
      message: loginResult.other,
    );
  }
}
