// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:qalam_noor_parents/tools/logic_tools/date_time_formatters.dart';
import 'package:qalam_noor_parents/tools/ui_tools/ui_tools.dart';
import 'package:qalam_noor_parents/views/profile_page/controllers/profile_page_controller.dart';
import 'package:shimmer/shimmer.dart';

import '../../helpers/misc_colors.dart';
import '../../tools/ui_tools/custom_scaffold.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  static const String routeName = '/profilePage';

  @override
  Widget build(BuildContext context) {
    final ProfilePageController controller = ProfilePageController();
    final BoxDecoration decoration = BoxDecoration(
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
    );

    return CustomScaffold(
      bodyPadding: EdgeInsets.only(
        right: 10.w,
        left: 10.w,
        top: (Platform.isIOS ? Get.mediaQuery.viewPadding.top : 60.h),
      ),
      body: Obx(
        () {
          if (controller.isLoading.value) {
            return const _ShimmerHomePage();
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Wrap(
                  children: <Widget>[
                    Text(
                      'اهلا بعودتك! الابن الحالي: ${controller.profileView.studentFirstName}',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
              AddVerticalSpacing(value: 10.h),
              Expanded(
                flex: 8,
                child: Container(
                  width: double.infinity,
                  decoration: decoration,
                  padding: EdgeInsets.all(10.w),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Expanded(
                          child: Lottie.asset(
                            'assets/animations/family_animation.json',
                            repeat: false,
                            height: 200.h,
                            width: 200.h,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              TextWithIconSubWidget(
                                text:
                                    '${controller.profileView.studentFirstName} ${controller.profileView.fatherFirstName} ${controller.profileView.lastName}',
                                icon: Icons.person,
                              ),
                              TextWithIconSubWidget(
                                text:
                                    'الجنس: ${controller.profileView.gender ? 'ذكر' : 'انثى'}',
                                icon: controller.profileView.gender
                                    ? Icons.male
                                    : Icons.female,
                              ),
                              TextWithIconSubWidget(
                                text:
                                    'تاريخ الولادة: ${formatDate(dateTime: controller.profileView.studentDateOfBirth)}',
                                icon: Icons.cake,
                              ),
                              TextWithIconSubWidget(
                                text:
                                    'تاريخ التسجيل: ${formatDate(dateTime: controller.profileView.joinDate)}',
                                icon: Icons.calendar_month,
                              ),
                              TextWithIconSubWidget(
                                text:
                                    'الصف: ${controller.profileView.addressName}',
                                icon: Icons.school,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              AddVerticalSpacing(value: 5.h),
              Expanded(
                flex: 5,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        decoration: decoration,
                        padding: EdgeInsets.all(12.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            AddVerticalSpacing(value: 10.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                CircleAvatar(
                                  radius: 40.r,
                                  backgroundColor: Colors.white,
                                  child: Icon(
                                    Icons.woman_rounded,
                                    color: Colors.pink,
                                    // Theme.of(context).colorScheme.primary,
                                    size: 40.sp,
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  TextWithIconSubWidget(
                                    text:
                                        '${controller.profileView.motherName} ${controller.profileView.motherFatherName} ${controller.profileView.motherLastName}',
                                    icon: Icons.person,
                                  ),
                                  TextWithIconSubWidget(
                                    date: controller
                                        .profileView.motherDateOfBirth,
                                    icon: Icons.cake,
                                  ),
                                  TextWithIconSubWidget(
                                    text: controller
                                        .profileView.motherPhoneNumber,
                                    icon: Icons.phone,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    AddHorizontalSpacing(value: 5.w),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        decoration: decoration,
                        padding: EdgeInsets.all(12.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            AddVerticalSpacing(value: 10.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                CircleAvatar(
                                  radius: 40.r,
                                  backgroundColor: Colors.white,
                                  child: Icon(
                                    Icons.man,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    size: 40.sp,
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  TextWithIconSubWidget(
                                    text:
                                        '${controller.profileView.fatherFirstName} ${controller.profileView.grandFatherName} ${controller.profileView.lastName}',
                                    icon: Icons.person,
                                  ),
                                  TextWithIconSubWidget(
                                    text: controller
                                        .profileView.fatherPlaceOfBirth
                                        .toString(),
                                    icon: Icons.pin_drop,
                                  ),
                                  TextWithIconSubWidget(
                                    text: controller
                                        .profileView.fatherPhoneNumber,
                                    icon: Icons.phone,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(flex: 2),
            ],
          );
        },
      ),
    );
  }
}

class TextWithIconSubWidget extends StatelessWidget {
  const TextWithIconSubWidget({
    required this.icon,
    Key? key,
    this.text,
    this.date,
  }) : super(key: key);
  final String? text;
  final IconData icon;
  final DateTime? date;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(
          icon,
          size: 23.sp,
          color: Colors.white,
        ),
        AddHorizontalSpacing(value: 7.w),
        Text(
          date == null ? (text ?? 'NULL_TEXT') : formatDate(dateTime: date),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: Colors.white),
        ),
      ],
    );
  }
}

class _ShimmerHomePage extends StatelessWidget {
  const _ShimmerHomePage();

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Theme.of(context).colorScheme.primary.withOpacity(.2),
      highlightColor: Theme.of(context).colorScheme.primary.withOpacity(.1),
      child: Column(
        children: <Widget>[
          const Text(''),
          AddVerticalSpacing(value: 10.h),
          const Expanded(
            flex: 8,
            child: Card(
              child: SizedBox(
                width: double.infinity,
              ),
            ),
          ),
          const Expanded(
            flex: 5,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Card(
                    child: SizedBox.expand(),
                  ),
                ),
                Expanded(
                  child: Card(
                    child: SizedBox.expand(),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(flex: 2),
        ],
      ),
    );
  }
}
