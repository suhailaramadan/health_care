import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/constants.dart';
import 'package:graduation_project/core/resources/color_manager.dart';
import 'package:graduation_project/core/resources/styles_manager.dart';
import 'package:graduation_project/core/utils/ui_utils.dart';
import 'package:graduation_project/core/widgets/loading_indicator.dart';
import 'package:graduation_project/features/notification/presentiation/cubit/notification_cubit.dart';
import 'package:graduation_project/features/notification/presentiation/cubit/notification_states.dart';
import 'package:intl/intl.dart';

class NotificationScreen extends StatefulWidget {
  static const notification = "/notification";
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  void initState() {
    super.initState();
    // context.read<NotificationCubit>().initializeFirebaseNotifications();
    context.read<NotificationCubit>().getNotification();

    // context.read<NotificationCubit>().loadNotifications();
    print("NotifuOPPPPPPPend");

    // FirebaseMessaging.instance.requestPermission();
    // FirebaseMessaging.instance
    //     .getToken()
    //     .then((token) => print("FireBase token : $token"));
    // FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    //   print("Receve a messafek ");
    //   print("Resssssssssssss=> ${message.data}");
    //   if (message.notification != null) {
    //     print("message also a notification ${message.notification}");
    //   }
    // });
    // FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    //   print("!clicked");
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("الإشعارات"),
      ),
      body: BlocBuilder<NotificationCubit, NotificationsStats>(
        builder: (context, state) {
          if (state is NotificationLoading) {
            return const Center(child: LoadingIndicator());
          } else if (state is NotificationError) {
            return Center(
              child: Text(state.message),
            );
          } else if (state is NotificaltionSuccess) {
            final notifications = state.notification;
            if (notifications.isEmpty) {
              return const Center(
                child: CircularProgressIndicator(
                  color: ColorManager.primary,
                ),
              );
            }
            print("jjjjjjjjjjjjjjjjj");
            return ListView.separated(
              itemCount: state.notification.length,
              separatorBuilder: (context, index) => const Divider(
                color: ColorManager.blue,
              ),
              itemBuilder: (context, index) {
                final notification = state.notification[index];
                // return Dismissible(
                //   key: Key(notification.id.toString()),
                //   direction: DismissDirection.endToStart,
                //   onDismissed: (direction) {
                //     setState(() {
                //       notifications.removeAt(index);
                //     });
                //     UIUtils.showMessage(
                //         context, "تم مسح الإشعارات", ColorManager.green);
                //   },
                //   background:
                return Card(
                  margin: const EdgeInsets.all(15),
                  color: notification.isRead != null
                      ? ColorManager.white
                      : ColorManager.blue,
                  surfaceTintColor: notification.isRead != null
                      ? ColorManager.white
                      : ColorManager.blue,
                  child: ListTile(
                    leading: !(notification.isRead != null)
                        ? Container(
                            width: 10,
                            height: 10,
                            decoration: const BoxDecoration(
                                color: Colors.red, shape: BoxShape.circle),
                          )
                        : null,
                    title: Text(notification.title ?? 'بدون عنوان'),
                    subtitle: Text(notification.body ?? 'بدون تفاصيل'),
                    trailing: Icon(
                      notification.isRead != null
                          ? Icons.check_circle
                          : Icons.notifications_active,
                      color: notification.isRead != null
                          ? ColorManager.grey
                          : ColorManager.green,
                    ),
                    onTap: () async {
                      if (!(notification.isRead != null)) {
                        await context
                            .read<NotificationCubit>()
                            .markAsRead(notification.id ?? 0);
                      }
                      setState(() {
                        notification.isRead = true;
                      });
                    },
                  ),
                );
              },
            );
          } else {
            return Center(
                child: Text("لا توجدإشعارات للعرض",
                    style: getMediumStyle(color: ColorManager.primary)));
          }
        },
      ),
    );
  }
}
