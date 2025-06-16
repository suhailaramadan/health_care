import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/error/failure.dart';
import 'package:graduation_project/features/feedback/data/model/feedback_get_response/feedback_get_response.dart';
import 'package:graduation_project/features/feedback/domain/entites/feedback_entity.dart';
import 'package:graduation_project/features/feedback/domain/repository/feedback_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class SendFeedbackUseCase {
  final FeedbackRepository feedbackRepository;
  SendFeedbackUseCase(this.feedbackRepository);
  Future<Either<Failure, FeedbackGetResponse>> call(FeedbackEntity entity) {
    return feedbackRepository.sendFeedback(entity);
  }
}
