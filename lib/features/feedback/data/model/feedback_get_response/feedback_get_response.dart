class FeedbackGetResponse {
  int? id;
  DateTime? date;
  String? receptionServiceRating;
  String? medicalServiceRating;
  String? dispensedMedicationRating;
  String? internationalizationRating;
  String? receptionComplaintsRating;
  String? environmentRating;
  String? comments;

  FeedbackGetResponse({
    this.id,
    this.date,
    this.receptionServiceRating,
    this.medicalServiceRating,
    this.dispensedMedicationRating,
    this.internationalizationRating,
    this.receptionComplaintsRating,
    this.environmentRating,
    this.comments,
  });

  factory FeedbackGetResponse.fromJson(Map<String, dynamic> json) {
    return FeedbackGetResponse(
      id: json['id'] as int?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      receptionServiceRating: json['receptionServiceRating'] as String?,
      medicalServiceRating: json['medicalServiceRating'] as String?,
      dispensedMedicationRating: json['dispensedMedicationRating'] as String?,
      internationalizationRating: json['internationalizationRating'] as String?,
      receptionComplaintsRating: json['receptionComplaintsRating'] as String?,
      environmentRating: json['environmentRating'] as String?,
      comments: json['comments'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'date': date?.toIso8601String(),
        'receptionServiceRating': receptionServiceRating,
        'medicalServiceRating': medicalServiceRating,
        'dispensedMedicationRating': dispensedMedicationRating,
        'internationalizationRating': internationalizationRating,
        'receptionComplaintsRating': receptionComplaintsRating,
        'environmentRating': environmentRating,
        'comments': comments,
      };
}
