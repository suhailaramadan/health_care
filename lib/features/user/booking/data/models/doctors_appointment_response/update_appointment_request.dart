class UpdateAppointmentRequest {
  int? id;
  int? day;
  String? startTime;
  String? endTime;
  int? duration;
  UpdateAppointmentRequest(
      {required this.id,
      required this.day,
      required this.duration,
      required this.endTime,
      required this.startTime});
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'day': day,
      'startTime': startTime,
      'endTime': endTime,
      'duration': duration,
    };
  }
}
