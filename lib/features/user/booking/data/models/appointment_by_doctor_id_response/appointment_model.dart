import 'package:dartz/dartz.dart';

class AppointmentModel {
  String? date;
  String? day;
  List<String>? availableSlots;

  AppointmentModel({this.date, this.day, this.availableSlots});

  factory AppointmentModel.fromJson(Map<String, dynamic> json) =>
      AppointmentModel(
        date: json['date'] as String?,
        day: json['day'] as String?,
        availableSlots:
            (json['availableSlots'] as List<dynamic>?)?.cast<String>(),
      );

  Map<String, dynamic> toJson() => {
        'date': date,
        'day': day,
        'availableSlots': availableSlots,
      };
}
