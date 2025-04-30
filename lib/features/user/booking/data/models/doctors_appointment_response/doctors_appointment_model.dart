class DoctorsAppointmentModel {
  int? id;
  int? day;
  String? startTime;
  String? endTime;
  int? duration;
  bool? isAvailable;
  String? doctorId;

  DoctorsAppointmentModel({
    this.id,
    this.day,
    this.startTime,
    this.endTime,
    this.duration,
    this.isAvailable,
    this.doctorId,
  });

  factory DoctorsAppointmentModel.fromJson(Map<String, dynamic> json) =>
      DoctorsAppointmentModel(
        id: json['id'] as int?,
        day: json['day'] as int?,
        startTime: json['startTime'] as String?,
        endTime: json['endTime'] as String?,
        duration: json['duration'] as int?,
        isAvailable: json['isAvailable'] as bool?,
        doctorId: json['doctorId'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'day': day,
        'startTime': startTime,
        'endTime': endTime,
        'duration': duration,
        'isAvailable': isAvailable,
        'doctorId': doctorId,
      };
}
