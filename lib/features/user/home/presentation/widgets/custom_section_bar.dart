import 'package:flutter/cupertino.dart';
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
    return Padding(
      padding: EdgeInsets.only(right: Insets.s14.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: getSemiBoldStyle(
              fontSize: FontSize.s16,
              color: ColorManager.textColor,
            ),
          ),
          TextButton(
            onPressed: onViewAllClicked,
            child: Text(
              "عرض المزيد...",
              style: getMediumStyle(
                  color: Colors.blueGrey, fontSize: FontSize.s13),
            ),
          ),
        ],
      ),
    );
  }
}
