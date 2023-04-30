import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qalam_noor_parents/tools/ui_tools/custom_scaffold.dart';
import 'package:qalam_noor_parents/views/bottom_nav_bar_scaffold_page/controller/bottom_nav_bar_scaffold_page_controller.dart';

import '../../tools/ui_tools/custom_bottom_nav_bar.dart';

class BottomNavBarScaffoldPage extends StatelessWidget {
  static const String routeName = '/bottomNavBarScaffoldPage';
  const BottomNavBarScaffoldPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BottomNavBarScaffoldPageController());
    return CustomScaffold(
      extendBody: true,
      bottomSection: CustomBottomNavigationBar(
        icons: controller.bottomNavBarIcons,
        onIndexChanged: controller.onIndexChanged,
      ),
      body: Obx(
        () {
          return controller.selectedWidget.value;
        },
      ),
    );
  }
}
