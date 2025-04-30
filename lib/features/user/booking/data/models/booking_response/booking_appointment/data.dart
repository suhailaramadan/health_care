class Data {
  String? date;
  String? time;
  bool? isbooked;
  String? doctorId;

  Data({this.date, this.time, this.isbooked, this.doctorId});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        date: json['date'] as String?,
        time: json['time'] as String?,
        isbooked: json['isbooked'] as bool?,
        doctorId: json['doctorId'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'date': date,
        'time': time,
        'isbooked': isbooked,
        'doctorId': doctorId,
      };
}
