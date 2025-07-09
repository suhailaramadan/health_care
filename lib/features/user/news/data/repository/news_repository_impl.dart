import 'package:graduation_project/core/error/exceptions.dart';
import 'package:graduation_project/features/user/news/data/model/news_response.dart';
import 'package:graduation_project/features/user/news/data/remote/news_remote_data_source.dart';

import 'package:graduation_project/features/user/news/domain/repository/reposirory.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: NewsRepository)
class NewsRepositoryImpl extends NewsRepository {
  final NewsRemoteDataSource remoteDataSource;
  NewsRepositoryImpl(this.remoteDataSource);
  @override
  Future<List<NewsResponse>> fetchNews() async {
    try {
      final news = remoteDataSource.getNews();
      return news;
    } catch (e) {
      throw RemoteException("فشل في تحميل الأخبار");
    }
  }
}
