class AnalysisResponse {
  String? textExtracted;
  String? rawDiagnosis;
  String? note;

  AnalysisResponse({this.textExtracted, this.rawDiagnosis, this.note});

  factory AnalysisResponse.fromJson(Map<String, dynamic> json) {
    return AnalysisResponse(
      textExtracted: json['text_extracted'] as String?,
      rawDiagnosis: json['raw_diagnosis'] as String?,
      note: json['note'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'text_extracted': textExtracted,
        'raw_diagnosis': rawDiagnosis,
        'note': note,
      };
}
