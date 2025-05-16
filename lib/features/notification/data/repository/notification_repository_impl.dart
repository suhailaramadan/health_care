import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/constants.dart';
import 'package:graduation_project/core/error/exceptions.dart';
import 'package:graduation_project/features/notification/data/data_source/remote/notification_api_remote_data_source.dart';
import 'package:graduation_project/features/notification/data/data_source/remote/notification_remote_data_source.dart';
import 'package:graduation_project/features/notification/data/firebase_services.dart';
import 'package:graduation_project/features/notification/data/model/notification_get_response/notification_get_response.dart';
import 'package:graduation_project/features/notification/domain/repository/notification_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Singleton(as: NotificationRepository)
class NotificationRepositoryImpl extends NotificationRepository {
  final NotificationRemoteDataSource remoteDataSource;
  // final FirebaseServices firebaseServices;
  NotificationRepositoryImpl(
    this.remoteDataSource,
  );
  @override
  Future<List<NotificationGetResponse>> getNotifications(String token) async {
    // final prefs = await SharedPreferences.getInstance();
    // final token = prefs.getString(CacheConstants.tokenKey);
    // tokens = token!;
    try {
      final notification = await remoteDataSource.getNotifications(token);
      print("Repositirhhhhhhhh $notification");
      return notification;
    } catch (e) {
      // print("error in  Repository $token $e");
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

  // @override
  // Future<void> listenToNotificatioms(
  //     Function(NotificationGetResponse) onNotification) async {
  //   firebaseServices.initializFirebase(onNotification);
  // }
}
