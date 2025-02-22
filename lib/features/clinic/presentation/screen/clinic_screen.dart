import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduation_project/core/resources/color_manager.dart';
import 'package:graduation_project/core/resources/styles_manager.dart';
import 'package:graduation_project/features/clinic/presentation/widget/custom_clinic_componant.dart';

class ClinicScreen extends StatefulWidget {
  const ClinicScreen({super.key});
  static const clinic = "/clinic";

  @override
  State<ClinicScreen> createState() => _ClinicScreenState();
}

class _ClinicScreenState extends State<ClinicScreen> {
  List<String> images = [
    "assets/images/heart_clinic.png",
    "assets/images/density_clinic.png",
    "assets/images/brain_clinic.png"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManager.white,
        appBar: AppBar(
          backgroundColor: ColorManager.white,
          title: Center(
            child: Text(
              "العيادات",
              // textAlign: TextAlign.center,
              style: getBoldStyle(color: ColorManager.textColor),
            ),
          ),
        ),
        body: Column(children: [
          SizedBox(
            height: 10.h,
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (_, index) => CustomClinicComponant(
                image: images[index],
              ),
              itemCount: images.length,
            ),
          )
        ]));
  }
}
