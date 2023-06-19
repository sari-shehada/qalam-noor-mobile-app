import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:qalam_noor_parents/helpers/misc_colors.dart';
import 'package:qalam_noor_parents/tools/ui_tools/custom_appbar.dart';
import 'package:qalam_noor_parents/tools/ui_tools/ui_tools.dart';
import 'package:qalam_noor_parents/views/home_page/controllers/home_page_controller.dart';

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
          MiscColors.getMiscColor(6),
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
    final BoxDecoration nonGradientDecoration = BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: <Color>[
          MiscColors.getMiscColor(6),
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
    const int lengthOfList = 20;
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
                              'العام الحالي هو: ${controller.isLoadingCurrentYear.value ? '...' : controller.schoolYear.name}',
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
                Container(
                  decoration: gradientDecoration,
                  width: double.infinity,
                  height: 70.h,
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Center(
                    child: Row(
                      children: [
                        Text(
                          'Txt',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
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
                          Text(
                            'مواد الطالب الحالية',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(color: Colors.white),
                          ),
                          AddVerticalSpacing(value: 10.h),
                          Expanded(
                            child: Row(
                              children: [
                                Expanded(
                                  child: ListView(
                                    children: List.generate(
                                      lengthOfList,
                                      (int index) => Container(
                                        height: 50.h,
                                        padding: EdgeInsets.all(10.h),
                                        margin: EdgeInsets.only(bottom: 5.h),
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            topLeft: index == 0
                                                ? Radius.circular(20.r)
                                                : Radius.zero,
                                            topRight: index == 0
                                                ? Radius.circular(20.r)
                                                : Radius.zero,
                                            bottomRight:
                                                index == lengthOfList - 1
                                                    ? Radius.circular(20.r)
                                                    : Radius.zero,
                                            bottomLeft:
                                                index == lengthOfList - 1
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
                                                  'Subject Name',
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ),
                                            VerticalDivider(),
                                            Expanded(
                                              child: Center(
                                                child: Text(
                                                  'Subject Name',
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ),
                                          ],
                                        )),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
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
