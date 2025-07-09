import 'package:graduation_project/features/user/news/data/model/news_response.dart';

abstract class NewsStates {}

class NewsInitial extends NewsStates {}

class NewsLoading extends NewsStates {}

class NewsSuccess extends NewsStates {
  final List<NewsResponse> news;
  NewsSuccess(this.news);
}

class NewsError extends NewsStates {
  final String message;
  NewsError(this.message);
}
