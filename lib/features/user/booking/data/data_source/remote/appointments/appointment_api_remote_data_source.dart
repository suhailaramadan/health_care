import 'package:dio/dio.dart';
import 'package:graduation_project/core/constants.dart';
import 'package:graduation_project/core/error/exceptions.dart';
import 'package:graduation_project/features/user/booking/data/data_source/remote/appointments/appointment_remote_data_source.dart';
import 'package:graduation_project/features/user/booking/data/models/appointment_by_doctor_id_response/appointment_by_doctor_id_response.dart';
import 'package:graduation_project/features/user/booking/data/models/doctors_appointment_response/create_request_model.dart';
import 'package:graduation_project/features/user/booking/data/models/doctors_appointment_response/doctors_appointment_model.dart';
import 'package:graduation_project/features/user/booking/data/models/doctors_appointment_response/update_appointment_request.dart';
import 'package:graduation_project/features/user/booking/domain/entities/delete_booking_entity.dart';

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Singleton(as: AppointmentRemoteDataSource)
class AppointmentApiRemoteDataSource extends AppointmentRemoteDataSource {
  final Dio _dio;
  AppointmentApiRemoteDataSource(this._dio);

  @override
  Future<AppointmentByDoctorIdResponse> getAppointmentDoctorById(
      String doctorId) async {
    try {
      final response = await _dio.get(
        "https://myclinicapp.runasp.net/api/Appointment/AvailableSlots",
        queryParameters: {"doctorId": doctorId},
      );
      if (response.statusCode == 200) {
        return AppointmentByDoctorIdResponse.fromJson(response.data);
      } else {
        throw RemoteException("Unexpected response: ${response.statusCode}");
      }
    } catch (exception) {
      String? message;
      if (exception is DioException) {
        message = exception.response?.data['message'];
      }
      throw const RemoteException("حدث خطأغير متوقع");
    }
  }

  @override
  Future<List<DoctorsAppointmentModel>> getDotorsAppointment() async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    String? token = sharedPref.getString(CacheConstants.tokenKey);
    if (token == null) {
      throw const RemoteException("لا يوجد رمز توثيق");
    }
    final response = await _dio.get("Appointment/DoctorAppointments",
        options: Options(headers: {
          "Content-Type": 'application/json',
          "Authorization": 'Bearer $token',
        }));
    if (response.statusCode == 200) {
      final List data = response.data['data'];
      return data.map((e) => DoctorsAppointmentModel.fromJson(e)).toList();
    } else {
      throw RemoteException(response.data['message'] ?? 'حدث خطأ ما');
    }
  }

  @override
  Future<DoctorsAppointmentModel> createAppointment(
      CreateRequestModel request, String token) async {
    final response = await _dio.post("Appointment",
        data: request.toJson(),
        options: Options(headers: {
          "Content-Type": 'application/json',
          "Authorization": 'Bearer $token',
        }));
    if (response.data['success'] == true) {
      return DoctorsAppointmentModel.fromJson(response.data['data']);
    } else {
      throw RemoteException(response.data['message']);
    }
  }

  @override
  Future<DeleteBookingEntity> deleteappointment(int id) async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    String? token = sharedPref.getString(CacheConstants.tokenKey);
    if (token == null) {
      throw const RemoteException("لا يوجد رمز توثيق");
    }
    final response = await _dio.delete("Appointment/$id",
        options: Options(headers: {
          "Content-Type": 'application/json',
          "Authorization": 'Bearer $token',
        }));
    if (response.statusCode == 200) {
      return DeleteBookingEntity.fromJson(response.data);
    } else {
      throw RemoteException(response.data['message'] ?? 'فشل في حذف الموعد');
    }
  }

  @override
  Future<DoctorsAppointmentModel> updateAppointment(
      UpdateAppointmentRequest updateAppointmentRequest) async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    String? token = sharedPref.getString(CacheConstants.tokenKey);
    if (token == null) {
      throw const RemoteException("لا يوجد رمز توثيق");
    }
    final response =
        await _dio.put("Appointment/${updateAppointmentRequest.id}",
            data: updateAppointmentRequest.toJson(),
            options: Options(headers: {
              "Content-Type": 'application/json',
              "Authorization": 'Bearer $token',
            }));
    if (response.statusCode == 200 && response.data['success'] == true) {
      return DoctorsAppointmentModel.fromJson(response.data['data']);
    } else {
      throw RemoteException(
          response.data['message'] ?? 'حدث خطأ أثناء التعديل');
    }
  }
}

//   @override
//   Future<AppointmentByDoctorIdResponse> getAppointmentDoctorById(
//       String doctorId) async {
//     print("🔵 Calling API with doctorId: $doctorId");
//     try {
//       final response = await _dio.get(
//         "https://myclinicapp.runasp.net/api/Appointment/AvailableSlots",
//         queryParameters: {"doctorId": doctorId},
//       );
//       print("🟢 API Response Data: ${response.data}");
//       print("🟢 API Response Received! Status Code: ${response.statusCode}");

//       if (response.statusCode == 200) {
//         print("API Apppointment Response: ${response.data}");
//         return AppointmentByDoctorIdResponse.fromJson(response.data);
//       } else {
//         throw RemoteException("Unexpected response: ${response.statusCode}");
//       }
//     } on DioException catch (exception) {
//       // ✅ تمرير رسالة الخطأ الفعلية إذا كانت متاحة
//       print("🔴 API Error: ${exception.response?.data}");
//       final errorMessage = exception.response?.data['message'] ??
//           "حدث خطأ أثناء الاتصال بالخادم، يرجى المحاولة لاحقًا.";
//       throw RemoteException(errorMessage);
//     } catch (exception) {
//       print("🔴 API Unexpected Error: $exception"); // ✅ طباعة تفاصيل الخطأ
//       // print(
//       //     "🟡 Stacktrace: $stacktrace"); // ✅ طباعة `stacktrace` لمعرفة مكان ال
//       throw RemoteException("حدث خطأ غير متوقع: ${exception.toString()}");
//     }
//   }
// }
