import 'package:graduation_project/features/feedback/data/model/feedback_get_response/feedback_get_response.dart';

abstract class FeedbackStates {}

class FeedbackInitial extends FeedbackStates {}

class FeedbackLoading extends FeedbackStates {}

class FeedbackError extends FeedbackStates {
  final String message;
  FeedbackError(this.message);
}

class FeedbackSuccess extends FeedbackStates {
  final FeedbackGetResponse response;
  FeedbackSuccess(this.response);
}
