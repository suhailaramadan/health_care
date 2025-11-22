import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/constants.dart';
import 'package:graduation_project/core/resources/color_manager.dart';
import 'package:graduation_project/core/resources/font_manager.dart';
import 'package:graduation_project/core/resources/styles_manager.dart';
import 'package:graduation_project/features/user/news/data/model/news_response.dart';

class NewsCard extends StatelessWidget {
  final NewsResponse news;
  final VoidCallback onTap;

  const NewsCard({
    Key? key,
    required this.news,
    required this.onTap,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        surfaceTintColor: ColorManager.white,
        color: ColorManager.white,
        margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.r),
                topRight: Radius.circular(15.r),
              ),
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
            Padding(
              padding: EdgeInsets.all(12.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    news.title ?? '',
                    style: getBoldStyle(
                      color: ColorManager.primary,
                      fontSize: FontSize.s18.sp,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    news.content!.length > 100
                        ? "${news.content?.substring(0, 100)}..."
                        : news.content ?? '',
                    style: getRegularStyle(
                      color: ColorManager.textColor,
                      fontSize: FontSize.s16.sp,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 8.h),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: onTap,
                      child: Text(
                        "عرض المزيد",
                        style: getMediumStyle(
                          color: ColorManager.primary,
                          fontSize: FontSize.s14.sp,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
