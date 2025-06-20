import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/error/exceptions.dart';
import 'package:graduation_project/core/error/failure.dart';
import 'package:graduation_project/features/doctor/data/data_sources/remote/doctor_api_remote_data_source.dart';
import 'package:graduation_project/features/doctor/data/data_sources/remote/doctor_remote_data_source.dart';
import 'package:graduation_project/features/doctors/data/model/doctor_dash_board_response.dart';
import 'package:graduation_project/features/doctors/data/remote/doctor_dashboard_remote_data_source.dart';
import 'package:graduation_project/features/doctors/domain/repository/doctor_dashboard_repository.dart';
import 'package:graduation_project/features/user/booking/data/repository/doctor_appointment_repository_impl.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: DoctorDashboardRepository)
class DoctorDashBoardRepositoryImpl extends DoctorDashboardRepository {
  final DoctorDashboardRemoteDataSource dashboardRemoteDataSource;
  DoctorDashBoardRepositoryImpl(this.dashboardRemoteDataSource);

  @override
  Future<Either<Failure, DoctorDashBoardResponse>> getDoctorDashboeard() async {
    try {
      final result = await dashboardRemoteDataSource.getDoctorDashboard();
      return Right(result);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
