import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/error/failure.dart';
import 'package:graduation_project/features/user/chatBot/domain/entity/analysis_entity.dart';
import 'package:graduation_project/features/user/chatBot/domain/repository/analysis_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class AnalysisUseCase {
  final AnalysisRepository repository;
  AnalysisUseCase(this.repository);
  Future<Either<Failure, AnalysisEntity>> call(String filePath) async =>
      repository.analysisImage(filePath);
}
