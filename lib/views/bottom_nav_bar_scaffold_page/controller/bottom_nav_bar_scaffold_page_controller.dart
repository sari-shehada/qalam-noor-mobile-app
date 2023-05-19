import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../home_page/home_page.dart';
import '../../inbox_page/inbox_page.dart';
import '../../settings_page/settings_page.dart';

class BottomNavBarScaffoldPageController extends GetxController {
  BottomNavBarScaffoldPageController() {
    selectedWidget = Rx<Widget>(const HomePage());
  }
  RxInt index = 0.obs;
  late Rx<Widget> selectedWidget;
  final List<IconData> bottomNavBarIcons = [
    Icons.home,
    Icons.inbox,
    Icons.settings,
  ];

  void onIndexChanged(int newIndex) {
    if (newIndex == index.value) return;
    switch (newIndex) {
      case 0:
        selectedWidget.value = const HomePage();
        break;
      case 1:
        selectedWidget.value = const InboxPage1();
        break;
      case 2:
        selectedWidget.value = const SettingsPage();
        break;
    }
    index.value = newIndex;
  }
}
