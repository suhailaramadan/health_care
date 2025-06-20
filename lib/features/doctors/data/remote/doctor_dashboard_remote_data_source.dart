import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/error/failure.dart';
import 'package:graduation_project/features/doctors/data/model/doctor_dash_board_response.dart';
import 'package:graduation_project/features/user/booking/data/models/doctors_appointment_response/doctors_appointment_response.dart';
import 'package:graduation_project/features/user/booking/domain/repository/doctor_appointments_repository.dart';

abstract class DoctorDashboardRemoteDataSource {
  Future<DoctorDashBoardResponse> getDoctorDashboard();
}
