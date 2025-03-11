import 'package:graduation_project/core/constants.dart';
import 'package:graduation_project/core/error/exceptions.dart';
import 'package:graduation_project/features/auth/data/data_sources/local/auth_local_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthSharedPrefLocalDataSource extends AuthLocalDataSource {
  @override
  Future<void> saveToken(String token) async {
    try {
      final sharedPref = await SharedPreferences.getInstance();
      await sharedPref.setString(CacheConstants.tokenKey, token);
    } catch (e) {
      throw const LocalException(
          "فشل في حفظ رمز التوثيق , يرجى المحاولة مرة أخرى");
    }
  }

  @override
  Future<String?> getToken() async {
    try {
      final sharedPref = await SharedPreferences.getInstance();
      return sharedPref.getString(CacheConstants.tokenKey);
    } catch (e) {
      throw const LocalException(
          "فشل في استرجاع رمز التوثيق , يرجى المحاولة مرة أخرى");
    }
  }
}
