import 'dart:async';
import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:graduation_project/core/constants.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/features/notification/data/firebase_services.dart';
import 'package:graduation_project/features/notification/data/model/notification_get_response/notification_get_response.dart';
import 'package:graduation_project/features/notification/domain/repository/notification_repository.dart';
import 'package:graduation_project/features/notification/domain/use_cases/get_notifications_use_case.dart';
import 'package:graduation_project/features/notification/domain/use_cases/mark_notification_as_read_use_case.dart';
import 'package:graduation_project/features/notification/presentiation/cubit/notification_states.dart';
import 'package:graduation_project/main.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@singleton
class NotificationCubit extends Cubit<NotificationsStats> {
  final GetNotificationsUseCase getNotificationsUseCase;
  final MarkNotificationAsReadUseCase markNotificationAsReadUseCase;

  NotificationCubit(
    this.getNotificationsUseCase,
    this.markNotificationAsReadUseCase,
  ) : super(NotificationInitial());
  List<NotificationGetResponse> notifications = [];
  Future<void> getNotification() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(CacheConstants.tokenKey);
    try {
      print("hhhhhhhhhhhhhhhhhhhhhh  ${token}");

      emit(NotificationLoading());
      // try {
      //   final localNotification =
      //       await LocalDataSourceSharedPref().getNotification();

      //   if (localNotification.isNotEmpty) {
      //     notifications = localNotification;
      //     emit(NotificaltionSuccess(notifications));
      //   }
      // } catch (e) {
      //   print("Error loading local $e");
      // }
      // int unreadNtifi =
      //     notifications.where((element) => !(element.isRead!)).length;
      final response = await getNotificationsUseCase(token ?? '');
      response.fold((failure) {
        print("Notification error ${failure.message}");
        emit(NotificationError(failure.message));
      }, (notification) async {
        // final newNotification = notification
        //     .where((e) => notifications.any((element) => element.id == e.id));
        // notifications.addAll(newNotification);
        // // final uniqueNotification = notification.toSet().toList();
        // final localNotification =
        //     await LocalDataSourceSharedPref().getNotification();
        // notifications = [...localNotification, ...notification];
        // notifications = notification;
//       unreadNtifi = notifications.where((element) => !element.isRead!).length;
//       final ids = <int>{};
        // notifications.retainWhere((notifi) => ids.add(notifi.id ?? 0));

        // for (var notif in notification) {
        // //   if (!(notif.isRead != null)) {
        //     sendLocalNotigication(NotificationGetResponse(
        //         title: notif.title ?? '', body: notif.body ?? ''));
        //   }
        // }
        print("Notification ${notification.length}");
        notifications = notification;
        emit(NotificaltionSuccess(notifications));
        for (var notif in notification) {
          print("🟡 ${notif.id} | ${notif.title} | ${notif.isRead}");
        }
      });
    } catch (e) {
      print("Notification unexpected error $e");
      emit(NotificationError("خطأ غير متوقع"));
    }
  }

  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  void initializeFirebaseNotifications() async {
    FirebaseMessaging message = FirebaseMessaging.instance;
    await message.requestPermission();
    final token = await message.getToken();
    print("Firebase-------> $token");
    const androidInit = AndroidInitializationSettings("@mipmap/ic_launcher");
    const initSettings = InitializationSettings(android: androidInit);
    flutterLocalNotificationsPlugin.initialize(initSettings);
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("onMessages: ${message.notification?.title}");
      showLocalNotification(message);
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      navigatorKey.currentState?.pushNamed(Routes.notification);
    });
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {});
  }

  void showLocalNotification(RemoteMessage message) {
    final notification = message.notification;
    if (notification != null) {
      const androidDetails = AndroidNotificationDetails(
          "channel_id", "channel_name",
          importance: Importance.max, priority: Priority.high);
      const details = NotificationDetails(android: androidDetails);
      flutterLocalNotificationsPlugin.show(
          0, notification.title, notification.body, details);
    }
  }
  // Future<List<NotificationGetResponse>> getNotification() async {
  //   final pref = await SharedPreferences.getInstance();
  //   print("getNottttttttttin");
  //   final notifiction =
  //       pref.getStringList(CacheConstants.notificationKey) ?? [];
  //   print("FetcheNNNNNgggggggggggggggggdy,");
  //   return notifiction
  //       .map((e) => NotificationGetResponse.fromJson(jsonDecode(e)))
  //       .toList();
  // }

  Future<void> markAsRead(int id) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(CacheConstants.tokenKey);

    emit(NotificationLoading());
    final response = await markNotificationAsReadUseCase(token ?? '', id);
    response.fold((failure) => emit(NotificationError(failure.message)),
        (_) async {
      getNotification();
      // emit(NotificationMarkAsRead());
    });
  }

  int getUnReadCount() {
    return notifications
        .where((notification) => !(notification.isRead != null))
        .length;
  }
}
