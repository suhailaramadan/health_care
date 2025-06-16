class FeedbackEntity {
  int? id;
  DateTime? date;
  String? receptionServiceRating;
  String? medicalServiceRating;
  String? dispensedMedicationRating;
  String? internationalizationRating;
  String? receptionComplaintsRating;
  String? environmentRating;
  String? comments;
  FeedbackEntity(
      {required this.id,
      required this.date,
      required this.comments,
      required this.dispensedMedicationRating,
      required this.environmentRating,
      required this.internationalizationRating,
      required this.medicalServiceRating,
      required this.receptionComplaintsRating,
      required this.receptionServiceRating});
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
