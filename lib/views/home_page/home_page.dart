import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:qalam_noor_parents/tools/logic_tools/date_time_formatters.dart';
import 'package:qalam_noor_parents/tools/ui_tools/ui_tools.dart';
import 'package:qalam_noor_parents/views/home_page/controllers/home_page_controller.dart';
import 'package:shimmer/shimmer.dart';

import '../../tools/ui_tools/custom_scaffold.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static const String routeName = '/homePage';

  @override
  Widget build(BuildContext context) {
    final HomePageController controller = HomePageController();
    final BoxDecoration decoration = BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
          Theme.of(context).colorScheme.primary,
          Theme.of(context).colorScheme.primary.withOpacity(.8),
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
          // return const _ShimmerHomePage();
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
                  child: Column(
                    children: <Widget>[
                      Text(
                        formatDate(
                            dateTime:
                                controller.profileView.studentDateOfBirth),
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(color: Colors.white),
                      ),
                    ],
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
                      ),
                    ),
                    AddHorizontalSpacing(value: 5.w),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        decoration: decoration,
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
