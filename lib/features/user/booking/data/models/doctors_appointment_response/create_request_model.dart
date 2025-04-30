class CreateRequestModel {
  int? day;
  String? startTime;
  String? endTime;
  int? duration;
  String? doctorId;
  CreateRequestModel(
      {required this.day,
      required this.startTime,
      required this.endTime,
      required this.doctorId,
      required this.duration});
  Map<String, dynamic> toJson() => {
        'day': day,
        'startTime': startTime,
        'endTime': endTime,
        'duration': duration,
        'doctorId': doctorId,
      };
}
