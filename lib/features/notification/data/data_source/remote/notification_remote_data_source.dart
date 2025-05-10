import 'package:graduation_project/features/notification/data/model/notification_get_response/notification_get_response.dart';

abstract class NotificationRemoteDataSource {
  Future<List<NotificationGetResponse>> getNotifications(String token);
  Future<void> markAsRead(String token, int notificationId);
}
