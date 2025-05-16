import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/features/user/news/presentation/cubit/news_states.dart';
import 'package:graduation_project/features/user/news/domain/repository/reposirory.dart';
import 'package:injectable/injectable.dart';

@singleton
class NewsCubit extends Cubit<NewsStates> {
  final NewsRepository newsRepository;
  NewsCubit(this.newsRepository) : super(NewsInitial());
  Future<void> getNews() async {
    emit(NewsLoading());
    try {
      final newsList = await newsRepository.fetchNews();
      emit(NewsSuccess(newsList));
    } catch (e) {
      emit(NewsError(e.toString()));
    }
  }
}
