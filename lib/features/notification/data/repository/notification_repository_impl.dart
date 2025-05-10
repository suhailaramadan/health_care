import 'package:graduation_project/core/error/exceptions.dart';
import 'package:graduation_project/features/notification/data/data_source/remote/notification_api_remote_data_source.dart';
import 'package:graduation_project/features/notification/data/data_source/remote/notification_remote_data_source.dart';
import 'package:graduation_project/features/notification/data/model/notification_get_response/notification_get_response.dart';
import 'package:graduation_project/features/notification/domain/repository/notification_repository.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: NotificationRepository)
class NotificationRepositoryImpl extends NotificationRepository {
  final NotificationRemoteDataSource remoteDataSource;
  NotificationRepositoryImpl(this.remoteDataSource);
  @override
  Future<List<NotificationGetResponse>> getNotifications(String token) async {
    try {
      final notification = await remoteDataSource.getNotifications(token);
      return notification;
    } catch (e) {
      print("error in  Repository $token $e");
      throw const RemoteException("فشل في تحميل الإشعارات");
    }
  }

  @override
  Future<void> markNotification(String token, int id) async {
    try {
      await remoteDataSource.markAsRead(token, id);
    } catch (e) {
      print(" failed in mark as read $e");
      throw const RemoteException("فشل في تعيين الإشعار كمقروء");
    }
  }
}
