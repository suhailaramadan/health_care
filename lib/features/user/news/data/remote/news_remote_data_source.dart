import 'package:graduation_project/features/user/news/news_response/news_response.dart';

abstract class NewsRemoteDataSource {
  Future<List<NewsResponse>> getNews();
}
