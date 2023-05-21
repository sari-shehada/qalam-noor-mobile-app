import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../tools/ui_tools/custom_bottom_nav_bar.dart';
import '../../tools/ui_tools/custom_scaffold.dart';
import 'controller/bottom_nav_bar_scaffold_page_controller.dart';

class BottomNavBarScaffoldPage extends StatelessWidget {
  const BottomNavBarScaffoldPage({super.key});
  static const String routeName = '/bottomNavBarScaffoldPage';

  @override
  Widget build(BuildContext context) {
    final BottomNavBarScaffoldPageController controller =
        Get.put(BottomNavBarScaffoldPageController());
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
