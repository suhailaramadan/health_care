import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
        title: Text(
          "الإشعارات",
          style: getSemiBoldStyle(color: ColorManager.textColor),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<NotificationCubit, NotificationsStats>(
        builder: (context, state) {
          if (state is NotificationLoading) {
            return const Center(child: LoadingIndicator());
          } else if (state is NotificationError) {
            return Center(
              child: Text(state.message),
            );
          } else if (state is NotificaltionSuccess &&
              state.notification.isNotEmpty) {
            final notifications = state.notification;
            if (notifications.isEmpty) {
              return const Center(
                child: CircularProgressIndicator(
                  color: ColorManager.primary,
                ),
              );
            }

            return ListView.builder(
              // .
              // separated(
              itemCount: state.notification.length,
              // separatorBuilder: (context, index) => const Divider(
              //   color: ColorManager.blue,
              // ),
              itemBuilder: (context, index) {
                final notification = state.notification[index];
                final dateTime = DateFormat("dd MMM, yyy - hh:mm a")
                    .format(notification.createdAt ?? DateTime.now());

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
                return Container(
                  margin: const EdgeInsets.all(15),
                  // elevation: notification.isRead! ? 1 : 4,
                  decoration: BoxDecoration(
                      color: notification.isRead!
                          ? ColorManager.white
                          : ColorManager.blue,
                      border: Border.all(
                        color: ColorManager.primary,
                        width: .5,
                      ),
                      borderRadius: BorderRadius.circular(10)),

                  // surfaceTintColor: notification.isRead!
                  //     ? ColorManager.white
                  //     : ColorManager.blue,
                  child: ListTile(
                    // leading: Icon(Icons.circle,
                    //     size: 12,
                    //     color: notification.isRead!
                    //         ? ColorManager.grey
                    //         : ColorManager.primary),

                    // ? Container(
                    //     width: 10,
                    //     height: 10,
                    //     decoration: const BoxDecoration(
                    //         color: Colors.red, shape: BoxShape.circle),
                    //   )
                    // : null,
                    title: Text(
                      notification.title ?? 'بدون عنوان',
                      style: getMediumStyle(
                          color: notification.isRead!
                              ? ColorManager.textColor
                              : ColorManager.primary),
                    ),
                    subtitle: Column(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          notification.body ?? 'بدون تفاصيل',
                          style: getRegularStyle(color: ColorManager.textColor),
                        ),
                        Text(
                          dateTime,
                          style: getRegularStyle(color: ColorManager.grey),
                        )
                      ],
                    ),
                    trailing: Icon(
                      Icons.check_box,
                      color: notification.isRead == false
                          ? ColorManager.primary
                          : ColorManager.grey,
                    ),
                    onTap: () async {
                      if (!(notification.isRead == false)) {
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
          } else if (state is NotificaltionSuccess &&
              state.notification.isEmpty) {
            return Center(
                child: Text("لا توجدإشعارات للعرض",
                    style: getMediumStyle(color: ColorManager.primary)));
          }
          return const SizedBox();
        },
      ),
    );
  }
}
