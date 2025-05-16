// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:graduation_project/features/notification/data/model/notification_get_response/notification_get_response.dart';

// class FirebaseServices {
//   final FirebaseMessaging _firebaseServices = FirebaseMessaging.instance;
//   Future<void> initializFirebase(
//       Function(NotificationGetResponse) onNotification) async {
//     // await _firebaseServices.requestPermission();
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       final notification = NotificationGetResponse(
//           id: message.data['id'],
//           title: message.notification?.title ?? '',
//           body: message.notification?.body ?? '');
//       onNotification(notification);
//     });
//   }

//   // Future<String?> getToken() async {
//   //   return await _firebaseServices.getToken();
//   // }

//   // void onMessageRecieved(Function(RemoteMessage) onMessage) {
//   //   FirebaseMessaging.onMessage.listen(onMessage);
//   // }

//   // void onMessageOpenedApp(Function(RemoteMessage) onMessage) {
//   //   FirebaseMessaging.onMessage.listen(onMessage);
//   // }
// }
