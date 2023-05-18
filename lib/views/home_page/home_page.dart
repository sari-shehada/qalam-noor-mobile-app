import 'package:flutter/material.dart';
import '../../shared/global_params.dart';

import '../../tools/ui_tools/custom_appbar.dart';
import '../../tools/ui_tools/custom_scaffold.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static const String routeName = '/homePage';

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: const CustomAppBar(title: 'الرئيسية', backButtonEnabled: false),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            GlobalParams.selectedStudent.toString(),
            textAlign: TextAlign.center,
            textDirection: TextDirection.ltr,
          ),
        ],
      ),
    );
  }
}
