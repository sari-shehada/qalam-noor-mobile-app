import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:qalam_noor_parents/views/home_page/home_page.dart';
import 'package:qalam_noor_parents/views/inbox_page/inbox_page.dart';
import 'package:qalam_noor_parents/views/settings_page/settings_page.dart';

class BottomNavBarScaffoldPageController extends GetxController {
  RxInt index = 0.obs;
  late Rx<Widget> selectedWidget;
  BottomNavBarScaffoldPageController() {
    selectedWidget = Rx<Widget>(const HomePage());
  }
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
