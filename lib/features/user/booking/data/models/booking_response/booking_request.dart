import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BookingRequest {
  final String time;
  final String date;
  final String doctorId;
  final bool isBooking;
  BookingRequest(
      {required this.time,
      required this.date,
      required this.doctorId,
      required this.isBooking});
  Map<String, dynamic> toJson() {
    return {"date": date, "time": time, "doctorId": doctorId};
  }
}
