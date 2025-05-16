import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:firebase_messaging_platform_interface/src/remote_message.dart';
import 'package:graduation_project/core/constants.dart';
import 'package:graduation_project/features/notification/data/data_source/remote/local/local_data_source.dart';
import 'package:graduation_project/features/notification/data/model/notification_get_response/notification_get_response.dart';
import 'package:graduation_project/main.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Singleton(as: LocalDataSource)
class LocalDataSourceSharedPref extends LocalDataSource {
  @override
  Future<void> saveNotification(NotificationGetResponse notification) async {
    final pref = await SharedPreferences.getInstance();
    final notifications =
        pref.getStringList(CacheConstants.notificationKey) ?? [];
    print("BeforeSaviiiig  $notifications");
    notifications.add(jsonEncode(notification.toJson()));
    await pref.setStringList(CacheConstants.notificationKey, notifications);
    print("AfterSaviiiiiiing $notifications");
    final check = pref.getStringList(CacheConstants.notificationKey) ?? [];
    print("cheejjjjjjck $check");
  }

  @override
  Future<List<NotificationGetResponse>> getNotification() async {
    final pref = await SharedPreferences.getInstance();
    final notifications =
        pref.getStringList(CacheConstants.notificationKey) ?? [];
    return notifications
        .map((e) => NotificationGetResponse.fromJson(jsonDecode(e)))
        .toList();
  }
}
