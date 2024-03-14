import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../helpers/fonts_helper.dart';
import '../../helpers/misc_colors.dart';
import '../../helpers/shared_prefs_helper.dart';
import '../../helpers/styles_helper.dart';
import '../../models/agendas/student.dart';
import '../../tools/ui_tools/buttons.dart';
import '../../tools/ui_tools/custom_appbar.dart';
import '../../tools/ui_tools/custom_scaffold.dart';
import '../../tools/ui_tools/ui_tools.dart';
import '../login_page/login_page.dart';
import 'controller/student_list_page_controller.dart';

class StudentListPage extends StatelessWidget {
  const StudentListPage({super.key});
  static const String routeName = '/studentListPage';

  @override
  Widget build(BuildContext context) {
    final StudentListPageController controller =
        Get.put(StudentListPageController());

    return CustomScaffold(
      appBar: CustomAppBar(
        title: 'ابنائي',
        backButtonEnabled: false,
        actions: [
          IconButton(
            tooltip: 'تسجيل الخروج',
            onPressed: () async {
              await SharedPrefsHelper.instance.clearSharedPrefs();
              await Get.offAllNamed<void>(LoginPage.routeName);
            },
            icon: Icon(
              Icons.login,
              color: Theme.of(context).textTheme.titleMedium!.color,
              size: 20.sp,
            ),
          ),
        ],
      ),
      bottomSection: _buildBottomSection(controller, context),
      bodyPadding: EdgeInsets.symmetric(horizontal: 30.w),
      body: Column(
        children: [
          Obx(() {
            return LinearProgressIndicator(
              color: controller.isLoadingData.value ? null : Colors.transparent,
              backgroundColor: Colors.transparent,
            );
          }),
          AddVerticalSpacing(value: 20.h),
          buildStudentCard(controller, context),
          AddVerticalSpacing(value: 20.h),
          const Text('قم باختيار الابن الذي سيتم عرض تفاصيله في النظام'),
          AddVerticalSpacing(value: 20.h),
          Expanded(
            child: Obx(
              () {
                if (controller.isLoadingData.value) {
                  return Center(
                    child: LoadingAnimationWidget.fallingDot(
                      color: Theme.of(context).colorScheme.primary,
                      size: 40.w,
                    ),
                  );
                }
                if (controller.myChildren.isEmpty) {
                  return const Center(
                    child: Text('ليس لديك ابناء مسجلين حالياً'),
                  );
                }
                return ListView.builder(
                  itemCount: controller.myChildren.length,
                  itemBuilder: (BuildContext context, int index) =>
                      _StudentCard(
                    student: controller.myChildren[index],
                    controller: controller,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  SizedBox buildStudentCard(
      StudentListPageController controller, BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 150.h,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: <Color>[
              MiscColors.getMiscColor(4).withOpacity(.8),
              MiscColors.getMiscColor(4),
            ],
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
        child: Obx(() {
          if (controller.selectedStudent.value == null) {
            return Center(
              child: Text(
                'لم يتم اختيار أي ابن حالياً',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Colors.white,
                    ),
              ),
            );
          }
          return SizedBox.expand(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
              child: Column(
                children: [
                  Text(
                    'الابن الحالي',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp,
                        ),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 30.r,
                        backgroundColor: Colors.white,
                        child: Icon(
                          controller.selectedStudent.value!.isMale
                              ? Icons.male
                              : Icons.female,
                          size: 35.sp,
                          color: controller.selectedStudent.value!.isMale
                              ? Theme.of(context).colorScheme.primary
                              : Colors.pink,
                        ),
                      ),
                      AddHorizontalSpacing(value: 20.w),
                      SizedBox(
                        width: 210.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'الاسم: ${controller.selectedStudent.value!.firstName}',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(color: Colors.white),
                              overflow: TextOverflow.ellipsis,
                            ),
                            AddVerticalSpacing(value: 5.h),
                            Text(
                              'ولد في: ${controller.selectedStudent.value!.placeOfBirth}',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    color: Colors.white,
                                  ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  Obx _buildBottomSection(
      StudentListPageController controller, BuildContext context) {
    return Obx(() {
      return AnimatedOpacity(
        opacity: controller.selectedStudent.value == null ? 0 : 1.0,
        duration: 600.milliseconds,
        curve: Curves.fastLinearToSlowEaseIn,
        child: Padding(
          padding: EdgeInsets.only(bottom: 15.h),
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor.withOpacity(.1),
              borderRadius:
                  BorderRadius.circular(StylesHelper.globalBorderRadius),
            ),
            padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 25.h),
            child: CustomFilledButton<Text>(
              height: 55,
              onTap: controller.selectedStudent.value == null
                  ? () {}
                  : controller.writeSelectedStudentIdToSharedPrefs,
              child: Text(
                'متابعة',
                style: FontsHelper.titleMedium().copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}

class _StudentCard extends StatelessWidget {
  const _StudentCard({
    required this.student,
    required this.controller,
  });
  final Student student;

  final StudentListPageController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: ListTile(
        splashColor: Theme.of(context).colorScheme.primary.withOpacity(.2),
        tileColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
        onTap: () {
          controller.setSelectedStudent(student: student);
        },
        leading: Icon(
          student.isMale ? Icons.male : Icons.female,
          color: student.isMale
              ? Theme.of(context).colorScheme.primary
              : Colors.pink,
        ),
        title: Text(student.firstName),
        subtitle: Text(student.phoneNumber),
        trailing: Obx(() {
          return Icon(
            Icons.circle,
            color: controller.selectedStudent.value == null
                ? Colors.grey
                : student.id == controller.selectedStudent.value!.id
                    ? Theme.of(context).colorScheme.primary
                    : Colors.grey,
          );
        }),
      ),
    );
  }
}
