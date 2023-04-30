// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.backButtonEnabled = true,
    this.actions,
  });

  final String title;
  final bool backButtonEnabled;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Container(
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.1),
            spreadRadius: 1,
            offset: const Offset(-1, 2),
            blurRadius: 2,
          ),
        ]),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).viewPadding.top,
            ),
            Expanded(
              child: SizedBox.expand(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(fontSize: 19.7.sp),
                    ),
                    backButtonEnabled
                        ? Positioned(
                            right: 0,
                            child: IconButton(
                              onPressed: () {
                                Get.back();
                              },
                              icon: Icon(
                                Icons.chevron_left,
                                color: Theme.of(context).colorScheme.primary,
                                size: 30.sp,
                              ),
                            ),
                          )
                        : const SizedBox.shrink(),
                    actions != null
                        ? Positioned(
                            left: 0,
                            child: Row(
                              children: actions!,
                            ),
                          )
                        : const SizedBox.shrink(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size(
        double.infinity,
        20.h + (Platform.isIOS ? Get.mediaQuery.viewPadding.top : 60.h),
      );
}
