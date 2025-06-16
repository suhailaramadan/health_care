import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/resources/color_manager.dart';
import 'package:graduation_project/core/resources/font_manager.dart';
import 'package:graduation_project/core/resources/styles_manager.dart';
import 'package:graduation_project/core/resources/value_manager.dart';

class CustomSectionBar extends StatelessWidget {
  const CustomSectionBar(
      {super.key, this.onViewAllClicked, required this.text});
  final String text;
  final void Function()? onViewAllClicked;
  @override
  Widget build(BuildContext context) {
    // final Size screenSize = MediaQuery.sizeOf(context);
    // final bool isLargeTablet =
    //     screenSize.width > 600 && screenSize.width < screenSize.height;

    // final bool isLandscape =
    //     screenSize.width > screenSize.height || isLargeTablet;
    final Size screenSize = MediaQuery.sizeOf(context);
    // final bool isLargeTablet =
    //     screenSize.width > 600 && screenSize.width < screenSize.height;
    // final bool isSmallScreen = screenSize.width <= 400;
    // final bool isMediumScreen =
    //     screenSize.width >= 600 && screenSize.width <= 800;
    // final isLargeScreen = screenSize.width > 800;
    final bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    //     screenSize.width > screenSize.height || isLargeTablet;
    double getResponsiveFontSize() {
      if (isLandscape) {
        if (screenSize.width < 600) {
          return 15.sp;
        } else if (screenSize.width < 900) {
          return 16.sp;
        } else {
          return 24.sp;
        }
      } else {
        if (screenSize.width < 360) {
          return 12.sp;
        } else if (screenSize.width < 600) {
          return 16.sp;
        } else if (screenSize.width < 900) {
          return 20.sp;
        } else {
          return 24.sp;
        }
      }
    }

    return Padding(
      padding: EdgeInsets.only(right: Insets.s14.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: getBoldStyle(
              fontSize: getResponsiveFontSize(),
              // isLandscape
              //     ? 40.w
              //     : isLargeTablet
              //         ? 33.h
              //         : 16.h,
              color: ColorManager.textColor,
            ),
          ),
          TextButton(
            onPressed: onViewAllClicked,
            child: Text(
              "عرض المزيد...",
              style: getMediumStyle(
                  color: Colors.blueGrey, fontSize: getResponsiveFontSize()
                  //  isLandscape
                  //     ? 30.w
                  //     : isLargeTablet
                  //         ? 33.h
                  //         : 15.h,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
