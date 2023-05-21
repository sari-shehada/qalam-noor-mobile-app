// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

//TODO: Test Further on GetxService and Study Assertions and binding in main
abstract class DialogService extends GetxService {
  static Future<T?> openConfirmationDialog<T>({
    required String title,
    required String dialogAlias,
    Widget? content,
    Row? actions,
    bool showCloseButton = true,
    Color? dialogColor,
    Size size = const Size(double.infinity, 200),
    EdgeInsets? dialogPadding,
    bool barrierDismissible = true,
    bool useSafeArea = true,
  }) async {
    // double titleSectionSize =
    return Get.dialog<T>(
      Center(
        child: Padding(
          padding: dialogPadding ?? EdgeInsets.symmetric(horizontal: 20.w),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Material(
              color: dialogColor ?? Colors.white,
              child: SizedBox.fromSize(
                size: size,
                child: Column(
                  children: <Widget>[
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: 160.h,
                        minHeight: 50.h,
                      ),
                      child: SizedBox(
                        height: size.height * .1,
                        child: Stack(
                          children: <Widget>[
                            if (showCloseButton)
                              Align(
                                alignment: AlignmentDirectional.centerStart,
                                child: IconButton(
                                  onPressed: Get.back<T>,
                                  icon: Icon(
                                    Icons.cancel_outlined,
                                    color: Get.theme.colorScheme.primary,
                                  ),
                                ),
                              ),
                            Center(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.w),
                                child: Wrap(
                                  children: [
                                    Text(
                                      title,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                      style: Get.theme.textTheme.titleMedium!
                                          .copyWith(
                                        color: Get.theme.colorScheme.primary,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.sp,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: content ?? const SizedBox.shrink(),
                    ),
                    if (actions != null)
                      ConstrainedBox(
                        constraints: BoxConstraints(
                          maxHeight: 200.h,
                          minHeight: 50.h,
                        ),
                        child: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 10.h,
                              horizontal: 10.w,
                            ),
                            child: actions),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      barrierDismissible: barrierDismissible,
      useSafeArea: useSafeArea,
      routeSettings: RouteSettings(name: 'Dialog -> $dialogAlias'),
    );
  }
}
