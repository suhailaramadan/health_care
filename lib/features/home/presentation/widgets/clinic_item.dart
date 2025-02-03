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
      children: [
        Container(
            height: 100.h,
            width: 90.w,
            margin: const EdgeInsets.symmetric(horizontal: Sizes.s10),
            decoration: const BoxDecoration(
              shape: BoxShape.rectangle,
              color: ColorManager.blue,
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            child: Center(
              child: SizedBox(
                height: Sizes.s50,
                width: Sizes.s40,
                child: SvgPicture.asset(
                  image,
                  // width: Sizes.s40,
                  // height: Sizes.s40,
                ),
              ),
            )),
        // ),
        SizedBox(height: 8.h),
        Text(
          name,
          style:
              getMediumStyle(color: ColorManager.kuhly, fontSize: FontSize.s18),
        ),
      ],
    );
  }
}
