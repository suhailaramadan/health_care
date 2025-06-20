import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/error/failure.dart';
import 'package:graduation_project/features/doctors/data/model/doctor_dash_board_response.dart';
import 'package:graduation_project/features/doctors/domain/repository/doctor_dashboard_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class DoctorDashboardUseCase {
  final DoctorDashboardRepository dashboardRepository;
  DoctorDashboardUseCase(this.dashboardRepository);
  Future<Either<Failure, DoctorDashBoardResponse>> call() async =>
      dashboardRepository.getDoctorDashboeard();
}
