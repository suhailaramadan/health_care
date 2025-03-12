import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graduation_project/core/resources/font_manager.dart';
import 'package:graduation_project/core/resources/styles_manager.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
    required this.image,
    required this.text,
    // required this.subtext
  });
  final String image;
  final String text;
  // final String subtext;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
            height: 350.h, width: double.infinity, child: Image.asset(image)),
        // 350.h
        // SvgPicture.asset(
        //   image,
        //   width: MediaQuery.of(context).size.width,
        //   // height: MediaQuery.of(context).size.height,
        // ),
        SizedBox(
          height: 8.h,
        ),
        SizedBox(
          height: 100.h,
          child: Text(
              textAlign: TextAlign.center,
              text,
              style: getBoldStyle(
                  color: const Color(0xff2C2D3F), fontSize: FontSize.s22)),
        ),
        // Text(
        //     textAlign: TextAlign.center,
        //     subtext,
        //     style: getSemiBoldStyle(
        //         color: Color.fromARGB(224, 22, 112, 139),
        //         fontSize: FontSize.s24)),
      ],
    );
  }
}
