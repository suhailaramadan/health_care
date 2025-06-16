import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/error/failure.dart';
import 'package:graduation_project/features/user/chatBot/data/model/chat_response.dart';
import 'package:graduation_project/features/user/chatBot/domain/entity/analysis_entity.dart';
import 'package:graduation_project/features/user/chatBot/domain/entity/chat_entity.dart';

abstract class ChatRemoteDataSource {
  Future<Either<Failure, ChatEntity>> sendMessage(String message);
  Future<Either<Failure, AnalysisEntity>> analysisImage(String filePath);
}
