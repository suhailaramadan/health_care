import 'package:dio/dio.dart';
import 'package:graduation_project/core/constants.dart';
import 'package:graduation_project/core/error/exceptions.dart';
import 'package:graduation_project/core/error/failure.dart';
import 'package:graduation_project/features/feedback/data/data_source/remote/feedback_remote_data_source.dart';
import 'package:graduation_project/features/feedback/data/model/feedback_get_response/feedback_get_response.dart';
import 'package:graduation_project/features/feedback/domain/entites/feedback_entity.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Singleton(as: FeedbackRemoteDataSource)
class FeedbackApiRemoteDataSource extends FeedbackRemoteDataSource {
  final Dio dio;
  FeedbackApiRemoteDataSource(this.dio);
  @override
  Future<FeedbackGetResponse> sendFeedBack(FeedbackEntity entity) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(CacheConstants.tokenKey);
    try {
      final response = await dio.post("Feedback",
          data: entity.toJson(),
          options: Options(headers: {'Authorization': 'Bearer $token'}));
      if (response.statusCode == 200) {
        return FeedbackGetResponse.fromJson(response.data);
      } else {
        throw Failure(response.data['message'] ?? 'حدث خطأ ما');
      }
    } catch (e) {
      throw RemoteException("فشل في إضافة التشخيص : $e");
    }
  }
}
