import 'package:flutter/material.dart';
import 'package:graduation_project/core/resources/color_manager.dart';
import 'package:graduation_project/features/user/onBoarding/presentation/widgets/on_boarding_body.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});
  static const onBoarding = "/onBoarding";
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorManager.white,
      body: OnBoardingBody(),
    );
  }
}
