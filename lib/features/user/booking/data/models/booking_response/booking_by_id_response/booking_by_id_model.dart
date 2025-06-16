class BookingByIdModel {
  int? id;
  String? date;
  int? day;
  String? time;
  bool? isbooked;
  String? patientId;
  String? doctorId;

  BookingByIdModel({
    this.id,
    this.date,
    this.day,
    this.time,
    this.isbooked,
    this.patientId,
    this.doctorId,
  });

  factory BookingByIdModel.fromJson(Map<String, dynamic> json) =>
      BookingByIdModel(
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
