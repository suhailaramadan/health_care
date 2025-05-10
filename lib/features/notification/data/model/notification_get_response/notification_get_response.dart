class NotificationGetResponse {
  int? id;
  String? title;
  String? body;
  bool? isRead;
  DateTime? createdAt;
  String? patientId;
  dynamic patient;

  NotificationGetResponse({
    this.id,
    this.title,
    this.body,
    this.isRead,
    this.createdAt,
    this.patientId,
    this.patient,
  });

  factory NotificationGetResponse.fromJson(Map<String, dynamic> json) {
    return NotificationGetResponse(
      id: json['id'] as int?,
      title: json['title'] as String?,
      body: json['body'] as String?,
      isRead: json['isRead'] as bool?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      patientId: json['patientId'] as String?,
      patient: json['patient'] as dynamic,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'body': body,
        'isRead': isRead,
        'createdAt': createdAt?.toIso8601String(),
        'patientId': patientId,
        'patient': patient,
      };
}
