import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/resources/color_manager.dart';
import 'package:graduation_project/core/utils/ui_utils.dart';
import 'package:graduation_project/core/widgets/loading_indicator.dart';
import 'package:graduation_project/features/notification/presentiation/cubit/notification_cubit.dart';
import 'package:graduation_project/features/notification/presentiation/cubit/notification_states.dart';

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
    context.read<NotificationCubit>().getNotifications();
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
            return ListView.builder(
              itemCount: state.notification.length,
              itemBuilder: (context, index) {
                final notification = state.notification[index];
                return Dismissible(
                  key: Key(notification.id.toString()),
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) {
                    setState(() {
                      notifications.removeAt(index);
                    });
                    UIUtils.showMessage(
                        context, "تم مسح الإشعارات", ColorManager.green);
                  },
                  background: Container(
                    color: ColorManager.red,
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    // child: const Icon(
                    //   Icons.delete,
                    //   color: ColorManager.white,
                    // ),
                  ),
                  // child: Container(
                  //   margin: EdgeInsets.all(10),
                  //   decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(28),
                  //       border: Border.all(
                  //         color: ColorManager.primary,
                  //         width: .3,
                  //       )),
                  child: Card(
                    color: notification.isRead!
                        ? ColorManager.white
                        : ColorManager.blue,
                    surfaceTintColor: notification.isRead!
                        ? ColorManager.white
                        : ColorManager.blue,
                    child: ListTile(
                      leading: !notification.isRead!
                          ? Container(
                              width: 10,
                              height: 10,
                              decoration: const BoxDecoration(
                                  color: Colors.red, shape: BoxShape.circle),
                            )
                          : null,
                      title: Text(notification.title ?? ''),
                      subtitle: Text(notification.body ?? ''),
                      trailing: Icon(
                        notification.isRead!
                            ? Icons.check_circle
                            : Icons.notifications_active,
                        color: notification.isRead!
                            ? ColorManager.grey
                            : ColorManager.green,
                      ),
                      onTap: () async {
                        if (!notification.isRead!) {
                          await context
                              .read<NotificationCubit>()
                              .markAsRead(notification.id!);
                        }
                        setState(() {
                          notification.isRead = true;
                        });
                      },
                    ),
                  ),
                  // ),
                  // ),
                );
              },
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
