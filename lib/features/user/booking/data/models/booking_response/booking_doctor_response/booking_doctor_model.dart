class BookingDoctorModel {
  int? id;
  String? date;
  int? day;
  String? time;
  String? doctorId;
  String? patientId;
  String? patientFirstName;
  String? patientLastName;
  dynamic patientImageUrl;

  BookingDoctorModel({
    this.id,
    this.date,
    this.day,
    this.time,
    this.doctorId,
    this.patientId,
    this.patientFirstName,
    this.patientLastName,
    this.patientImageUrl,
  });

  factory BookingDoctorModel.fromJson(Map<String, dynamic> json) =>
      BookingDoctorModel(
        id: json['id'] as int?,
        date: json['date'] as String?,
        day: json['day'] as int?,
        time: json['time'] as String?,
        doctorId: json['doctorId'] as String?,
        patientId: json['patientId'] as String?,
        patientFirstName: json['patientFirstName'] as String?,
        patientLastName: json['patientLastName'] as String?,
        patientImageUrl: json['patientImageUrl'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'date': date,
        'day': day,
        'time': time,
        'doctorId': doctorId,
        'patientId': patientId,
        'patientFirstName': patientFirstName,
        'patientLastName': patientLastName,
        'patientImageUrl': patientImageUrl,
      };
}
