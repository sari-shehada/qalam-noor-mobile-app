import 'package:flutter/material.dart';
import 'helpers/shared_prefs_helper.dart';
import 'views/wrapper/wrapper_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefsHelper.init();
  runApp(const Wrapper());
}
