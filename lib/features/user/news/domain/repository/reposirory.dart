import 'package:graduation_project/features/user/news/data/model/news_response.dart';

abstract class NewsRepository {
  Future<List<NewsResponse>> fetchNews();
}
