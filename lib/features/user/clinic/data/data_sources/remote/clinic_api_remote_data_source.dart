import 'dart:math';

import 'package:dio/dio.dart';
import 'package:graduation_project/core/constants.dart';
import 'package:graduation_project/core/error/exceptions.dart';
import 'package:graduation_project/features/user/clinic/data/data_sources/remote/clinic_remote_data_source.dart';
import 'package:graduation_project/features/user/clinic/data/model/clinics_response/clinic_response.dart';
import 'package:graduation_project/features/user/clinic/data/model/search_response/search_response.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ClinicRemoteDataSource)
class ClinicApiRemoteDataSource implements ClinicRemoteDataSource {
  final Dio _dio;
  const ClinicApiRemoteDataSource(this._dio);
  @override
  Future<ClinicsResponse> getClinics() async {
    try {
      final response = await _dio.get(ApiConstants.clinicEndPoint);
      return ClinicsResponse.fromJson(response.data);
    } catch (exception) {
      String? message;
      if (exception is DioException) {
        message = exception.response?.data['message'];
      }
      throw RemoteException(message ?? "تعذر تحميل العيادات");
    }
  }

  @override
  Future<ClinicsResponse> getClinicsByID(int id) async {
    try {
      final response = await _dio.get("${ApiConstants.clinicEndPoint}/$id");
      return ClinicsResponse.fromJson(response.data);
    } catch (exception) {
      String? message;
      if (exception is DioException) {
        message = exception.response?.data['message'];
      }
      throw RemoteException(message ?? "تعذر تحميل العيادات");
    }
  }

  @override
  Future<SearchResponse> search(String query) async {
    try {
      final response = await _dio.get("${ApiConstants.clinicEndPoint}/search",
          queryParameters: {'query': query});

      return SearchResponse.fromJson(response.data);
    } catch (exception) {
      String? message;
      if (exception is DioException) {
        message = exception.response?.data['message'];
      }
      throw RemoteException(message ?? "لا توجد عيادات مطابقة");
    }
  }
}
