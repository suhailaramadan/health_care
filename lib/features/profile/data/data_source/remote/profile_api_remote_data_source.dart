import 'package:dio/dio.dart';
import 'package:graduation_project/core/constants.dart';
import 'package:graduation_project/core/error/exceptions.dart';
import 'package:graduation_project/features/profile/data/data_source/remote/profile_remote_data_source.dart';
import 'package:graduation_project/features/profile/data/model/profile_response/profile_response.dart';
import 'package:graduation_project/features/profile/domain/entities/profile_entity.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: ProfileRemoteDataSource)
class ProfileApiRemoteDataSource extends ProfileRemoteDataSource {
  final Dio dio;
  ProfileApiRemoteDataSource(this.dio);

  @override
  Future<ProfileResponse> getPatientProfile(String token) async {
    try {
      final response = await dio.get("${ApiConstants.baseUrl}Patient",
          options: Options(headers: {'Authorization': 'Bearer $token'}));
      return ProfileResponse.fromJson(response.data);
    } catch (exception) {
      String? message;
      if (exception is DioException) {
        message = exception.response?.data['message'];
      }
      throw RemoteException(message ?? 'تعذر تحميل بيانات المستخدم');
    }
  }
}
