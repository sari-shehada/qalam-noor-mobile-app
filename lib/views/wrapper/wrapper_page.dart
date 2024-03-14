import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../helpers/routes_helper.dart';
import '../../helpers/theme_helper.dart';
import '../loader_page/loader_page.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      useInheritedMediaQuery: true,
      builder: (BuildContext context, Widget? child) {
        return GetMaterialApp(
          title: 'Qalam & Noor',
          debugShowCheckedModeBanner: false,
          darkTheme: ThemesHelper.darkTheme,
          theme: ThemesHelper.lightTheme,
          themeMode: ThemeMode.light,
          home: child,
          fallbackLocale: const Locale('ar'),
          locale: const Locale('ar'),
          initialRoute: LoaderPage.routeName,
          getPages: RoutesHelper.instance.routes,
          defaultTransition: Transition.fadeIn,
        );
      },
      child: const LoaderPage(),
    );
  }
}
