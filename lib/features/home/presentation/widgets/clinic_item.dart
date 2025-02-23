import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graduation_project/core/resources/color_manager.dart';
import 'package:graduation_project/core/resources/font_manager.dart';
import 'package:graduation_project/core/resources/styles_manager.dart';
import 'package:graduation_project/core/resources/value_manager.dart';

class ClinicItem extends StatelessWidget {
  const ClinicItem({
    super.key,
    required this.image,
    required this.name,
  });
  final String image;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisSize: MainAxisSize.min,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10.r),
          child: Container(
            height: 100.h,
            width: 100.w,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Image.asset(
              image,
              // fit: BoxFit.cover,ذ
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
        SizedBox(height: 8.w),
        Text(
          name,
          style: getMediumStyle(
              color: ColorManager.textColor, fontSize: FontSize.s10),
        ),
      ],
    );
  }
}
