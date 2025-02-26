import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/resources/color_manager.dart';
import 'package:graduation_project/core/resources/font_manager.dart';
import 'package:graduation_project/core/resources/image_manager.dart';
import 'package:graduation_project/core/resources/styles_manager.dart';
import 'package:graduation_project/core/resources/value_manager.dart';

class HomeScreenAppBar extends StatelessWidget {
// implements PreferredSizeWidget {
  final bool? automaticallyImplyLeading;
  const HomeScreenAppBar({this.automaticallyImplyLeading});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.all(0),
        child: AppBar(
            backgroundColor: ColorManager.white,
            surfaceTintColor: ColorManager.transparent,
            automaticallyImplyLeading: automaticallyImplyLeading ?? false,
            actions: [
              const SizedBox(
                width: 10,
              ),
              // Directionality(
              //     textDirection: TextDirection.rtl,
              //     child: Row(
              //       children: ['
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: CircleAvatar(
                    radius: Sizes.s40,
                    backgroundColor: ColorManager.transparent,
                    // backgroundImage: AssetImage(ImageManager.profile)
                    child: Image.asset("assets/images/profile.avif",
                        fit: BoxFit.cover)),
              ),

              const SizedBox(
                width: Sizes.s12,
              ),
              Text(
                "أهلاً سهيله",
                style: getSemiBoldStyle(
                    color: ColorManager.textColor, fontSize: FontSize.s15.sp),
              ),
              // const Icon(
              //   Icons.waving_hand,
              //   color: Colors.amber,
              // ),
              const Spacer(),

              IconButton(
                  onPressed: () {},
                  icon: Badge.count(
                    count: 10,
                    child: const Icon(
                      Icons.notifications_none,
                      // color: ColorManager.white,
                      size: Sizes.s28,
                    ),
                  )),
              const SizedBox(
                width: 10,
              )
              // ]
              //   ],
              // ))
            ]),
        // ),
      ),
    );
  }
}
