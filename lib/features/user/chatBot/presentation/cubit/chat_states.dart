import 'package:graduation_project/features/user/chatBot/domain/entity/analysis_entity.dart';

abstract class ChatStates {}

class ChatInitial extends ChatStates {}

class ChatLoading extends ChatStates {}

class ChatSuccess extends ChatStates {
  final String message;
  ChatSuccess(this.message);
}

class AnalysisSuccess extends ChatStates {
  final AnalysisEntity entity;
  AnalysisSuccess(this.entity);
}

class ChatError extends ChatStates {
  final String message;
  ChatError(this.message);
}
