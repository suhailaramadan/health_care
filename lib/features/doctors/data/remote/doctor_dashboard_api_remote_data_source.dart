import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:graduation_project/core/constants.dart';
import 'package:graduation_project/core/error/exceptions.dart';
import 'package:graduation_project/core/error/failure.dart';
import 'package:graduation_project/features/doctor/data/data_sources/remote/doctor_api_remote_data_source.dart';
import 'package:graduation_project/features/doctor/data/data_sources/remote/doctor_remote_data_source.dart';
import 'package:graduation_project/features/doctors/data/model/doctor_dash_board_response.dart';
import 'package:graduation_project/features/doctors/data/remote/doctor_dashboard_remote_data_source.dart';
import 'package:graduation_project/features/user/booking/data/models/doctors_appointment_response/doctors_appointment_response.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Singleton(as: DoctorDashboardRemoteDataSource)
class DoctorDashboardApiRemoteDataSource
    extends DoctorDashboardRemoteDataSource {
  final Dio dio;
  DoctorDashboardApiRemoteDataSource(this.dio);
  @override
  Future<DoctorDashBoardResponse> getDoctorDashboard() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(CacheConstants.tokenKey);
    try {
      final response = await dio.get("DoctorDashboard/home",
          options: Options(
            headers: {'Authorization': 'Bearer $token'},
          ));
      return DoctorDashBoardResponse.fromJson(response.data);
    } catch (e) {
      throw RemoteException("فشل في جلب البيانات");
    }
  }
}
