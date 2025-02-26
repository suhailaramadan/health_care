import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/resources/color_manager.dart';
import 'package:graduation_project/core/resources/font_manager.dart';
import 'package:graduation_project/core/resources/styles_manager.dart';

class ErrorIndicator extends StatelessWidget {
  final String message;
  const ErrorIndicator({super.key, this.message = "توجد مشكلة ما"});
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      message,
      style:
          getRegularStyle(color: ColorManager.red, fontSize: FontSize.s12.sp),
    ));
  }
}
