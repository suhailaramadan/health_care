import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/error/failure.dart';
import 'package:graduation_project/features/doctor/data/data_sources/remote/doctor_api_remote_data_source.dart';
import 'package:graduation_project/features/doctors/data/model/doctor_dash_board_response.dart';

abstract class DoctorDashboardRepository {
  Future<Either<Failure, DoctorDashBoardResponse>> getDoctorDashboeard();
}
