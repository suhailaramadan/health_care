import 'package:graduation_project/features/notification/data/model/notification_get_response/notification_get_response.dart';

abstract class NotificationsStats {}

class NotificationInitial extends NotificationsStats {}

class NotificationLoading extends NotificationsStats {}

class NotificationError extends NotificationsStats {
  String message;
  NotificationError(this.message);
}

class NotificaltionSuccess extends NotificationsStats {
  final List<NotificationGetResponse> notification;
  NotificaltionSuccess(this.notification);
}

class NotificationMarkAsRead extends NotificationsStats {}
