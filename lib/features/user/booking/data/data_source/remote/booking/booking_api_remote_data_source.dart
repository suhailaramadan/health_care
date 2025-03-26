import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/core/constants.dart';
import 'package:graduation_project/core/error/exceptions.dart';
import 'package:graduation_project/features/user/booking/data/data_source/remote/booking/booking_remote_data_source.dart';
import 'package:graduation_project/features/user/booking/data/models/booking_response.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: BookingRemoteDataSource)
class BookingApiRemoteDataSource implements BookingRemoteDataSource {
  final Dio _dio;
  const BookingApiRemoteDataSource(this._dio);
  @override
  Future<BookingResponse> getPatientBooking(String token) async {
    try {
      final response = await _dio.get(ApiConstants.bookingPatientEndPoint,
          options: Options(headers: {'Authorization': 'Bearer $token'}));
      return BookingResponse.fromJson(response.data);
    } catch (exception) {
      String? message;
      if (exception is DioException) {
        message = exception.response?.data['message'];
      }
      throw RemoteException(message ?? "تعذر تحميل حجوزاتك");
    }
  }
}
