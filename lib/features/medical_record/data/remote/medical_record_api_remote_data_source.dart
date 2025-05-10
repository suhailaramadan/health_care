import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:graduation_project/core/constants.dart';
import 'package:graduation_project/core/error/exceptions.dart';
import 'package:graduation_project/core/error/failure.dart';
import 'package:graduation_project/features/medical_record/data/model/medical_record_add_response/add_medical_record_model.dart';
import 'package:graduation_project/features/medical_record/data/model/medical_record_add_response/medical_record_add_response.dart';
import 'package:graduation_project/features/medical_record/data/model/medical_record_delete_response.dart';
import 'package:graduation_project/features/medical_record/data/model/patient_medical_record_response/patient_medical_record_response.dart';
import 'package:graduation_project/features/medical_record/data/model/update_medical_record_response/update_medical_record_model.dart';
import 'package:graduation_project/features/medical_record/data/model/update_medical_record_response/update_medical_record_response.dart';

import 'package:graduation_project/features/medical_record/data/remote/medical_record_remote_data_source.dart';
import 'package:graduation_project/features/medical_record/domain/entity/medical_record_add_entity.dart';
import 'package:graduation_project/features/medical_record/domain/entity/medical_record_update_entity.dart';
import 'package:graduation_project/features/medical_record/domain/mapper/update_medical_record.dart';
import 'package:graduation_project/features/user/booking/data/models/doctors_appointment_response/update_appointment_request.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Singleton(as: MedicalRecordRemoteDataSource)
class MedicalRecordApiRemoteDataSource extends MedicalRecordRemoteDataSource {
  final Dio dio;
  MedicalRecordApiRemoteDataSource(this.dio);
  @override
  Future<PatientMedicalRecordResponse> getMedicalRecordPatient(
      String patientId) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(CacheConstants.tokenKey);
    try {
      final response = await dio.get("Examination/patient/$patientId",
          options: Options(headers: {'Authorization': 'Bearer $token'}));
      return PatientMedicalRecordResponse.fromJson(response.data);
    } catch (e) {
      String? message;
      if (e is DioException) {
        message = e.response?.data['message'];
      }
      throw RemoteException(message ?? 'تعذر تحميل السجل');
    }
  }

  @override
  Future<PatientMedicalRecordResponse> getMedicalRecordDoctor() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(CacheConstants.tokenKey);
    try {
      final response = await dio.get("Examination/doctor",
          options: Options(headers: {'Authorization': 'Bearer $token'}));
      return PatientMedicalRecordResponse.fromJson(response.data);
    } catch (e) {
      String? message;
      if (e is DioException) {
        message = e.response?.data['message'];
      }
      throw RemoteException(message ?? 'تعذر تحميل السجلات');
    }
  }

  @override
  Future<PatientMedicalRecordResponse> getMedicalRecordById(int id) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(CacheConstants.tokenKey);
    try {
      print("remote api $id");
      print("token---->$token");
      final reponse = await dio.get("Examination/$id",
          options: Options(headers: {'Authorization': 'Bearer $token'}));
      print("Response $reponse");
      print("ResponseData-> ${reponse.data}");
      print("StatusCode ${reponse.statusCode}");

      return PatientMedicalRecordResponse.fromJson(reponse.data);
    } catch (e) {
      String? message;
      if (e is DioException) {
        message = e.response?.data['message'];
        print("Dio      ${e.response}");
        print("Exceptiomn ${e.response?.data}");
        print("Statgggggggg ${e.response?.statusCode}");
      }
      throw RemoteException(message ?? 'تعذر تحميل السجل');
    }
  }

  @override
  Future<Unit> deleteMedicalRecord(int id) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(CacheConstants.tokenKey);
    final response = await dio.delete("Examination/$id",
        options: Options(headers: {'Authorization': 'Bearer $token'}));
    if (response.statusCode == 200 && response.data['success'] == true) {
      return unit;
    } else {
      throw Failure(response.data['message']);
    }
  }

  @override
  Future<MedicalRecordAddResponse> addMedicalRecord(
      AddMedicalRecordModel add) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(
      CacheConstants.tokenKey,
    );
    print("Token----------- $token");
    try {
      final response = await dio.post("Examination",
          data: add.toJson(),
          options: Options(headers: {'Authorization': 'Bearer $token'}));
      if (response.statusCode == 200 && response.data['success'] == true) {
        return MedicalRecordAddResponse.fromJson(response.data);
      } else {
        throw Failure(response.data['message'] ?? 'حدث خطأ ما');
      }
    } catch (e) {
      throw RemoteException("فشل في إضافة التشخيص : $e");
    }
  }

  @override
  Future<UpdateMedicalRecordResponse> updateMedicalRecord(
      UpdateMedicalRecordModel data, int bookingId) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(CacheConstants.tokenKey);
    try {
      final response = await dio.put("Examination/$bookingId",
          data: data.toJson(),
          options: Options(headers: {'Authorization': 'Bearer $token'}));
      print("vvo ${response.data}");
      return UpdateMedicalRecordResponse.fromJson(response.data);
    } catch (e) {
      throw const RemoteException('فشل في تعديل الحالة');
    }
  }
}
