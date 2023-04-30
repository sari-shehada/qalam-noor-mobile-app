import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../helpers/shared_prefs_helper.dart';
import '../../tools/ui_tools/custom_appbar.dart';
import '../../tools/ui_tools/custom_scaffold.dart';
import '../login_page/login_page.dart';

class InboxPage extends StatelessWidget {
  static const String routeName = '/inboxPage';
  const InboxPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: CustomAppBar(
        title: 'صندوق الوارد',
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
