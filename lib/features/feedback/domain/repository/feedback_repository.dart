import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/error/failure.dart';
import 'package:graduation_project/features/feedback/data/model/feedback_get_response/feedback_get_response.dart';
import 'package:graduation_project/features/feedback/domain/entites/feedback_entity.dart';

abstract class FeedbackRepository {
  Future<Either<Failure, FeedbackGetResponse>> sendFeedback(
      FeedbackEntity entity);
}
