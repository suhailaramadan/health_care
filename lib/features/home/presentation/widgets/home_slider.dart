import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/resources/color_manager.dart';
import 'package:graduation_project/core/resources/font_manager.dart';
import 'package:graduation_project/core/resources/styles_manager.dart';
import 'package:graduation_project/core/resources/value_manager.dart';

class HomeSlider extends StatelessWidget {
  const HomeSlider(
      {super.key,
      required this.imagesPaths,
      required this.currentIndex,
      required this.timer,
      required this.text});
  final List<String> imagesPaths;
  final int currentIndex;
  final Timer timer;
  final String text;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.sizeOf(context);
    final bool isLandscape = screenSize.width > screenSize.height;
    // ignore: deprecated_member_use
    final double textScaleFactor = MediaQuery.of(context).textScaleFactor;
    final double minSize = min(screenSize.width, screenSize.height);
    return SizedBox(
      height: isLandscape ? screenSize.width * .28 : screenSize.height * .25,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15.r),
          child: Stack(
            children: [
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 2000),
                child: Image.asset(
                  height: isLandscape
                      ? screenSize.width * .3
                      : screenSize.height * .3,
                  fit: BoxFit.fill,
                  width: screenSize.width,
                  imagesPaths[currentIndex],
                  key: ValueKey<int>(currentIndex),
                ),
              ),
              // ),
              Positioned(
                // top: 65.w,
                top: isLandscape
                    ? screenSize.width * .069
                    : screenSize.height * .09,
                right: isLandscape
                    ? screenSize.width * .03
                    : screenSize.height * .02,
                child: Text(
                  text,
                  // "الإدارة الطبية\nشريككم في رحلة صحية\nآمنة داخل الحرم الجامعي",
                  style: getSemiBoldStyle(
                    color: const Color.fromARGB(255, 79, 133, 191),
                    // color: ColorManager.kuhly,
                    // color: Color.fromARGB(239, 26, 101, 123),
                    fontSize: isLandscape
                        ? min(35, screenSize.shortestSide * 0.06)
                        : min(22, screenSize.shortestSide * 0.035),
                  ),
                ),
              ),
              SizedBox(
                height: screenSize.height * 7,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: imagesPaths.map((image) {
                    final int index = imagesPaths.indexOf(image);
                    return Container(
                      width: 10,
                      height: 10,
                      margin: EdgeInsets.symmetric(
                        horizontal: 4.0.w,
                        vertical: 12.h,
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: currentIndex == index
                            ? ColorManager.primary
                            // ? Color.fromARGB(239, 26, 101, 123)
                            : Colors.grey,
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
