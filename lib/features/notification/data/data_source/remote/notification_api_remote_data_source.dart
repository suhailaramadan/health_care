import 'package:dio/dio.dart';
import 'package:graduation_project/core/constants.dart';
import 'package:graduation_project/core/error/exceptions.dart';
import 'package:graduation_project/features/notification/data/data_source/remote/notification_remote_data_source.dart';
import 'package:graduation_project/features/notification/data/model/notification_get_response/notification_get_response.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Singleton(as: NotificationRemoteDataSource)
class NotificationApiRemoteDataSource extends NotificationRemoteDataSource {
  final Dio dio;
  NotificationApiRemoteDataSource(this.dio);
  @override
  Future<List<NotificationGetResponse>> getNotifications(String token) async {
    // final prefs = await SharedPreferences.getInstance();
    // final token = prefs.getString(CacheConstants.tokenKey);

    final response = await dio.get("Notification",
        options: Options(headers: {'Authorization': 'Bearer $token'}));
    if (response.statusCode == 200) {
      return (response.data as List)
          .map((json) => NotificationGetResponse.fromJson(json))
          .toList();
    } else {
      throw Exception('فشل في تحميل الإشعارات');
    }
  }

  @override
  Future<void> markAsRead(String token, int notificationId) async {
    // final prefs = await SharedPreferences.getInstance();
    // final token = prefs.getString(CacheConstants.tokenKey);
    final response = await dio.post("Notification/mark-as-read/$notificationId",
        options: Options(headers: {'Authorization': 'Bearer $token'}));
    if (response.statusCode == 200) {
      return response.data['message'];
    } else {
      throw const RemoteException("فشل في تعيين الإشعار كمقروء");
    }
  }
}
