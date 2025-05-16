// import 'dart:convert';

// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:graduation_project/core/constants.dart';
// import 'package:graduation_project/core/routes/routes.dart';
// import 'package:graduation_project/features/notification/data/data_source/remote/local/local_data_source_shared_pref.dart';
// import 'package:graduation_project/features/notification/data/model/notification_get_response/notification_get_response.dart';
// import 'package:graduation_project/features/notification/domain/use_cases/get_notifications_use_case.dart';
// import 'package:graduation_project/features/notification/domain/use_cases/mark_notification_as_read_use_case.dart';
// import 'package:graduation_project/features/notification/presentiation/cubit/notification_states.dart';
// import 'package:graduation_project/main.dart';
// import 'package:injectable/injectable.dart';
// import 'package:shared_preferences/shared_preferences.dart';

import 'dart:async';
import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:graduation_project/core/constants.dart';
import 'package:graduation_project/features/notification/data/firebase_services.dart';
import 'package:graduation_project/features/notification/data/model/notification_get_response/notification_get_response.dart';
import 'package:graduation_project/features/notification/domain/repository/notification_repository.dart';
import 'package:graduation_project/features/notification/domain/use_cases/get_notifications_use_case.dart';
import 'package:graduation_project/features/notification/domain/use_cases/mark_notification_as_read_use_case.dart';
import 'package:graduation_project/features/notification/presentiation/cubit/notification_states.dart';
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
    print("hhhhhhhhhhhhhhhhhhhhhh");
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
    response.fold((failure) => emit(NotificationError(failure.message)),
        (notification) async {
      // final newNotification = notification
      //     .where((e) => notifications.any((element) => element.id == e.id));
      // notifications.addAll(newNotification);
      // // final uniqueNotification = notification.toSet().toList();
      // final localNotification =
      //     await LocalDataSourceSharedPref().getNotification();
      // notifications = [...localNotification, ...notification];
      notifications = notification;
//       unreadNtifi = notifications.where((element) => !element.isRead!).length;
//       final ids = <int>{};
      // notifications.retainWhere((notifi) => ids.add(notifi.id ?? 0));

      // for (var notif in notification) {
      // //   if (!(notif.isRead != null)) {
      //     sendLocalNotigication(NotificationGetResponse(
      //         title: notif.title ?? '', body: notif.body ?? ''));
      //   }
      // }

      emit(NotificaltionSuccess(notification));
    });
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
    response.fold((failure) => emit(NotificationError(failure.message)), (_) {
      getNotification();
      emit(NotificationMarkAsRead());
    });
  }

  int getUnReadCount() {
    return notifications
        .where((notification) => !(notification.isRead != null))
        .length;
  }

//   void initializeFirebaseNotifications() {
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
//       print("Recieve a new message : ${message.notification?.title}");
//       if (message.notification != null) {
//         final notification = NotificationGetResponse(
//             id: int.tryParse(message.messageId ?? '') ?? 0,
//             title: message.notification?.title ?? "",
//             body: message.notification?.body ?? '',
//             createdAt: DateTime.now(),
//             isRead: true);
//         await LocalDataSourceSharedPref().saveNotification(notification);
//         print("///////////////////${notification.toJson()}");
//         loadNotifications();
//       }
//     });
//     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//       print("Notification cliked: ${message.notification?.body}");
//       if (navigatorKey.currentState != null) {
//         navigatorKey.currentState!.pushNamed(Routes.nitification);
//       }
//     });
//   }

//   Future<void> loadNotifications() async {
//     print("Loadingggggggggggggg");
//     emit(NotificationLoading());
//     try {
//       final localNotification =
//           await LocalDataSourceSharedPref().getNotification();
//       print("2222222222222$localNotification");
//       if (localNotification.isNotEmpty) {
//         notifications = localNotification;
//         emit(NotificaltionSuccess(notifications));
//       } else {
//         emit(NotificaltionSuccess([]));
//       }
//     } catch (e) {
//       print("Errrrrror $e");
//       emit(NotificationError(e.toString()));
//     }
//     // final localNotification =

//     //     await LocalDataSourceSharedPref().getNotification();
//     // print("2222222222222$localNotification");
//     // notifications = localNotification;
//     // emit(NotificaltionSuccess(notifications));
//   }

//   void sendLocalNotigication(NotificationGetResponse notification) async {
//     // final flutterNotificationPlugin = FlutterLocalNotificationsPlugin();
//     // const AndroidNotificationDetails androidNotificationDetails =
//     //     AndroidNotificationDetails('channel_id', CacheConstants.notificationKey,
//     //         importance: Importance.max,
//     //         priority: Priority.high,
//     //         ticker: 'ticker');
//     //   const DarwinNotificationDetails darwinNotificationDetails=DarwinNotificationDetails(
//     //   ''
//     //   )
//     // const NotificationDetails plteFormChannel =
//     //     NotificationDetails(android: androidNotificationDetails,iOS: );
//     FirebaseMessaging.instance.getToken().then((token) {
//       print("Tokkkkkkkkkkkkkken-> $token");
//       if (token != null) {
//         // ignore: deprecated_member_use
//         FirebaseMessaging.instance.sendMessage(to: token, data: {
//           'title': notification.title ?? '',
//           'body': notification.body ?? ''
//         });
//       }
//     });
// //   }
// // }

// class NotificationCubit extends Cubit<NotificationsStats> {
//   // final FirebaseServices _firebaseServices;
//   final String token;
//   final NotificationRepository notificationRepository;
//   NotificationCubit(this.notificationRepository, this.token)
//       : super(NotificationInitial()) {}
//   final List<NotificationGetResponse> _notification = [];
//   Future<void> fetchNotifications() async {
//     try {
//       final notifications =
//           await notificationRepository.getNotifications(token);
//       emit(NotificaltionSuccess(notifications));
//     } catch (e) {
//       print("Error fetchinf notif $e");
//     }
//   }

//   // Future<void> listenNotification()async{
//   //   notificationRepository.listenToNotificatioms((notification){
//   //     final uodateList=[notification,];
//   //     emit(NotificaltionSuccess(List.from(state))
//   //   } )
//   // }
//   Future<void> markAsRead(int id) async {
//     await notificationRepository.markNotification(token, id);
//   }
//   // Future<void> initializeNotifications() async {
  //   await _firebaseServices.initializFirebase();
  //   _firebaseServices.onMessageRecieved((message) {
  //     final newNotification = NotificationGetResponse(
  //         title: message.notification?.title ?? '',
  //         body: message.notification?.body ?? '');
  //     _notification.add(newNotification);
  //     emit(NotificaltionSuccess(List.from(_notification)));
  //   });
  //   _firebaseServices.onMessageOpenedApp((message) async {
  //     print("Opened from Notification : ${message.notification?.title}");
  //     final token = await _firebaseServices.getToken();
  //     print("FireBase Toke: $token");
  //   });
  // }
}
