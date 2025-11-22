import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/constants.dart';
import 'package:graduation_project/core/resources/color_manager.dart';
import 'package:graduation_project/core/resources/styles_manager.dart';
import 'package:graduation_project/core/utils/formated.dart';
import 'package:graduation_project/features/user/news/data/model/news_response.dart';

class NewsDetailsScreen extends StatelessWidget {
  static const newsDetails = '/newsDetails';
  final NewsResponse news;
  const NewsDetailsScreen({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.white,
        toolbarHeight: 100,
        centerTitle: true,
        title: Text(
          news.title ?? '',
          style: getBoldStyle(color: ColorManager.textColor, fontSize: 18),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.r),
                    topRight: Radius.circular(15.r),
                    bottomLeft: Radius.circular(15.r),
                    bottomRight: Radius.circular(15.r)),
                child: SizedBox(
                  // decoration: BoxDecoration(
                  //     border:
                  //         Border.all(width: .3, color: ColorManager.primary)),
                  // height: 200,
                  width: double.infinity,
                  child: CachedNetworkImage(
                    imageUrl: "${ApiConstants.imageBaseUrl}${news.image}",
                    // height: 200.h,
                    width: double.infinity,
                    fit: BoxFit.fill,
                    errorWidget: (context, error, stackTrace) {
                      return Container(
                        height: 180.h,
                        color: ColorManager.greyDark,
                        child: const Icon(Icons.warning_amber_rounded,
                            color: ColorManager.red, size: 50),
                      );
                    },
                    placeholder: (context, url) {
                      return const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Center(
                          child: CircularProgressIndicator(
                            color: ColorManager.primary,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: Text(news.title ?? '',
                    style: getBoldStyle(color: ColorManager.textColor)),
              ),
              const SizedBox(height: 10),
              Text(
                news.content ?? '',
                style:
                    getMediumStyle(color: ColorManager.textColor, fontSize: 15),
              ),
              const SizedBox(height: 10),
              Text(
                "تاريخ الخبر:  ${news.createdAt?.toLocal()}",
                style: getRegularStyle(color: ColorManager.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
