import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:qalam_noor_parents/helpers/fonts_helper.dart';
import 'package:qalam_noor_parents/models/enums.dart';
import 'package:qalam_noor_parents/tools/ui_tools/custom_appbar.dart';
import 'package:qalam_noor_parents/tools/ui_tools/custom_scaffold.dart';
import 'package:qalam_noor_parents/views/home_page/views/controllers/grades_details_page_controller.dart';

class GradesDetailsPage extends GetView<GradesDetailsPageController> {
  const GradesDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<BoxShadow> shadow = <BoxShadow>[
      BoxShadow(
        color: Colors.black.withOpacity(.2),
        blurRadius: 4,
        spreadRadius: 2,
        offset: const Offset(1, 0),
      )
    ];
    final BorderRadius borderRadius = BorderRadius.all(
      Radius.circular(20.r),
    );

    return CustomScaffold(
      appBar: const CustomAppBar(
        title: 'تفصيل علامات الطالب',
      ),
      bodyPadding: EdgeInsets.symmetric(horizontal: 20.w),
      body: SingleChildScrollView(
        child: Column(
          children: List<Widget>.generate(
            controller.studentSemesterScore.studentSemesterGrades.length,
            (int index) {
              return Container(
                // clipBehavior: Clip.none,
                margin: EdgeInsets.only(top: 40.h),
                width: MediaQuery.of(context).size.width - 20.w,
                height: 270.h,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: borderRadius,
                  boxShadow: shadow,
                ),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: <Widget>[
                    SizedBox.expand(
                      child: Container(
                        margin: EdgeInsets.only(
                          top: 27.h,
                          right: 15.w,
                          left: 15.w,
                          bottom: 10.h,
                        ),
                        // color: Colors.red,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ...List<Widget>.generate(
                              ExamType.values.length,
                              (int gradeIndex) {
                                final Object grade = controller
                                        .studentSemesterScore
                                        .studentSemesterGrades[index]
                                        .grades[gradeIndex.toString()] ??
                                    'غير مقدم بعد';

                                return Column(
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(
                                          examTypeAsString[
                                              ExamType.values[gradeIndex]]!,
                                          style:
                                              FontsHelper.bodySmall().copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          grade.toString(),
                                          style:
                                              FontsHelper.bodySmall().copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Divider(
                                      thickness: .5.h,
                                    ),
                                  ],
                                );
                              },
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'المحصلة',
                                  style: FontsHelper.bodySmall().copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  controller.studentSemesterScore
                                      .studentSemesterGrades[index].courseGrade
                                      .toString(),
                                  style: FontsHelper.bodySmall().copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: -25.h,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * .9,
                        height: 50.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            buildFloatingTopContainerItem(context,
                                text: controller.studentSemesterScore
                                    .studentSemesterGrades[index].courseName,
                                icon: Icons.book),
                            buildFloatingTopContainerItem(context,
                                text:
                                    '${controller.studentSemesterScore.studentSemesterGrades[index].teacher.firstName} ${controller.studentSemesterScore.studentSemesterGrades[index].teacher.lastName}',
                                icon: Icons.man),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget buildFloatingTopContainerItem(BuildContext context,
      {required String text, required IconData icon}) {
    final List<BoxShadow> shadow = <BoxShadow>[
      BoxShadow(
        color: Colors.black.withOpacity(.2),
        blurRadius: 4,
        spreadRadius: 2,
        offset: const Offset(1, 0),
      )
    ];
    final BorderRadius borderRadius = BorderRadius.all(
      Radius.circular(20.r),
    );
    return Container(
      height: double.infinity,
      width: MediaQuery.of(context).size.width * .40,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: borderRadius,
        boxShadow: shadow,
      ),
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Row(
        children: <Widget>[
          Icon(
            icon,
            size: 22.sp,
            color: Theme.of(context).colorScheme.primary,
          ),
          Text(text, overflow: TextOverflow.ellipsis),
        ],
      ),
    );
  }
}
