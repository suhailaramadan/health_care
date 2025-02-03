import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/resources/color_manager.dart';
import 'package:graduation_project/core/resources/font_manager.dart';
import 'package:graduation_project/core/resources/styles_manager.dart';
import 'package:graduation_project/core/resources/value_manager.dart';
import 'package:graduation_project/core/widgets/home_screen_app_bar.dart';
import 'package:graduation_project/features/booking/presentation/screen/booking_tab.dart';
import 'package:graduation_project/features/chatBot/presentation/screen/chat_bot_tab.dart';
import 'package:graduation_project/features/home/presentation/widgets/home_tab.dart';
import 'package:graduation_project/features/profile/presentation/screen/profile_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const home = "/home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<Widget> tabs = [
    const HomeTab(),
    const BookingTab(),
    const ChatBotTab(),
    const ProfileTab()
  ];
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(double.infinity, Sizes.s100.h),
          child: const HomeScreenAppBar(),
        ),
        body: tabs[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          selectedLabelStyle:
              getMediumStyle(color: Color(0xff01984A5), fontSize: FontSize.s14),
          selectedItemColor: Color(0xff01984A5),
          unselectedLabelStyle:
              getMediumStyle(color: ColorManager.grey, fontSize: FontSize.s12),
          unselectedItemColor: ColorManager.grey,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          currentIndex: currentIndex,
          backgroundColor: ColorManager.white,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_sharp), label: "الصفحة الرئيسية"),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month_outlined),
              label: "حجوزاتي",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.chat), label: "شات بوت"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "الحساب")
          ],
        ),
      ),
    );
  }
}
