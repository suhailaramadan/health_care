import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/error/failure.dart';
import 'package:graduation_project/features/notification/domain/repository/notification_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class MarkNotificationAsReadUseCase {
  final NotificationRepository repository;
  MarkNotificationAsReadUseCase(this.repository);
  Future<Either<Failure, void>> call(String token, int id) async {
    try {
      await repository.markNotification(token, id);
      return Right(null);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
