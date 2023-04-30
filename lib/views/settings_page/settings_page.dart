import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../helpers/shared_prefs_helper.dart';
import '../../tools/ui_tools/custom_appbar.dart';
import '../../tools/ui_tools/custom_scaffold.dart';
import '../login_page/login_page.dart';

class SettingsPage extends StatelessWidget {
  static const String routeName = '/settingsPage';
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: CustomAppBar(
        title: 'الإعدادات',
        backButtonEnabled: false,
        actions: [
          IconButton(
            tooltip: 'تسجيل الخروج',
            onPressed: () async {
              await SharedPrefsHelper.instance.clearSharedPrefs();
              Get.offAllNamed(LoginPage.routeName);
            },
            icon: Icon(
              Icons.login,
              color: Theme.of(context).textTheme.titleMedium!.color,
              size: 20.sp,
            ),
          ),
        ],
      ),
    );
  }
}
