import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/resources/image_manager.dart';
import 'package:graduation_project/core/resources/value_manager.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/core/widgets/home_screen_app_bar.dart';
import 'package:graduation_project/features/home/presentation/widgets/clinic_item.dart';
import 'package:graduation_project/features/home/presentation/widgets/custom_section_bar.dart';
import 'package:graduation_project/features/home/presentation/widgets/doctor_item.dart';
// import 'package:graduation_project/features/home/presentation/widgets/clinic_speciality.dart';
import 'package:graduation_project/features/home/presentation/widgets/home_slider.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int _currentIndex = 0;
  late Timer _timer;
  final List<String> _homeSlider = [
    ImageManager.carousel1,
    ImageManager.carousel2
  ];

  @override
  void initState() {
    super.initState();
    _startImageSwitching();
  }

  final List<Widget> clinic = [
    ClinicItem(
      image: "assets/images/cardiogram_8028646.png",
      name: "القلب",
    ),

    ClinicItem(
      image: "assets/images/skeleton_3904663.png",
      name: "العظام",
    ),
    // ClinicItem(
    //   image: "assets/images/eye_15632446.png",
    //   name: "الرمد",
    // ),
    ClinicItem(
      image: "assets/images/shining.png",
      name: "الأسنان",
    ),
    ClinicItem(
      image: "assets/images/human_14858176.png",
      name: "المخ والأعصاب",
    ),
    // ClinicItem(
    //   image: SvgManager.svgEar,
    // )
    // ClinicItem(color: ColorManager.babyPink, image: ImageManager.heart),
    // ClinicItem(color: ColorManager.babyGreen, image: ImageManager.allergy),
    // ClinicItem(color: ColorManager.babyPink, image: ImageManager.brain),
    // ClinicItem(color: ColorManager.babyGreen, image: ImageManager.dental),
    // ClinicItem(color: ColorManager.babyPink, image: ImageManager.optical),
    // ClinicItem(color: ColorManager.babyGreen, image: ImageManager.heart),
    // ClinicItem(color: ColorManager.babyPink, image: ImageManager.allergy),
    // ClinicItem(color: ColorManager.babyGreen, image: ImageManager.brain),
    // ClinicItem(color: ColorManager.babyPink, image: ImageManager.dental),
    // ClinicItem(color: ColorManager.babyGreen, image: ImageManager.optical),
    // ClinicItem(color: ColorManager.babyPink, image: ImageManager.heart),
    // ClinicItem(color: ColorManager.babyGreen, image: ImageManager.allergy),
    // ClinicItem(color: ColorManager.babyPink, image: ImageManager.brain),
    // ClinicItem(color: ColorManager.babyGreen, image: ImageManager.dental),
    // ClinicItem(color: ColorManager.babyPink, image: ImageManager.optical),
    // ClinicItem(color: ColorManager.babyGreen, image: ImageManager.heart),
    // ClinicItem(color: ColorManager.babyPink, image: ImageManager.allergy),
    // ClinicItem(color: ColorManager.babyGreen, image: ImageManager.brain),
    // ClinicItem(color: ColorManager.babyPink, image: ImageManager.dental),
    // ClinicItem(color: ColorManager.babyGreen, image: ImageManager.optical),
    // ClinicItem(color: ColorManager.babyPink, image: ImageManager.heart),
    // ClinicItem(color: ColorManager.babyGreen, image: ImageManager.allergy),
    // ClinicItem(color: ColorManager.babyPink, image: ImageManager.brain),
    // ClinicItem(color: ColorManager.babyGreen, image: ImageManager.dental),
    // ClinicItem(color: ColorManager.babyPink, image: ImageManager.optical),
    // Container(
    //   width: 80,
    //   height: 30,
    //   decoration: BoxDecoration(
    //     color: Color.fromARGB(255, 111, 179, 246),
    //     borderRadius: BorderRadius.circular(15),
    //     // border: Border.all(color: Colors.black, width: 1),
    //   ),
    //   child: Image.asset(ImageManager.heart),
    // ),
    // SizedBox(
    //   width: 5,
    // ),
    // Container(
    //   width: 80,
    //   height: 30,
    //   decoration: BoxDecoration(
    //     color: Color.fromARGB(255, 111, 179, 246),
    //     borderRadius: BorderRadius.circular(15),
    //     // border: Border.all(color: Colors.black, width: 1),
    //   ),
    //   child: Image.asset(ImageManager.heart),
    // ),
    // SizedBox(
    //   width: 5,
    // ),
    // Container(
    //   width: 80,
    //   height: 30,
    //   decoration: BoxDecoration(
    //     color: Color.fromARGB(255, 111, 179, 246),
    //     borderRadius: BorderRadius.circular(15),
    //     // border: Border.all(color: Colors.black, width: 1),
    //   ),
    //   child: Image.asset(ImageManager.heart),
    // ),
    // SizedBox(
    //   width: 5,
    // ),
    // Container(
    //   width: 80,
    //   height: 30,
    //   decoration: BoxDecoration(
    //     color: Color.fromARGB(255, 111, 179, 246),
    //     borderRadius: BorderRadius.circular(15),
    //     // border: Border.all(color: Colors.black, width: 1),
    //   ),
    //   child: Image.asset(ImageManager.heart),
    // ),
    // SizedBox(
    //   width: 8,
    // ),
    // Container(
    //   width: 80,
    //   height: 30,
    //   decoration: BoxDecoration(
    //     color: ColorManager.white,
    //     borderRadius: BorderRadius.circular(15),
    //     // border: Border.all(color: Colors.black, width: 1),
    //   ),
    //   child: Image.asset(
    //     ImageManager.allergy,
    //     // width: 500,
    //     // height: 500,
    //   ),
    // ),
    // Container(
    //   width: 100,
    //   height: 100,
    //   decoration: BoxDecoration(
    //       color: Colors.white,
    //       // border: Border.all(color: Colors.black, width: 1),
    //       shape: BoxShape.circle),
    //   child: Image.asset(ImageManager.heart),
    // ),
    // Container(
    //   width: 100,
    //   height: 100,
    //   decoration: BoxDecoration(
    //       color: ColorManager.white,
    //       // border: Border.all(color: Colors.black, width: 1),
    //       shape: BoxShape.circle),
    //   child: Image.asset(
    //     ImageManager.allergy,
    //     // width: 500,
    //     // height: 500,
    //   ),
    // ),
    // Container(
    //   width: 100,
    //   height: 100,
    //   decoration: BoxDecoration(
    //       color: Colors.white,
    //       // border: Border.all(color: Colors.black, width: 1),
    //       shape: BoxShape.circle),
    //   child: Image.asset(ImageManager.heart),
    // ),
    // Container(
    //   width: 100,
    //   height: 100,
    //   decoration: BoxDecoration(
    //       color: ColorManager.white,
    //       // border: Border.all(color: Colors.black, width: 1),
    //       shape: BoxShape.circle),
    //   child: Image.asset(
    //     ImageManager.allergy,
    //     // width: 500,
    //     // height: 500,
    //   ),
    // ),
    // Container(
    //   width: 100,
    //   height: 100,
    //   decoration: BoxDecoration(
    //       color: Colors.white,
    //       // border: Border.all(color: Colors.black, width: 1),
    //       shape: BoxShape.circle),
    //   child: Image.asset(ImageManager.heart),
    // ),
    // Container(
    //   width: 100,
    //   height: 100,
    //   decoration: BoxDecoration(
    //       color: ColorManager.white,
    //       // border: Border.all(color: Colors.black, width: 1),
    //       shape: BoxShape.circle),
    //   child: Image.asset(
    //     ImageManager.allergy,
    //     // width: 500,
    //     // height: 500,
    //   ),
    // ),
    // CircleAvatar(
    //   child: Image.asset(ImageManager.eye),
    // ),
    // CircleAvatar(child: Image.asset(ImageManager.heart)),
    // CircleAvatar(
    //   child: Image.asset(ImageManager.ear),
    // ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(double.infinity, Sizes.s100.h),
          child: const HomeScreenAppBar(),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              HomeSlider(
                imagesPaths: _homeSlider,
                currentIndex: _currentIndex,
                timer: _timer,
              ),
              SizedBox(
                height: 20,
              ),
              CustomSectionBar(
                text: "الخدمات المتاحة",
                onViewAllClicked: () {
                  Navigator.of(context).pushNamed(Routes.clinic);
                },
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 160,
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index) {
                      return clinic[index];
                    }
                    // currentIndex: index,
                    ,
                    padding: EdgeInsets.all(8),
                    itemCount: clinic.length,
                  ),
                ),
              ),
              CustomSectionBar(
                text: "الأطباء المتاحين",
                onViewAllClicked: () {},
              ),
              SizedBox(
                height: 250,
                // width: 150,
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: ListView.separated(
                    separatorBuilder: (context, index) => const SizedBox(
                      width: 2,
                    ),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index) {
                      return DoctorItem();
                    },
                    padding: EdgeInsets.all(10),
                    itemCount: 10,
                  ),
                ),
              )
            ],
          ),
        ));
  }

  void _startImageSwitching() {
    _timer = Timer.periodic(const Duration(milliseconds: 6000), (Timer timer) {
      setState(
        () => _currentIndex = (_currentIndex + 1) % _homeSlider.length,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
