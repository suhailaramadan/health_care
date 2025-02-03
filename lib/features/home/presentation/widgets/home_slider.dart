import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/resources/font_manager.dart';
import 'package:graduation_project/core/resources/styles_manager.dart';
import 'package:graduation_project/core/resources/value_manager.dart';

class HomeSlider extends StatelessWidget {
  const HomeSlider(
      {super.key,
      required this.imagesPaths,
      required this.currentIndex,
      required this.timer});
  final List<String> imagesPaths;
  final int currentIndex;
  final Timer timer;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Insets.s16.w),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Stack(
          children: [
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 2000),
              child: Image.asset(
                height: 210.w,
                fit: BoxFit.fill,
                width: double.infinity,
                imagesPaths[currentIndex],
                key: ValueKey<int>(currentIndex),
              ),
            ),
            // ),
            Positioned(
              top: 70.w,
              right: 18.w,
              child: Text(
                "الإدارة الطبية \nشريككم في رحلة صحية\nآمنة داخل الحرم الجامعي",
                style: getBoldStyle(
                    color: Color(0xff01984A5), fontSize: FontSize.s15),
              ),
            ),
            SizedBox(
              height: 210.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: imagesPaths.map((image) {
                  final int index = imagesPaths.indexOf(image);
                  return Container(
                    width: 10.h,
                    height: 10.w,
                    margin: EdgeInsets.symmetric(
                      horizontal: 4.0.w,
                      vertical: 12.h,
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: currentIndex == index
                          ? Color(0xff01984A5)
                          : Colors.grey,
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
