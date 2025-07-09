import 'package:dio/dio.dart';
import 'package:graduation_project/core/error/exceptions.dart';
import 'package:graduation_project/features/user/news/data/model/news_response.dart';
import 'package:graduation_project/features/user/news/data/remote/news_remote_data_source.dart';
import 'package:graduation_project/features/user/news/presentation/widgets/news_details_screen.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: NewsRemoteDataSource)
class NewsApiRemoteDataSource extends NewsRemoteDataSource {
  final Dio dio;
  NewsApiRemoteDataSource(this.dio);
  @override
  Future<List<NewsResponse>> getNews() async {
    final response = await dio.get("NewsPost");
    if (response.statusCode == 200) {
      List<dynamic> data = response.data;
      return data.map((news) => NewsResponse.fromJson(news)).toList();
    } else {
      throw const RemoteException("فشل في تحميل الأخبار");
    }
  }
}
