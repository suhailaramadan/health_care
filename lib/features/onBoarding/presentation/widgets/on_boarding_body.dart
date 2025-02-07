import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    return Stack(
      children: [
        CustomPageView(
          pageController: pageController,
        ),
        Visibility(
          child: Positioned(
              left: 0,
              right: 0,
              bottom: 100.w,
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
              top: 80.h,
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
                      color: Color(0xff2C2D3F),
                      // Color.fromARGB(223, 21, 119, 149),
                      fontSize: Sizes.s20),
                ),
              )),
        ),
        Positioned(
          bottom: 30,
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
            // Color.fromARGB(223, 26, 147, 184),
            label: pageController!.hasClients
                ? (pageController!.page == 2 ? "ابدأ الآن" : "التالي")
                : "التالى",
            onTap: () {
              if (pageController!.page! < 2) {
                pageController?.nextPage(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeIn);
              } else {
                Navigator.of(context).pushNamed(Routes.register);
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
}
