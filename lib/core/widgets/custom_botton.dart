import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/resources/color_manager.dart';
import 'package:graduation_project/core/resources/font_manager.dart';
import 'package:graduation_project/core/resources/styles_manager.dart';

class CustomButton extends StatelessWidget {
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String label;
  final Color? backgroundColor;
  final double? radius;
  final void Function() onTap;
  final TextStyle? textStyle;
  final bool isStadiumBorder;
  final Size? size;

  const CustomButton({
    this.prefixIcon,
    this.size,
    this.textStyle,
    this.isStadiumBorder = true,
    this.backgroundColor,
    this.radius,
    this.suffixIcon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        maximumSize: size,
        backgroundColor: backgroundColor ?? Color.fromARGB(223, 24, 133, 167),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        // padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 14.h)
        // isStadiumBorder
        // /?
        // RoundedRectangleBorder(
        //     borderRadius: BorderRadius.all(Radius.circular(8))),
        // : StadiumBorder()

        // padding:Padding(
        //     EdgeInsets.symmetric(horizontal: 10.w, vertical: 14.h)),
      ),
      // style:
      // // // ElevatedButton.styleFrom(
      // //   minimumSize: size,
      // //   shape: isStadiumBorder
      // //       ? const StadiumBorder()
      // //       : RoundedRectangleBorder(
      // //           borderRadius: BorderRadius.circular(17.r),
      // //         ),

      //   backgroundColor: backgroundColor ?? ColorManager.primary,
      //   padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 14.h),
      // ),
      onPressed: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          prefixIcon ?? const SizedBox(),
          SizedBox(
            width: 24.w,
          ),
          Text(
            label,
            style: textStyle ??
                getMediumStyle(color: ColorManager.white)
                    .copyWith(fontSize: FontSize.s20),
          ),
          SizedBox(
            width: 27.w,
          ),
          suffixIcon ?? const SizedBox(),
        ],
      ),
    );
  }
}
