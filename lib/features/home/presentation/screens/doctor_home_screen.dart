import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/constants.dart';
import 'package:graduation_project/core/di/service_locator.dart';
import 'package:graduation_project/core/resources/color_manager.dart';
import 'package:graduation_project/core/resources/styles_manager.dart';
import 'package:graduation_project/features/doctors/presentation/screens/doctor_booking_screen.dart';
import 'package:graduation_project/features/doctors/presentation/screens/doctors_tab_screen.dart';
import 'package:graduation_project/features/doctors/presentation/screens/work_hours_screen.dart';
import 'package:graduation_project/features/home/presentation/widgets/home_tab.dart';
import 'package:graduation_project/features/profile/presentation/screen/doctor_profile_screen.dart';
import 'package:graduation_project/features/profile/presentation/screen/profile_screen.dart';
import 'package:graduation_project/features/user/booking/presentation/cubit/appointment/doctor_appointments_cubit.dart';

class DoctorHomeScreen extends StatefulWidget {
  const DoctorHomeScreen({super.key});
  static const doctorHome = '/doctorHome';

  @override
  State<DoctorHomeScreen> createState() => _DoctorHomeScreenState();
}

class _DoctorHomeScreenState extends State<DoctorHomeScreen> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    const HomeTab(),
    // const DoctorsTabScreen(),
    const WorksHoursScreen(),
    const DoctorAppointmentsScreen(),
    const DoctorProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.sizeOf(context);
    final bool isLandscape = screenSize.width > screenSize.height;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: _screens[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
            selectedLabelStyle: getSemiBoldStyle(
                color: ColorManager.primary,
                fontSize: isLandscape
                    ? screenSize.shortestSide * .034
                    : screenSize.shortestSide * .031),
            selectedItemColor: ColorManager.primary,
            unselectedLabelStyle: getMediumStyle(
                color: ColorManager.grey,
                fontSize: isLandscape
                    ? screenSize.shortestSide * .03
                    : screenSize.shortestSide * .029),
            unselectedItemColor: ColorManager.grey,
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            currentIndex: _currentIndex,
            onTap: (value) => setState(() {
                  _currentIndex = value;
                }),
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    color: ColorManager.primary,
                  ),
                  label: 'الصفحة الرئيسية'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.access_time,
                    color: ColorManager.primary,
                  ),
                  label: "مواعيد العمل"),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.calendar_today,
                    color: ColorManager.primary,
                  ),
                  label: "مواعيدي"),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person,
                    color: ColorManager.primary,
                  ),
                  label: "حسابي")
            ]),
      ),
    );
  }
}
