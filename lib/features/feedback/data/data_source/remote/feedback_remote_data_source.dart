import 'package:graduation_project/features/feedback/data/model/feedback_get_response/feedback_get_response.dart';
import 'package:graduation_project/features/feedback/domain/entites/feedback_entity.dart';

abstract class FeedbackRemoteDataSource {
  Future<FeedbackGetResponse> sendFeedBack(FeedbackEntity entity);
}
