import 'package:get/get.dart';
import 'package:qalam_noor_parents/views/bottom_nav_bar_scaffold_page/bottom_nav_bar_scaffold_page.dart';
import 'package:qalam_noor_parents/views/chat_page/chat_page.dart';
import 'package:qalam_noor_parents/views/loader_page/loader_page.dart';
import 'package:qalam_noor_parents/views/login_page/login_page.dart';
import 'package:qalam_noor_parents/views/student_list_page/student_list_page.dart';

abstract class RoutesHelper {
  static List<GetPage> get routes => <GetPage>[
        GetPage(
          name: LoaderPage.routeName,
          page: () => const LoaderPage(),
        ),
        GetPage(
          name: LoginPage.routeName,
          page: () => const LoginPage(),
        ),
        GetPage(
          name: BottomNavBarScaffoldPage.routeName,
          page: () => const BottomNavBarScaffoldPage(),
        ),
        GetPage(
          name: StudentListPage.routeName,
          page: () => const StudentListPage(),
        ),
        GetPage(
          name: ChatPage.routeName,
          page: () => const ChatPage(),
        ),
      ];
}
