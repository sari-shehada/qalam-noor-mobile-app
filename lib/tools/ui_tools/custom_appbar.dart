import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../helpers/misc_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    required this.title,
    super.key,
    this.backButtonEnabled = true,
    this.actions,
    this.isShadowed = true,
    this.backgroundColor = Colors.white,
    this.titleColor,
    this.statusBarBrightness,
  });

  final String title;
  final bool backButtonEnabled;
  final List<Widget>? actions;
  final bool isShadowed;
  final Color backgroundColor;
  final Color? titleColor;
  final Brightness? statusBarBrightness;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      systemStatusBarContrastEnforced: Platform.isIOS,
      statusBarColor: Platform.isIOS
          ? null
          : MiscColors.getMiscColor(4), // Set the status bar color
      statusBarIconBrightness: Platform.isIOS ? null : Brightness.dark,
    ));
    return SizedBox.expand(
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          boxShadow: isShadowed
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(.1),
                    spreadRadius: 1,
                    offset: const Offset(-1, 2),
                    blurRadius: 2,
                  ),
                ]
              : null,
        ),
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
                    SizedBox(
                      width: 250.w,
                      child: Text(
                        title,
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(fontSize: 19.7.sp, color: titleColor),
                      ),
                    ),
                    if (backButtonEnabled)
                      Positioned(
                        right: 0,
                        child: IconButton(
                          onPressed: Get.back<void>,
                          icon: Icon(
                            Icons.chevron_left,
                            color: Theme.of(context).colorScheme.primary,
                            size: 30.sp,
                          ),
                        ),
                      ),
                    if (actions != null)
                      Positioned(
                        left: 0,
                        child: Row(
                          children: actions!,
                        ),
                      ),
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
  Size get preferredSize => Size(double.infinity,
      20.h + (Platform.isIOS ? Get.mediaQuery.viewPadding.top : 60.h));
}
