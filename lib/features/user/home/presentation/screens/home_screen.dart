import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/resources/color_manager.dart';
import 'package:graduation_project/core/resources/font_manager.dart';
import 'package:graduation_project/core/resources/styles_manager.dart';
import 'package:graduation_project/core/resources/value_manager.dart';
import 'package:graduation_project/core/widgets/home_screen_app_bar.dart';
import 'package:graduation_project/features/user/booking/presentation/screen/booking_tab.dart';
import 'package:graduation_project/features/user/chatBot/presentation/screen/chat_bot_tab.dart';
import 'package:graduation_project/features/user/home/presentation/widgets/home_tab.dart';
import 'package:graduation_project/features/user/profile/presentation/screen/profile_screen.dart';

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
    const ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          // appBar: PreferredSize(
          //   preferredSize: Size(double.infinity, Sizes.s100.h),
          //   child: const HomeScreenAppBar(),
          // ),
          body: tabs[currentIndex],

          // floatingActionButton: FloatingActionButton(
          //   onPressed: () => HomeTab(),
          //   child: const Icon(Icons.home),
          // ),

          // elevation: 5,
          // foregroundColor: ColorManager.primary,
          // backgroundColor: ColorManager.white,
          // shape: CircleBorder(),
          // splashColor: ColorManager.blue,
          // // onPressed: () => const HomeTab(),
          // child: const Icon(Icons.home),

          // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          // bottomNavigationBar: BottomAppBar(
          //   shape: CircularNotchedRectangle(),
          //   child: Container(
          //     height: 40.h,
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceAround,
          //       children: [
          //         IconButton(
          //             onPressed: () => tabs[1],
          //             icon: Icon(Icons.date_range_outlined)),
          //         IconButton(onPressed: () => tabs[2], icon: Icon(Icons.chat)),
          //         SizedBox(
          //           width: 40,
          //         ),
          //         IconButton(onPressed: () => tabs[3], icon: Icon(Icons.person)),
          //       ],
          //     ),
          //   ),
          bottomNavigationBar: BottomNavigationBar(
            selectedLabelStyle: getSemiBoldStyle(
                color: ColorManager.primary, fontSize: FontSize.s12.dg),
            selectedItemColor: ColorManager.primary,
            unselectedLabelStyle: getMediumStyle(
                color: ColorManager.grey, fontSize: FontSize.s12.dg),
            unselectedItemColor: ColorManager.grey,
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            elevation: 0,
            currentIndex: currentIndex,
            backgroundColor: Colors.transparent,
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  size: Sizes.s28,
                ),
                label: "الصفحة الرئيسية",
              ),
              // BottomNavigationBarItem(
              //     icon: Icon(Icons.local_hospital), label: "العيادات"),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.calendar_month_outlined,
                  size: Sizes.s28,
                ),
                label: "حجوزاتي",
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.chat_outlined, size: Sizes.s33),
                  label: "شات بوت"),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person,
                    size: Sizes.s28,
                  ),
                  label: "حسابي")
            ],
          ),
        ));

    // bottomNavigationBar: ClipRRect(
    //   borderRadius: const BorderRadiusDirectional.only(
    //     topStart: Radius.circular(15),
    //     topEnd: Radius.circular(15),
    //   ),
    //   child: SizedBox(
    //     height: MediaQuery.sizeOf(context).height * 0.09,
    //     child: BottomNavigationBar(
    //       currentIndex: currentIndex,
    //       onTap: (value) => changeSelectedIndex(value),
    //       backgroundColor: ColorManager.primary,
    //       type: BottomNavigationBarType.fixed,
    //       selectedItemColor: ColorManager.primary,
    //       unselectedItemColor: ColorManager.white,
    //       showSelectedLabels: false,
    //       showUnselectedLabels: false,
    //       items: const [
    //         BottomNavigationBarItem(
    //           icon: Icon(Icons.home),
    //           label: "الصفحة الرئيسية",
    //         ),
    //         // BottomNavigationBarItem(
    //         //     icon: Icon(Icons.local_hospital), label: "العيادات"),
    //         BottomNavigationBarItem(
    //           icon: Icon(Icons.calendar_month_outlined),
    //           label: "حجوزاتي",
    //         ),
    //         BottomNavigationBarItem(
    //             icon: Icon(Icons.chat), label: "شات بوت"),
    //         BottomNavigationBarItem(
    //             icon: Icon(Icons.person), label: "الحساب")
    //       ],
    //     ),
    //   ),
    // ),
    // )
  }

  // void changeSelectedIndex(int selectedIndex) =>
  //     setState(() => currentIndex = selectedIndex);
}

// class CustomBottomNavBarItem extends BottomNavigationBarItem {
//   final Icon icon;
//   final String title;

//   CustomBottomNavBarItem(this.icon, this.title)
//       : super(
//           label: title,
//           icon: Icon(
//             icon as IconData,
//             color: ColorManager.white,
//           ),
//           activeIcon: CircleAvatar(
//               radius: 12,
//               backgroundColor: ColorManager.white,
//               child: Icon(
//                 icon as IconData,
//                 color: ColorManager.primary,
//                 size: 14,
//               )),
//         );
// }
