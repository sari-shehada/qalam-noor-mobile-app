import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsHelper {
  late SharedPreferences spInstance;
  static late SharedPrefsHelper instance;

  static Future<SharedPrefsHelper> init() async {
    instance = SharedPrefsHelper();
    instance.spInstance = await SharedPreferences.getInstance();
    return instance;
  }

  //Setters
  Future<void> setLoginStatus({required bool val}) async {
    await spInstance.setBool(SharedPrefsKeys.loginStatusKey, val);
  }

  Future<bool> setUsername(String username) async {
    return spInstance.setString(SharedPrefsKeys.usernameKey, username);
  }

  Future<bool> setPassword(String password) async {
    return spInstance.setString(SharedPrefsKeys.passwordKey, password);
  }

  Future<bool> setCurrentUserId(int studentId) async {
    return spInstance.setInt(
      SharedPrefsKeys.currentStudentIdKey,
      studentId,
    );
  }

  //Getters
  bool isLoggedIn() {
    return spInstance.getBool(SharedPrefsKeys.loginStatusKey) ?? false;
  }

  String? getUsername() {
    return spInstance.getString(SharedPrefsKeys.usernameKey);
  }

  String? getPassword() {
    return spInstance.getString(SharedPrefsKeys.passwordKey);
  }

  int? getCurrentStudentId() {
    return spInstance.getInt(SharedPrefsKeys.currentStudentIdKey);
  }

  Future<bool> clearSharedPrefs() async {
    try {
      await spInstance.clear();
      return true;
    } catch (_) {
      return false;
    }
  }
}

class SharedPrefsKeys {
  static String get loginStatusKey => 'isLoggedIn';
  static String get usernameKey => 'username';
  static String get passwordKey => 'password';
  static String get currentStudentIdKey => 'currentStudentId';
}
