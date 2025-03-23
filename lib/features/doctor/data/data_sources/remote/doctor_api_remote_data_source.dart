import 'package:dio/dio.dart';
import 'package:graduation_project/core/constants.dart';
import 'package:graduation_project/core/error/exceptions.dart';
import 'package:graduation_project/features/doctor/data/data_sources/remote/doctor_remote_data_source.dart';
import 'package:graduation_project/features/doctor/data/model/doctor_response/doctor_response.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: DoctorRemoteDataSource)
class DoctorApiRemoteDataSource implements DoctorRemoteDataSource {
  final Dio _dio;
  DoctorApiRemoteDataSource(this._dio);
  @override
  Future<DoctorResponse> getDoctors() async {
    try {
      final response = await _dio.get(ApiConstants.getdoctorsEndPoint);
      return DoctorResponse.fromJson(response.data);
    } catch (exception) {
      String? message;
      if (exception is DioException) {
        message = exception.response?.data['message'];
      }
      throw RemoteException(message ?? "تعذر تحميل الأطباء");
    }
  }

  @override
  Future<DoctorResponse> getDoctorsByClinicId(int clinicId) async {
    // final int parsedClinicId = int.tryParse(clinicId.toString()) ?? 0;
    try {
      final response =
          await _dio.get("${ApiConstants.baseUrl}Doctor/by-clinic/$clinicId");
      // "${ApiConstants.baseUrl}Doctor/by-clinic/",
      // queryParameters: {'clinicId': clinicId});
      // await _dio.get("${ApiConstants.baseUrl}Doctor/by-clinic/$clinicId");
      print("APiREsponseId--------------${response.data}");
      return DoctorResponse.fromJson(response.data);
    } catch (exception) {
      String? message;
      if (exception is DioException) {
        message = exception.response?.data['message'];
      }
      throw RemoteException(message ?? 'تعذر تحميل الأطباء');
    }
  }
}
