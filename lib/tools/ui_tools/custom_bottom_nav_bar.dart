import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../helpers/misc_colors.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    required this.icons,
    required this.onIndexChanged,
    super.key,
  });
  final List<IconData> icons;
  final void Function(int index) onIndexChanged;

  @override
  Widget build(BuildContext context) {
    final CustomBottomNavigationBarController controller =
        Get.put(CustomBottomNavigationBarController());
    return Padding(
      padding: EdgeInsets.only(
        right: 20.w,
        left: 20.w,
        bottom:
            Platform.isIOS ? MediaQuery.of(context).viewPadding.bottom : 20.h,
      ),
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
              color: Colors.black.withOpacity(.3),
              spreadRadius: 2,
              offset: const Offset(-1, 2),
              blurRadius: 5,
            ),
          ],
        ),
        width: double.infinity,
        height: 60.h,
        child: Obx(() {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
              icons.length,
              (int index) => SizedBox(
                height: 45.h,
                width: 60.h,
                child: InkWell(
                  onTap: () {
                    onIndexChanged(index);
                    controller.setIndex(index);
                  },
                  child: Container(
                    decoration: controller.index.value != index
                        ? null
                        : BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.r),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(.1),
                                spreadRadius: 2,
                                offset: const Offset(-1, 2),
                                blurRadius: 4,
                              ),
                            ],
                          ),
                    child: Icon(
                      icons[index],
                      color: controller.index.value == index
                          ? MiscColors.getMiscColor(4)
                          : Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class CustomBottomNavigationBarController extends GetxController {
  RxInt index = 0.obs;
  void setIndex(int newIndex) {
    index.value = newIndex;
  }
}
