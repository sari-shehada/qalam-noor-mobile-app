import 'package:flutter/material.dart';
import 'package:qalam_noor_parents/tools/ui_tools/custom_appbar.dart';

import '../../tools/ui_tools/custom_scaffold.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static const String routeName = '/homePage';

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      appBar: CustomAppBar(
        title: 'الرئيسية',
        backButtonEnabled: false,
      ),
      body: Center(
        child: Icon(Icons.home),
      ),
    );
  }
}
