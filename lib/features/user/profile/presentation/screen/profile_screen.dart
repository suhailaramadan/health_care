import 'package:flutter/material.dart';
import 'package:graduation_project/core/resources/color_manager.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/core/widgets/custom_botton.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  static const profile = "/profile";
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          appBar: AppBar(
            title: const Text("حسابي"),
            centerTitle: true,
            backgroundColor: ColorManager.primary,
          ),
          body: CustomButton(
            onTap: () =>
                Navigator.of(context).pushReplacementNamed(Routes.register),
            label: 'log out',
          )),
    );
  }
}
