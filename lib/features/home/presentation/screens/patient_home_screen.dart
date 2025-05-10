import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/resources/color_manager.dart';
import 'package:graduation_project/core/resources/font_manager.dart';
import 'package:graduation_project/core/resources/styles_manager.dart';
import 'package:graduation_project/core/resources/value_manager.dart';
import 'package:graduation_project/core/widgets/home_screen_app_bar.dart';
import 'package:graduation_project/features/medical_record/presentation/screens/patient_medical_record_screen.dart';
import 'package:graduation_project/features/user/booking/presentation/screen/booking_screen.dart';
import 'package:graduation_project/features/user/chatBot/presentation/screen/chat_bot_tab.dart';
import 'package:graduation_project/features/home/presentation/widgets/home_tab.dart';
import 'package:graduation_project/features/profile/presentation/screen/profile_screen.dart';

class PatientHomeScreen extends StatefulWidget {
  const PatientHomeScreen({super.key});
  static const patientHome = "/patientHome";

  @override
  State<PatientHomeScreen> createState() => _PatientHomeScreenState();
}

class _PatientHomeScreenState extends State<PatientHomeScreen> {
  int currentIndex = 0;
  List<Widget> tabs = [
    const HomeTab(),
    const BookingTab(),
    // const ChatBotTab(),
    const PatientMedicalRecordScreen(),
    const ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.sizeOf(context);
    final bool isLandscape = screenSize.width > screenSize.height;
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
          bottomNavigationBar:
              // Stack(
              //     clipBehavior:
              //         Clip.none, // علشان مايقطعش الأجزاء الخارجة من الشاشة
              //     children: [
              //       Positioned(
              //           bottom: 0,
              //           left: 0,
              //           right: 0,
              //           child: Container(
              //             height: 80, // ارتفاع الخلفية اللي تحت البار
              //             decoration: BoxDecoration(
              //               // color: Colors
              //               // .amber, // لون الخلفية السفلى للـ BottomNavigationBar
              //               borderRadius: BorderRadius.only(
              //                 topLeft: Radius.circular(30.r),
              //                 topRight: Radius.circular(30.r),
              //               ),
              //             ),
              //           )), // decoration: BoxDecoration(
              //       //   color: Colors.white,
              //       //   borderRadius: BorderRadius.only(
              //       //     topLeft: Radius.circular(isLandscape ? 30.r : 20.r),
              //       //     topRight: Radius.circular(isLandscape ? 30.r : 20.r),
              //       //   ),
              //       //   boxShadow: [
              //       //     BoxShadow(
              //       //       color: Colors.black.withOpacity(0.1),
              //       //       blurRadius: 10,
              //       //     ),
              //       // ],
              //       // ),
              //       // child:
              BottomNavigationBar(
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
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            elevation: 0,
            currentIndex: currentIndex,
            // backgroundColor: ColorManager.blue,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home,
                    size: isLandscape
                        ? screenSize.shortestSide * .07
                        : screenSize.shortestSide * .07),
                label: "الصفحة الرئيسية",
              ),
              // BottomNavigationBarItem(
              //     icon: Icon(Icons.local_hospital), label: "العيادات"),
              BottomNavigationBarItem(
                icon: Icon(Icons.calendar_month_sharp,
                    size: isLandscape
                        ? screenSize.shortestSide * .07
                        : screenSize.shortestSide * .07),
                label: "حجوزاتي",
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.assignment,
                    size: isLandscape
                        ? screenSize.shortestSide * .07
                        : screenSize.shortestSide * .07,
                  ),
                  label: "السجل الطبي"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person,
                      size: isLandscape
                          ? screenSize.shortestSide * .07
                          : screenSize.shortestSide * .07),
                  label: "حسابي")
            ],
          ),
          // ]),
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
