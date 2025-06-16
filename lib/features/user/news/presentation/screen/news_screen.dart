import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/resources/color_manager.dart';
import 'package:graduation_project/core/resources/styles_manager.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/features/user/news/news_response/news_response.dart';
import 'package:graduation_project/features/user/news/presentation/cubit/news_cubit.dart';
import 'package:graduation_project/features/user/news/presentation/cubit/news_states.dart';
import 'package:graduation_project/features/user/news/presentation/widgets/news_card.dart';
import 'package:graduation_project/features/user/news/presentation/widgets/news_details_screen.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});
  static const newsScreen = '/newsScreen';

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<NewsCubit>().getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'أخبار الإدارة الطبية',
          style: getBoldStyle(color: ColorManager.textColor),
        ),
      ),
      body: BlocBuilder<NewsCubit, NewsStates>(
        builder: (context, state) {
          if (state is NewsLoading) {
            return const Center(
                child: CircularProgressIndicator(
              color: ColorManager.primary,
            ));
          } else if (state is NewsSuccess && state.news.isNotEmpty) {
            final newsList = state.news;
            return ListView.builder(
              itemCount: newsList.length,
              itemBuilder: (context, index) {
                return NewsCard(
                  news: newsList[index],
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      Routes.newsDetails,
                      arguments: newsList[index],
                    );
                  },
                );
              },
            );
          } else if (state is NewsError) {
            return Center(child: Text(state.message));
          } else if (state is NewsSuccess && state.news.isEmpty) {
            return Center(
              child: Text(
                "لا يوجد أخبار",
                style: getSemiBoldStyle(color: ColorManager.kuhly),
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
