import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDotIndicator extends StatelessWidget {
  const CustomDotIndicator({super.key, required this.dotIndex});
  final int? dotIndex;
  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      position: dotIndex ?? 0,
      dotsCount: 3,
      decorator: DotsDecorator(
          size: Size(12.r, 25.r),
          activeColor: Color.fromARGB(224, 22, 112, 139),
          activeSize: Size(12.r, 25.r)),
    );
  }
}
