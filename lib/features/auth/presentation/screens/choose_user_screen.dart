import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/resources/color_manager.dart';
import 'package:graduation_project/core/resources/styles_manager.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/core/widgets/custom_botton.dart';
import 'package:graduation_project/core/widgets/wave_clipper.dart';
import 'package:graduation_project/features/auth/presentation/screens/login_screen.dart';

class ChooseUserScreen extends StatefulWidget {
  const ChooseUserScreen({super.key});
  static const chooseUser = '/user';

  @override
  State<ChooseUserScreen> createState() => _ChooseUserScreenState();
}

class _ChooseUserScreenState extends State<ChooseUserScreen> {
  String? selectedRole;
  void _navigateToLogin(String role) {
    setState(() {
      selectedRole = role;
    });
    Future.delayed(const Duration(milliseconds: 600), () {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => LoginScreen(userType: role),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // Size screenSize = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "اختر نوع الحساب",
              style:
                  getBoldStyle(color: ColorManager.textColor, fontSize: 22.sp),
            ),
            SizedBox(height: 40.h),
            _buildRoleButton(
              label: "طالب",
              role: "User",
              isSelected: selectedRole == "User",
            ),
            SizedBox(height: 20.h),
            _buildRoleButton(
              label: "دكتور",
              role: "Doctor",
              isSelected: selectedRole == "Doctor",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRoleButton({
    required String label,
    required String role,
    required bool isSelected,
  }) {
    Size screenSize = MediaQuery.sizeOf(context);
    return GestureDetector(
      onTap: () => _navigateToLogin(role),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: screenSize.width * .88,
        padding: EdgeInsets.symmetric(vertical: 15.h),
        decoration: BoxDecoration(
          color: isSelected
              ? ColorManager.primary
              : ColorManager.primary.withOpacity(0.3),
          borderRadius: BorderRadius.circular(30.r),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: ColorManager.primaryColor.withOpacity(0.5),
                    blurRadius: 12,
                    spreadRadius: 2,
                  ),
                ]
              : [],
        ),
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "تسجيل الدخول كـ $label",
            style: getBoldStyle(
                color: isSelected ? ColorManager.white : ColorManager.textColor,
                fontSize: 18.sp),
          ),
        ),
      ),
    );
  }
}
