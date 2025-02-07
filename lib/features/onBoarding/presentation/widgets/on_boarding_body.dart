import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/resources/color_manager.dart';
import 'package:graduation_project/core/resources/font_manager.dart';
import 'package:graduation_project/core/resources/styles_manager.dart';
import 'package:graduation_project/core/resources/value_manager.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/core/widgets/custom_botton.dart';
import 'package:graduation_project/core/widgets/custom_indicator.dart';
import 'package:graduation_project/features/onBoarding/presentation/widgets/custom_page_view.dart';

class OnBoardingBody extends StatefulWidget {
  const OnBoardingBody({super.key});

  @override
  State<OnBoardingBody> createState() => _OnBoardingBodyState();
}

class _OnBoardingBodyState extends State<OnBoardingBody> {
  PageController? pageController;
  @override
  void initState() {
    pageController = PageController(initialPage: 0)
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    pageController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
        builder: (context, orientation) => orientation == Orientation.portrait
            ? _buildPorarait()
            : _buildLandscape());
  }

  Widget _buildPorarait() {
    return Stack(
      children: [
        CustomPageView(
          pageController: pageController,
        ),
        Visibility(
          child: Positioned(
              left: 0,
              right: 0,
              bottom: 90.h,
              //isPortrait
              //     ? SizeManager.defaultSize! * 4
              //     : SizeManager.defaultSize! * 17,
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: CustomDotIndicator(
                    dotIndex: pageController!.hasClients
                        ? pageController!.page?.toInt()
                        : 0),
              )),
        ),
        Visibility(
          visible: pageController!.hasClients
              ? (pageController!.page == 2 ? false : true)
              : true,
          child: Positioned(
              top: 60.h,
              // isPortrait
              //     ? SizeManager.defaultSize! * 2
              //     : SizeManager.defaultSize! * 10,
              left: Sizes.s28,
              child: GestureDetector(
                onTap: () {
                  if (pageController!.page! < 2) {
                    pageController?.nextPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeIn);
                  }
                },
                child: Text(
                  "تخطي",
                  style: getBoldStyle(
                      color: Color(0xff2C2D3F), fontSize: Sizes.s20),
                ),
              )),
        ),
        Positioned(
          bottom: 20.h,
          left: 120.w,
          right: 120.w,
          //     //  isPortrait
          //     //     ? SizeManager.defaultSize! * 18
          //     //     : SizeManager.defaultSize! * 12,
          //     right: 120.w,
          //     // isPortrait
          //     //     ? SizeManager.defaultSize! * 18
          //     //     : SizeManager.defaultSize! * 12,
          //     bottom: 100.h,
          //     // isPortrait
          //     //     ? SizeManager.defaultSize!
          //     //     : SizeManager.defaultSize! * 10,
          //     child: GestureDetector(
          //       onTap: () {
          //         if (pageController!.page! < 3) {
          //           pageController?.nextPage(
          //               duration: Duration(milliseconds: 500),
          //               curve: Curves.easeIn);
          //         }
          //         // else {
          //         //   Get.to(() => HomeScreen(),
          //         //       transition: Transition.rightToLeft);
          //         // }
          //       },
          child: CustomButton(
            backgroundColor: Color(0xff4D9EF5),
            label: pageController!.hasClients
                ? (pageController!.page == 2 ? "ابدأ الآن" : "التالي")
                : "التالى",
            onTap: () {
              if (pageController!.page! < 2) {
                pageController?.nextPage(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeIn);
              } else {
                Navigator.of(context).pushNamed(Routes.home);
              }
            },
            // height: 50.h,
            // isPortrait ? 30 : 50,
            // size: 20,
            //  isPortrait ? 18 : 20,
            // width: SizeManager.defaultSize!,
          ),
        )
        // ),
      ],
    );
  }

  Widget _buildLandscape() {
    return Container();
  }
  //     padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 3),
  //     // child: ListView(
  //     //   // mainAxisAlignment: MainAxisAlignment.start,
  //     //   // crossAxisAlignment: CrossAxisAlignment.start,
  //     //   children: [
  //     //     // Padding(
  //     //     //   padding: const EdgeInsets.only(left: 20.0, top: 3),
  //     //     //   child: GestureDetector(
  //     //     //     onTap: () {
  //     //     //       if (pageController!.page! < 3) {
  //     //     //         pageController?.nextPage(
  //     //     //             duration: Duration(milliseconds: 500),
  //     //     //             curve: Curves.easeIn);
  //     //     //       }
  //     //     //     },
  //     //     //     child: Text(
  //     //     //       "تخطي",
  //     //     //       style: getSemiBoldStyle(
  //     //     //           color: ColorManager.black, fontSize: FontSize.s10),
  //     //     //     ),
  //     //     //   ),
  //     //     // ),
  //     //     SizedBox(
  //     //       height: 350,
  //     //       child: CustomPageView(
  //     //         pageController: pageController,
  //     //       ),
  //     //     ),

  //     //     // Padding(
  //     //     //   padding: EdgeInsets.only(left: 75.w, bottom: 10.h),
  //     //     //   child: Directionality(
  //     //     //     textDirection: TextDirection.rtl,
  //     //     //     child: CustomDotIndicator(
  //     //     //       dotIndex: pageController!.hasClients
  //     //     //           ? pageController!.page?.toInt()
  //     //     //           : 0,
  //     //     //     ),
  //     //     //   ),
  //     //     // ),

  //     //     // // زر "التالي" أو "ابدأ الآن"
  //     //     // Padding(
  //     //     //   padding: EdgeInsets.only(left: 50.w, bottom: 5.h),
  //     //     //   child: GestureDetector(
  //     //     //     onTap: () {
  //     //     //       if (pageController!.page! < 3) {
  //     //     //         pageController?.nextPage(
  //     //     //           duration: Duration(milliseconds: 500),
  //     //     //           curve: Curves.easeIn,
  //     //     //         );
  //     //     //       }
  //     //     //       //  else {
  //     //     //       //   // Get.to(
  //     //     //       //   //   () => HomeScreen(),
  //     //     //       //   //   transition: Transition.rightToLeft,
  //     //     //       //   // );
  //     //     //       // }
  //     //     //     },
  //     //     //     child: CustomButton(
  //     //     //       label: pageController!.hasClients
  //     //     //           ? (pageController!.page == 3 ? "ابدأ الآن" : "التالي")
  //     //     //           : "التالي",
  //     //     //       // height: 50.h,
  //     //     //       size: Size(50.h, 100.w),
  //     //     //       onTap: () {},
  //     //     //       // width: 100.w,
  //     //     //     ),
  //     //     //   ),
  //     //     // )
  //     //   ],
  //     // ),
  //   );
  // }
}
