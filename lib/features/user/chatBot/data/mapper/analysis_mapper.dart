import 'package:graduation_project/features/user/chatBot/data/model/analysis_response.dart';
import 'package:graduation_project/features/user/chatBot/domain/entity/analysis_entity.dart';

extension AnalysisMapper on AnalysisResponse {
  AnalysisEntity toEntity() => AnalysisEntity(
      note: note, rawDiagnosis: rawDiagnosis, textExtracted: textExtracted);
}
