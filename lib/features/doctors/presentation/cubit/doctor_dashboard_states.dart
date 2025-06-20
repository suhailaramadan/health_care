import 'package:graduation_project/features/doctors/data/model/doctor_dash_board_response.dart';

abstract class DoctorDashboardStates {}

class DoctorDashboardInitial extends DoctorDashboardStates {}

class DoctorDashboardLoading extends DoctorDashboardStates {}

class DoctorDashboardError extends DoctorDashboardStates {
  final String message;
  DoctorDashboardError(this.message);
}

class DoctorDashboardSuccess extends DoctorDashboardStates {
  final DoctorDashBoardResponse response;
  DoctorDashboardSuccess(this.response);
}
