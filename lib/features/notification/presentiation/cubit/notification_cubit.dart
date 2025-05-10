import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/constants.dart';
import 'package:graduation_project/features/notification/data/model/notification_get_response/notification_get_response.dart';
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
      this.getNotificationsUseCase, this.markNotificationAsReadUseCase)
      : super(NotificationInitial());
  List<NotificationGetResponse> notifications = [];
  Future<void> getNotifications() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(CacheConstants.tokenKey);

    emit(NotificationLoading());
    final response = await getNotificationsUseCase(token ?? '');
    response.fold((failure) => emit(NotificationError(failure.message)),
        (notification) {
      // final uniqueNotification = notification.toSet().toList();
      notifications = notification;
      emit(NotificaltionSuccess(notification));
    });
  }

  Future<void> markAsRead(int id) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(CacheConstants.tokenKey);

    emit(NotificationLoading());
    final response = await markNotificationAsReadUseCase(token ?? '', id);
    response.fold((failure) => emit(NotificationError(failure.message)), (_) {
      emit(NotificationMarkAsRead());
      getNotifications();
    });
  }

  int getUnReadCount() {
    return notifications.where((notification) => !notification.isRead!).length;
  }
}
