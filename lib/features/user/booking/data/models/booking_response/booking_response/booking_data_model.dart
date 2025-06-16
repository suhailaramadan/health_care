class BookingDataModel {
  int? id;
  String? date;
  int? day;
  String? time;
  bool? isbooked;
  String? patientId;
  String? doctorId;

  BookingDataModel({
    this.id,
    this.date,
    this.day,
    this.time,
    this.isbooked,
    this.patientId,
    this.doctorId,
  });

  factory BookingDataModel.fromJson(Map<String, dynamic> json) =>
      BookingDataModel(
        id: json['id'] as int?,
        date: json['date'] as String?,
        day: json['day'] as int?,
        time: json['time'] as String?,
        isbooked: json['isbooked'] as bool?,
        patientId: json['patientId'] as String?,
        doctorId: json['doctorId'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'date': date,
        'day': day,
        'time': time,
        'isbooked': isbooked,
        'patientId': patientId,
        'doctorId': doctorId,
      };
}
