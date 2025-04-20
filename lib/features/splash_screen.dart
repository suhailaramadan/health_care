// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:graduation_project/core/resources/color_manager.dart';
// import 'package:graduation_project/core/resources/font_manager.dart';
// import 'package:graduation_project/core/resources/styles_manager.dart';
// import 'package:graduation_project/core/routes/routes.dart';

// class SplashScreen extends StatefulWidget {
//   static const splashScreen = "/splash";
//   const SplashScreen({super.key});

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _fadeAnimation;
//   late Animation<Offset> _slideAnimation;
//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//         vsync: this, duration: const Duration(milliseconds: 1200));
//     _slideAnimation =
//         Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero).animate(
//             CurvedAnimation(parent: _controller, curve: Curves.bounceInOut));
//     _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
//         CurvedAnimation(parent: _controller, curve: Curves.easeInBack));
//     _controller.forward();
//     Future.delayed(const Duration(seconds: 10), () {
//       Navigator.pushReplacementNamed(context, Routes.onBoarding);
//     });
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: ColorManager.white,
//       body: Center(
//         child: FadeTransition(
//           opacity: _fadeAnimation,
//           child: SlideTransition(
//             position: _slideAnimation,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Image.asset(
//                   "assets/images/Pica-enhance-20250124112547 (2).png",
//                   height: 200.w,
//                   width: 200.w,
//                   fit: BoxFit.contain,
//                 ),
//                 Text(
//                   "الإدارة الطبية",
//                   style: getBoldStyle(
//                       color: ColorManager.primary, fontSize: FontSize.s24.sp),
//                   textAlign: TextAlign.center,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/resources/color_manager.dart';
import 'package:graduation_project/core/resources/font_manager.dart';
import 'package:graduation_project/core/resources/styles_manager.dart';
import 'package:graduation_project/core/routes/routes.dart';

class SplashScreen extends StatefulWidget {
  static const splashScreen = "/splash";

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.2).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOutBack),
    );

    _controller.forward();

    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushReplacementNamed(context, Routes.onBoarding);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: ScaleTransition(
            scale: _scaleAnimation,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  "assets/images/logo.png",
                  height: 130.w,
                  width: 130.w,
                ),
                SizedBox(height: 10.h),
                ShaderMask(
                  shaderCallback: (bounds) => const LinearGradient(colors: [
                    ColorManager.primary,
                    ColorManager.primaryColor,
                    Color.fromARGB(255, 143, 209, 244)
                  ], begin: Alignment.topRight, end: Alignment.bottomLeft)
                      .createShader(
                          Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
                  child: Text(
                    "الإدارة الطبية",
                    style:
                        getBoldStyle(color: ColorManager.white, fontSize: 26),
                  ),
                ),
                Text(
                  "جامعة طنطا",
                  style:
                      getBoldStyle(color: ColorManager.primary, fontSize: 10),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
