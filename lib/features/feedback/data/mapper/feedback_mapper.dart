import 'package:graduation_project/features/feedback/data/model/feedback_get_response/feedback_get_response.dart';
import 'package:graduation_project/features/feedback/domain/entites/feedback_entity.dart';

extension FeedbackMapper on FeedbackGetResponse {
  FeedbackEntity get toEntity => FeedbackEntity(
      id: id,
      date: date,
      comments: comments,
      dispensedMedicationRating: dispensedMedicationRating,
      environmentRating: environmentRating,
      internationalizationRating: internationalizationRating,
      medicalServiceRating: medicalServiceRating,
      receptionComplaintsRating: receptionComplaintsRating,
      receptionServiceRating: receptionServiceRating);
}
