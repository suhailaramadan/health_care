import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graduation_project/core/constants.dart';
import 'package:graduation_project/core/resources/color_manager.dart';
import 'package:graduation_project/core/resources/font_manager.dart';
import 'package:graduation_project/core/resources/image_manager.dart';
import 'package:graduation_project/core/resources/styles_manager.dart';
import 'package:graduation_project/core/resources/value_manager.dart';
import 'package:graduation_project/features/user/clinic/domain/entities/clinic_entity.dart';

class ClinicItem extends StatelessWidget {
  const ClinicItem({
    super.key,
    required this.clinicEntity,
  });
  final ClinicEntity clinicEntity;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 120.w,
            width: 120.w,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: ClipOval(
              child: CachedNetworkImage(
                imageUrl:
                    "${ApiConstants.imageBaseUrl}${clinicEntity.imageUrl}",
                fit: BoxFit.fill,
                // height: 100,
                // width: 150,
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(
                    color: ColorManager.kuhly,
                  ),
                ),
                errorWidget: (context, url, error) => Image.asset(
                  "assets/images/brain_clinic.png", // حطي الصورة الافتراضية هنا
                  // height: 100.w,
                  // width: 50,
                  // width: double.infinity,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          // Container(
          //     // height: 80.h,
          //     // width: 100.w,
          //     // margin: const EdgeInsets.symmetric(horizontal: Sizes.s10),
          //     height: MediaQuery.of(context).size.width *
          //         0.10.w, // نسبة من عرض الشاشة
          //     width: MediaQuery.of(context).size.width *
          //         0.10.w, // نسبة من عرض الشاشة
          //     decoration: const BoxDecoration(
          //       shape: BoxShape.circle,
          //       color: ColorManager.blue,
          //     ),
          // child:
          // Center(
          // child:
          // SizedBox(
          //     // height: Sizes.s50.h,
          //     // width: Sizes.s50.w,
          //     child: CircleAvatar(
          //   radius: 70,
          //   backgroundImage: AssetImage(
          //     image,
          //     // ),
          //     // child: Image.asset(
          //     //   //  SvgPicture.asset(
          //     //   image,
          //     //   fit: BoxFit.contain,
          //     // width: Sizes.s40,
          //     // height: Sizes.s40,
          //     // ),
          //   ),
          //   // ),
          // )),
          // ),
          // SizedBox(height: 8.w),
          Text(
            clinicEntity.name,
            style: getMediumStyle(
                color: ColorManager.textColor, fontSize: FontSize.s15.sp),
          ),
        ],
      ),
    );
  }
}
