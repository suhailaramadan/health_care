import 'package:graduation_project/features/notification/data/model/notification_get_response/notification_get_response.dart';

abstract class NotificationRepository {
  Future<List<NotificationGetResponse>> getNotifications(String token);
  Future<void> markNotification(String token, int id);
}
