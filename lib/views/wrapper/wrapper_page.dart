import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:qalam_noor_parents/helpers/routes_helper.dart';
import 'package:qalam_noor_parents/views/loader_page/loader_page.dart';

import '../../helpers/theme_helper.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      splitScreenMode: false,
      useInheritedMediaQuery: true,
      builder: (context, child) {
        return GetMaterialApp(
          title: 'Qalam & Noor',
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.system,
          darkTheme: ThemesHelper.darkTheme,
          theme: ThemesHelper.lightTheme,
          home: child,
          fallbackLocale: const Locale('ar'),
          locale: const Locale('ar'),
          initialRoute: LoaderPage.routeName,
          getPages: RoutesHelper.routes,
          defaultTransition: Transition.fadeIn,
        );
      },
      child: const LoaderPage(),
    );
  }
}
