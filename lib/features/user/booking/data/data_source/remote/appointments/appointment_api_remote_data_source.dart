import 'package:dio/dio.dart';
import 'package:graduation_project/core/constants.dart';
import 'package:graduation_project/core/error/exceptions.dart';
import 'package:graduation_project/features/user/booking/data/data_source/remote/appointments/appointment_remote_data_source.dart';
import 'package:graduation_project/features/user/booking/data/models/appointment_by_doctor_id_response/appointment_by_doctor_id_response.dart';

import 'package:injectable/injectable.dart';

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
