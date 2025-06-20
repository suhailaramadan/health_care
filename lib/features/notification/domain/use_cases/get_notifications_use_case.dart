import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/error/failure.dart';
import 'package:graduation_project/features/notification/data/model/notification_get_response/notification_get_response.dart';
import 'package:graduation_project/features/notification/data/model/notification_post_response.dart';
import 'package:graduation_project/features/notification/domain/repository/notification_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class GetNotificationsUseCase {
  final NotificationRepository repository;
  GetNotificationsUseCase(this.repository);
  Future<Either<Failure, List<NotificationGetResponse>>> call(
      String token) async {
    print("object=======$token");
    try {
      final notifications = await repository.getNotifications(token);
      return Right(notifications);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
