import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/core/resources/color_manager.dart';

class DoctorHomeScreen extends StatelessWidget {
  const DoctorHomeScreen({super.key});
  static const doctorHome = '/doctorHome';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorManager.babyPink,
    );
  }
}
