import 'package:get/get.dart';
import '../views/bottom_nav_bar_scaffold_page/bottom_nav_bar_scaffold_page.dart';
import '../views/chat_page/chat_page.dart';
import '../views/loader_page/loader_page.dart';
import '../views/login_page/login_page.dart';
import '../views/student_list_page/student_list_page.dart';

class RoutesHelper {
  const RoutesHelper();
  static const RoutesHelper instance = RoutesHelper();

  List<GetPage<dynamic>> get routes => <GetPage<dynamic>>[
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
