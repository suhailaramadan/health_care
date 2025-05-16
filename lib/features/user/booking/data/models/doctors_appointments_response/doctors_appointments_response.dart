class DoctorsAppointmentsResponse {
  int? id;
  String? clinicName;
  String? doctorId;
  String? doctorName;
  String? day;
  String? startTime;
  String? endTime;
  int? duration;

  DoctorsAppointmentsResponse({
    this.id,
    this.clinicName,
    this.doctorId,
    this.doctorName,
    this.day,
    this.startTime,
    this.endTime,
    this.duration,
  });

  factory DoctorsAppointmentsResponse.fromJson(Map<String, dynamic> json) {
    return DoctorsAppointmentsResponse(
      id: json['id'] as int?,
      clinicName: json['clinicName'] as String?,
      doctorId: json['doctorId'] as String?,
      doctorName: json['doctorName'] as String?,
      day: json['day'] as String?,
      startTime: json['startTime'] as String?,
      endTime: json['endTime'] as String?,
      duration: json['duration'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'clinicName': clinicName,
        'doctorId': doctorId,
        'doctorName': doctorName,
        'day': day,
        'startTime': startTime,
        'endTime': endTime,
        'duration': duration,
      };
}
