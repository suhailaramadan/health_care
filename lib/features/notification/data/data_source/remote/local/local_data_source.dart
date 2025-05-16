import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:graduation_project/features/notification/data/model/notification_get_response/notification_get_response.dart';

abstract class LocalDataSource {
  Future<void> saveNotification(NotificationGetResponse notification);
  Future<List<NotificationGetResponse>> getNotification();
}
