import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:qalam_noor_parents/helpers/fonts_helper.dart';
import 'package:qalam_noor_parents/helpers/misc_colors.dart';
import 'package:qalam_noor_parents/tools/ui_tools/custom_appbar.dart';
import 'package:qalam_noor_parents/tools/ui_tools/ui_tools.dart';
import 'package:qalam_noor_parents/views/home_page/controllers/home_page_controller.dart';

import '../../models/student_profile/student_semester_grade.dart';
import '../../tools/ui_tools/custom_scaffold.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static const String routeName = '/homePage';

  @override
  Widget build(BuildContext context) {
    final HomePageController controller = Get.put(HomePageController());
    final BoxDecoration gradientDecoration = BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      // color: Colors.white,
      gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: <Color>[
          const Color(0xFF3b6cb9),
          // MiscColors.getMiscColor(6),
          // MiscColors.getMiscColor(4),
          MiscColors.getMiscColor(4),
        ],
      ),
      boxShadow: <BoxShadow>[
        BoxShadow(
          color: Colors.black.withOpacity(.1),
          spreadRadius: 1,
          offset: const Offset(-1, 2),
          blurRadius: 2,
        ),
      ],
    );
    final BoxDecoration nonGradientDecoration = gradientDecoration;

    return CustomScaffold(
      // backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: CustomAppBar(
        title: 'الرئيسية',
        backButtonEnabled: false,
        // isShadowed: false,
        backgroundColor: MiscColors.getMiscColor(4),
        titleColor: Colors.white,
      ),
      bodyPadding: EdgeInsets.only(right: 10.w, left: 10.w, top: 10.w),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Obx(
                  () {
                    return Container(
                      decoration: gradientDecoration,
                      width: double.infinity,
                      height: 70.h,
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Center(
                        child: Row(
                          children: [
                            Text(
                              'العام الحالي هو: ${controller.isLoading.value ? '...' : controller.schoolYear.name}',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                AddVerticalSpacing(value: 10.h),
                Obx(
                  () {
                    return Container(
                      decoration: gradientDecoration,
                      width: double.infinity,
                      height: 70.h,
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Center(
                        child: Row(
                          children: [
                            Text(
                              'الفصل الحالي هو: ${controller.isLoading.value ? '...' : controller.semesters.last.name}',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                AddVerticalSpacing(value: 10.h),
                Expanded(
                  child: Container(
                    decoration: nonGradientDecoration,
                    // width: double.infinity,
                    // height: 70.h,
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 30.h,
                            child: Stack(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Obx(() {
                                    return AbsorbPointer(
                                      absorbing: controller.isLoading.value,
                                      child: IconButton(
                                        onPressed: () async {
                                          await controller.goToDetailsPage();
                                        },
                                        icon: Icon(
                                          Icons.more_horiz,
                                          color: Colors.white,
                                          size: 17.h,
                                        ),
                                        tooltip: 'المزيد من التفاصيل',
                                      ),
                                    );
                                  }),
                                ),
                                Align(
                                  child: Text(
                                    'مواد الطالب الحالية',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          AddVerticalSpacing(value: 10.h),
                          Expanded(
                            child: Obx(() {
                              if (controller.isLoading.value) {
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'جاري التحميل ..',
                                      style: FontsHelper.bodyMedium()
                                          .copyWith(color: Colors.white),
                                    ),
                                    AddVerticalSpacing(value: 20.h),
                                    LoadingAnimationWidget.bouncingBall(
                                      color: Colors.white,
                                      size: 40.h,
                                    ),
                                  ],
                                );
                              }
                              if (controller.studentSemesterScore == null) {
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'الطالب لم يتم تسجيله في العام الدراسي الحالي',
                                      style: FontsHelper.bodyMedium()
                                          .copyWith(color: Colors.white),
                                    ),
                                  ],
                                );
                              }
                              final List<StudentSemesterGrade>
                                  studentSemesterGrades = controller
                                      .studentSemesterScore!
                                      .studentSemesterGrades;
                              return ListView.builder(
                                itemCount: studentSemesterGrades.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                    height: 40.h,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: index == 0
                                            ? Radius.circular(20.r)
                                            : Radius.zero,
                                        topRight: index == 0
                                            ? Radius.circular(20.r)
                                            : Radius.zero,
                                        bottomRight: index ==
                                                studentSemesterGrades.length - 1
                                            ? Radius.circular(20.r)
                                            : Radius.zero,
                                        bottomLeft: index ==
                                                studentSemesterGrades.length - 1
                                            ? Radius.circular(20.r)
                                            : Radius.zero,
                                      ),
                                      color: index % 2 == 0
                                          ? Colors.white.withOpacity(.7)
                                          : Colors.white.withOpacity(.3),
                                    ),
                                    child: Center(
                                        child: Row(
                                      children: <Widget>[
                                        Expanded(
                                          child: Center(
                                            child: Text(
                                              studentSemesterGrades[index]
                                                  .courseName,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ),
                                        VerticalDivider(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary
                                              .withOpacity(.4),
                                        ),
                                        Expanded(
                                          child: Center(
                                            child: Text(
                                              '${studentSemesterGrades[index].teacher.firstName} ${studentSemesterGrades[index].teacher.lastName}',
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ),
                                      ],
                                    )),
                                  );
                                },
                              );
                            }),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Expanded(child: SizedBox()),
        ],
      ),
    );
  }
}
