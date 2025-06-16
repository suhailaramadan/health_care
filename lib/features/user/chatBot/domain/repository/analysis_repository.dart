import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/error/failure.dart';
import 'package:graduation_project/features/user/chatBot/domain/entity/analysis_entity.dart';

abstract class AnalysisRepository {
  Future<Either<Failure, AnalysisEntity>> analysisImage(String filePath);
}
