import 'package:flutter/material.dart';
import 'package:graduation_project/core/resources/color_manager.dart';
import 'package:graduation_project/core/resources/styles_manager.dart';
import 'package:graduation_project/core/utils/formated.dart';

import 'package:graduation_project/features/user/news/news_response/news_response.dart';

class NewsDetailsScreen extends StatelessWidget {
  static const newsDetails = '/newsDetails';
  final NewsResponse news;
  const NewsDetailsScreen({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        centerTitle: true,
        title: Text(
          news.title ?? '',
          style: getBoldStyle(color: ColorManager.textColor, fontSize: 18),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  height: 200,
                  width: double.infinity,
                  child: Image.network(
                      fit: BoxFit.cover,
                      "https://myclinicapp.runasp.net${news.image}")),
              const SizedBox(height: 10),
              Center(
                child: Text(news.title ?? '',
                    style: getBoldStyle(color: ColorManager.textColor)),
              ),
              const SizedBox(height: 10),
              Text(
                news.content ?? '',
                style: getRegularStyle(color: ColorManager.textColor),
              ),
              const SizedBox(height: 10),
              Text(
                "تاريخ الخبر: ${news.createdAt?.toLocal()}",
                style: getRegularStyle(color: ColorManager.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
