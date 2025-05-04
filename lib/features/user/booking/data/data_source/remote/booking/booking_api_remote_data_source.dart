import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/core/constants.dart';
import 'package:graduation_project/core/error/exceptions.dart';
import 'package:graduation_project/features/user/booking/data/data_source/remote/booking/booking_remote_data_source.dart';
import 'package:graduation_project/features/user/booking/data/models/booking_response/booking_appointment/booking_appointment.dart';
import 'package:graduation_project/features/user/booking/data/models/booking_response/booking_doctor_response/booking_doctor_model.dart';
import 'package:graduation_project/features/user/booking/data/models/booking_response/booking_doctor_response/booking_doctor_response.dart';
import 'package:graduation_project/features/user/booking/data/models/booking_response/booking_patient_response/booking_patient_response.dart';
import 'package:graduation_project/features/user/booking/data/models/booking_response/booking_request.dart';
import 'package:graduation_project/features/user/booking/data/models/delete_booking_response.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton(as: BookingRemoteDataSource)
class BookingApiRemoteDataSource implements BookingRemoteDataSource {
  final Dio _dio;
  const BookingApiRemoteDataSource(this._dio);

  @override
  Future<BookingAppointment> bookAppointment(BookingRequest request) async {
    try {
      SharedPreferences sharedPref = await SharedPreferences.getInstance();
      String? token =
          // "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9lbWFpbGFkZHJlc3MiOiJzdWhhaWxhQGdtYWlsLmNvbSIsImh0dHA6Ly9zY2hlbWFzLnhtbHNvYXAub3JnL3dzLzIwMDUvMDUvaWRlbnRpdHkvY2xhaW1zL25hbWVpZGVudGlmaWVyIjoiMmFiYjA3ZWEtYWY1ZC00YWIxLWJjN2MtMDQ1NzNmNjA5MmMzIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvbmFtZSI6InN1aGFpbGEgIiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjoiVXNlciIsImV4cCI6MTc0NDQxNTg5MCwiaXNzIjoibXljbGluaWNhcHAiLCJhdWQiOiJteWNsaW5pY2FwcCJ9.YYVpG41OOJec2WXDRkASTYvyhJT-c9QzgmKANESKWgc";
          sharedPref.getString(CacheConstants.tokenKey);
      if (token == null) {
        throw const RemoteException("لا يوجد رمز توثيق");
      }
      final response = await _dio.post(ApiConstants.bookingAppointmentEndPoint,
          data: request.toJson(),
          options: Options(headers: {
            "Content-Type": 'application/json',
            "Authorization": 'Bearer $token',
          }));
      if (response.statusCode == 200 || response.statusCode == 201) {
        return BookingAppointment.fromJson(response.data);
      } else {
        throw RemoteException('فشل الحجز , ${response.statusCode}');
      }
    } catch (e) {
      throw const RemoteException("حدث خطأ أثناء الحجز , حاول مرة أخرى");
    }
  }

  @override
  Future<BookingPatientResponse> getbookingPatient(String token) async {
    try {
      SharedPreferences sharedPref = await SharedPreferences.getInstance();
      String? token = sharedPref.getString(CacheConstants.tokenKey);
      // "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9lbWFpbGFkZHJlc3MiOiJzdWhhaWxhQGdtYWlsLmNvbSIsImh0dHA6Ly9zY2hlbWFzLnhtbHNvYXAub3JnL3dzLzIwMDUvMDUvaWRlbnRpdHkvY2xhaW1zL25hbWVpZGVudGlmaWVyIjoiMmFiYjA3ZWEtYWY1ZC00YWIxLWJjN2MtMDQ1NzNmNjA5MmMzIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvbmFtZSI6InN1aGFpbGEgIiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjoiVXNlciIsImV4cCI6MTc0NDQxNTg5MCwiaXNzIjoibXljbGluaWNhcHAiLCJhdWQiOiJteWNsaW5pY2FwcCJ9.YYVpG41OOJec2WXDRkASTYvyhJT-c9QzgmKANESKWgc";
      final response = await _dio.get(ApiConstants.bookingPatientEndPoint,
          options: Options(headers: {
            "Content-Type": 'application/json',
            "Authorization": 'Bearer $token',
          }));
      if (response.statusCode == 200 || response.statusCode == 201) {
        return BookingPatientResponse.fromJson(response.data);
      } else {
        throw RemoteException('فشل في تحميل الحجوزات , ${response.statusCode}');
      }
    } catch (e) {
      throw const RemoteException("فشل في تحميل الحجوزات");
    }
  }

  @override
  Future<DeleteBookingResponse> deleteBooking(
      int bookingId, String token) async {
    try {
      // SharedPreferences sharedPref = await SharedPreferences.getInstance();
      // String? token = sharedPref.getString(CacheConstants.tokenKey);

      final response =
          await _dio.delete("${ApiConstants.deleteBookingEndPoint}$bookingId",
              // queryParameters: {'bookingId': bookingId},
              options: Options(headers: {
                "Content-Type": 'application/json',
                "Authorization": 'Bearer $token',
              }));
      print(response);
      print("$token--------------------- $bookingId");
      return DeleteBookingResponse.fromJson(response.data);
    } catch (e) {
      throw const RemoteException('فشل فى إلغاء الحجز');
    }
  }

  @override
  Future<BookingDoctorResponse> getBookingDoctor(String token) async {
    try {
      SharedPreferences sharedPref = await SharedPreferences.getInstance();
      String? token = sharedPref.getString(CacheConstants.tokenKey);
      final response = await _dio.get("Booking/DoctorBookings",
          options: Options(headers: {
            "Content-Type": 'application/json',
            "Authorization": 'Bearer $token',
          }));
      if (response.statusCode == 200 || response.statusCode == 201) {
        return BookingDoctorResponse.fromJson(response.data);
      } else {
        throw RemoteException('فشل في تحميل الحجوزات , ${response.statusCode}');
      }
    } catch (e) {
      throw const RemoteException("فشل في تحميل الحجوزات");
    }
  }
}
