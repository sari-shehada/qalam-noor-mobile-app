import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../helpers/shared_prefs_helper.dart';
import '../../shared/global_params.dart';
import '../../tools/dialogs_services/open_dialog_service.dart';
import '../../tools/ui_tools/buttons.dart';
import '../../tools/ui_tools/custom_appbar.dart';
import '../../tools/ui_tools/custom_scaffold.dart';
import '../../tools/ui_tools/ui_tools.dart';
import '../login_page/login_page.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});
  static const String routeName = '/settingsPage';

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: const CustomAppBar(
        title: 'الإعدادات',
        backButtonEnabled: false,
        isShadowed: false,
      ),
      body: Column(
        children: [
          const _FamilyProfileCard(),
          AddVerticalSpacing(value: 20.h),
          const _OtherSettingsCard(),
          const Expanded(child: SizedBox()),
        ],
      ),
    );
  }
}

class _OtherSettingsCard extends StatelessWidget {
  const _OtherSettingsCard();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Padding(
        padding: EdgeInsets.only(
          left: 20.w,
          right: 20.w,
          bottom: 20.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'الابن الحالي: ${GlobalParams.selectedStudent.firstName}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            AddVerticalSpacing(value: 10.h),
            _buildSettingsOptionListTile(
              context,
              iconData: Icons.person,
              title: 'تغيير الابن الحالي',
            ),
            AddVerticalSpacing(value: 10.h),
            Text(
              'أخرى',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            AddVerticalSpacing(value: 10.h),
            _buildSettingsOptionListTile(
              context,
              iconData: Icons.info,
              title: 'حول التطبيق',
            ),
            AddVerticalSpacing(value: 10.h),
            _buildSettingsOptionListTile(
              context,
              iconData: Icons.logout,
              title: 'تسجيل الخروج',
              onTap: () async {
                await SharedPrefsHelper.instance.clearSharedPrefs();
                await Get.offAllNamed<void>(LoginPage.routeName);
              },
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Copyright © Qalam & Noor 2023',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(fontStyle: FontStyle.italic),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  ListTile _buildSettingsOptionListTile(
    BuildContext context, {
    required String title,
    required IconData iconData,
    void Function()? onTap,
  }) {
    return ListTile(
      onTap: onTap,
      splashColor: Theme.of(context).colorScheme.primary.withOpacity(.2),
      tileColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.r),
      ),
      dense: true,
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.bold,
            ),
      ),
      leading: Icon(
        iconData,
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}

class _FamilyProfileCard extends StatelessWidget {
  const _FamilyProfileCard();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40.r),
            bottomRight: Radius.circular(40.r),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.1),
              spreadRadius: 1,
              offset: const Offset(-1, 2),
              blurRadius: 2,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 135.h,
              width: 135.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).colorScheme.primary,
              ),
              child: Icon(
                Icons.group,
                color: Colors.white,
                size: 80.sp,
              ),
            ),
            AddVerticalSpacing(value: 10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Wrap(
                children: [
                  Text(
                    GlobalParams.currentUser.userName,
                    style: Theme.of(context).textTheme.headlineSmall,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            AddVerticalSpacing(value: 10.h),
            CustomOutlinedButton(
              height: 45.h,
              width: 150.w,
              onTap: () async {
                await DialogService.openConfirmationDialog<void>(
                  title: 'Test Title',
                  // showCloseButton: false,
                  // size: const Size(double.infinity, 700),
                  dialogAlias: 'Settings - ChangePassword',
                  // actions: Row(
                  //   children: [
                  //     const Text('Hell'),
                  //     ElevatedButton(
                  //       onPressed: () {},
                  //       child: const Text('test'),
                  //     )
                  //   ],
                  // ),
                );
              },
              child: Text(
                'تغيير كلمة المرور',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
