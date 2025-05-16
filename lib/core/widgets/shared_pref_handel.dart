import 'package:graduation_project/core/constants.dart';
import 'package:graduation_project/core/error/exceptions.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHandel {
  static late SharedPreferences prefs;
  static init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static String getToken() {
    return prefs.getString(CacheConstants.tokenKey) ?? '';
  }

  static String getUserRole() {
    final role = prefs.getString(CacheConstants.roleKey) ?? 'User';
    return role;
  }

  static Future<void> saveToken(String token, String role) async {
    try {
      await prefs.setString(CacheConstants.tokenKey, token);
      await prefs.setString(CacheConstants.roleKey, role);
    } catch (e) {
      throw const LocalException('فشل في حفظ بيانات تسجيل الدخول');
    }
  }
}
