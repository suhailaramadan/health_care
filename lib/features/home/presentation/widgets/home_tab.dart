import 'dart:async';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/constants.dart';
import 'package:graduation_project/core/di/register_modul.dart';
import 'package:graduation_project/core/di/service_locator.dart';
import 'package:graduation_project/core/resources/color_manager.dart';
import 'package:graduation_project/core/resources/font_manager.dart';
import 'package:graduation_project/core/resources/image_manager.dart';
import 'package:graduation_project/core/resources/styles_manager.dart';
import 'package:graduation_project/core/resources/value_manager.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/core/widgets/custom_text_field.dart';
import 'package:graduation_project/core/widgets/error_indicator.dart';
import 'package:graduation_project/core/widgets/home_screen_app_bar.dart';
import 'package:graduation_project/core/widgets/loading_indicator.dart';
import 'package:graduation_project/features/auth/data/data_sources/local/auth_local_data_source.dart';
import 'package:graduation_project/features/auth/data/data_sources/local/auth_shared_pref_local_data_source.dart';
import 'package:graduation_project/features/auth/presentation/screens/login_screen.dart';
import 'package:graduation_project/features/profile/domain/entities/profile_entity.dart';
import 'package:graduation_project/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:graduation_project/features/user/clinic/domain/entities/clinic_entity.dart';
import 'package:graduation_project/features/user/clinic/presentation/cubit/clinic_cubit.dart';
import 'package:graduation_project/features/user/clinic/presentation/cubit/clinic_states.dart';
import 'package:graduation_project/features/doctor/presentation/cubit/doctor_cubit.dart';
import 'package:graduation_project/features/doctor/presentation/cubit/doctor_states.dart';
import 'package:graduation_project/features/home/presentation/widgets/clinic_item.dart';
import 'package:graduation_project/features/home/presentation/widgets/custom_section_bar.dart';
import 'package:graduation_project/features/home/presentation/widgets/doctor_item.dart';
import 'package:graduation_project/features/home/presentation/widgets/home_slider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int _currentIndex = 0;
  late Timer _timer;
  final List<String> _homeSlider = [
    // "assets/images/medicine.jpg",
    // "assets/images/medicine.jpg"
    // "assets/images/carousel4.jpg"
    "assets/images/carousel2.jpg",
    "assets/images/carousel1.jpg"
  ];
  // late ClinicCubit _clinicCubit;
  late DoctorsCubit _doctorsCubit;
  @override
  void initState() {
    super.initState();
    _startImageSwitching();
    _doctorsCubit = serviceLocator.get<DoctorsCubit>()..getDoctors();
    // context.read<DoctorsCubit>().getDoctors();
    // _doctorsCubit.getDoctors();.
    // _loadUserData();
    // _clinicCubit = serviceLocator.get<ClinicCubit>()..getClinics();
    // serviceLocator.getDoctors();
  }

  // late ProfileEntity currentUser;
  // String firstName = '';
  // String lastName = '';
  // String userImage = '';
  // Future<void> _loadUserData() async {
  //   final localDataSource = serviceLocator.get<AuthLocalDataSource>();
  //   var user = await localDataSource.getPatientProfile();
  //   setState(() {
  //     currentUser = user;
  //     // firstName = sharedPref.getString(CacheConstants.firstNameKey) ?? "";
  //     // lastName = sharedPref.getString(CacheConstants.lastNameKey) ?? "";
  //     // userImage = sharedPref.getString(CacheConstants.userImageKey) ?? "";
  //   });ز
  // }
  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   final doctorCubit = serviceLocator.get<DoctorsCubit>();
  //   doctorCubit.getDoctors();
  // }

  int currentIndex = 0;
  final List<String> text = [
    // "نحن هنا نقدم لكم رعاية طبية\nموثوقة ومتكاملة\nاحجز موعدك اليوم وابدأرحلتك\n نحو صحةأفضل"
    "الإدارة الطبية جامعة طنطا\nرفيقكم في رحلة صحية آمنة\nداخل الحرم الجامعي",
    // "رعايتكم مسؤوليتنا! خدمات "
  ];
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.sizeOf(context);
    final bool isLandscape = screenSize.width > screenSize.height;
    final double appBarHeight =
        isLandscape ? screenSize.width * .13 : screenSize.height * 0.13;
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Scaffold(
            backgroundColor: ColorManager.white,
            appBar:
                // PreferredSize(
                //     preferredSize: Size.fromHeight(appBarHeight),
                //     // child: AppBar(
                //     //     backgroundColor: ColorManager.babyGreen,
                //     //     elevation: 0,
                //     //     surfaceTintColor: ColorManager.transparent,
                //     //     automaticallyImplyLeading: false,
                //     // widget.automaticallyImplyLeading ?? false,
                //     child: SizedBox(
                //       height: appBarHeight,
                //       child: Row(children: [
                //         CircleAvatar(
                //             radius: avatarRadius,
                //             backgroundColor: ColorManager.transparent,
                //             backgroundImage: const AssetImage(ImageManager.profile)
                //             // child: Image.asset("assets/images/doctor_image.jpg",
                //             // fit: BoxFit.cover
                //             // )
                //             ),

                //         const SizedBox(
                //           width: Sizes.s12,
                //         ),
                //         Expanded(
                //           child: Text(
                //             "أهلاً, سهيله",
                //             style: getSemiBoldStyle(
                //                 color: const Color.fromARGB(255, 65, 111, 156),
                //                 fontSize: FontSize.s13.sp),
                //           ),
                //         ),
                //         // const Icon(
                //         //   Icons.waving_hand,
                //         //   color: Colors.amber,
                //         // ),
                //         const Spacer(),

                //         IconButton(
                //             onPressed: () {},
                //             icon: Badge.count(
                //               count: 2,
                //               child: Icon(
                //                 Icons.notifications_none,
                //                 // color: ColorManager.white,
                //                 size: isLandscape ? 40 : 30,
                //               ),
                //             )),
                //         const SizedBox(
                //           width: 10,
                //         )
                //         // ]
                //         //   ],
                //         // ))
                //       ]),
                //     )),
                // ),

                PreferredSize(
                    preferredSize: Size.fromHeight(appBarHeight),
                    child: const HomeScreenAppBar()
                    // SizedBox(height: appBarHeight, child: SizedBox()),
                    ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: isLandscape
                        ? screenSize.width * .02
                        : screenSize.height * .02,
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.all(10.0),
                  //   child: CustomTextField(
                  //     // backgroundColor: ColorManager.primary.withOpacity(0.12),
                  //     prefixIcon: const Icon(Icons.search),
                  //     hint: 'ابحث عن العيادة',
                  //     hintTextStyle: getMediumStyle(color: ColorManager.grey),
                  //   ),
                  // ),
                  HomeSlider(
                    imagesPaths: _homeSlider,
                    currentIndex: _currentIndex,
                    timer: _timer,
                    text: text[currentIndex],
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.all(10.0),
                  //   child: CustomTextField(
                  //     // backgroundColor: ColorManager.primary.withOpacity(0.12),
                  //     prefixIcon: const Icon(Icons.search),
                  //     hint: 'ابحث عن العيادة',
                  //     hintTextStyle: getMediumStyle(color: ColorManager.grey),
                  //   ),
                  // ),
                  SizedBox(
                    height: isLandscape
                        ? screenSize.width * .02
                        : screenSize.height * .02,
                  ),
                  CustomSectionBar(
                    text: "العيادات المتاحة",
                    onViewAllClicked: () {
                      Navigator.of(context).pushNamed(Routes.clinic);
                    },
                  ),
                  SizedBox(
                    height: isLandscape
                        ? screenSize.width * .01
                        : screenSize.height * .01,
                  ),
                  BlocProvider.value(
                    // create: (context) => serviceLocator.get<ClinicCubit>(),
                    value: serviceLocator.get<ClinicCubit>(),
                    child: BlocBuilder<ClinicCubit, ClinicState>(
                      builder: (context, state) {
                        if (state is GetClinicsLoading) {
                          return const LoadingIndicator();
                        } else if (state is GetClinicsError) {
                          return ErrorIndicator(
                            message: state.message,
                          );
                        } else if (state is GetClinicsSuccess) {
                          return SizedBox(
                              height: isLandscape
                                  ? screenSize.width * .23
                                  : screenSize.height * .2,
                              width: MediaQuery.of(context).size.width.w,
                              child: Directionality(
                                textDirection: TextDirection.rtl,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (_, index) => ClinicItem(
                                    clinicEntity: state.clinicEntity[index],
                                  ),
                                  // padding: EdgeInsets.all(4),
                                  itemCount: state.clinicEntity.length,
                                ),
                              ));
                        }
                        return const SizedBox();
                      },
                    ),
                  ),
                  // SizedBox(

                  //   // height: isLandscape
                  //   //     ? screenSize.width * .01
                  //   //     : screenSize.height * .001,
                  // ),
                  CustomSectionBar(
                    text: "أطباؤنا",
                    onViewAllClicked: () {
                      Navigator.of(context).pushNamed(Routes.doctor);
                    },
                  ),
                  SizedBox(
                    height: isLandscape
                        ? screenSize.width * .38
                        // : screenSize.height * .32,
                        : screenSize.height * .312,
                    child: BlocProvider(
                      create: (context) => _doctorsCubit,
                      child: BlocBuilder<DoctorsCubit, DoctorsStates>(
                          builder: (context, state) {
                        if (state is GetDoctorsLoading) {
                          return const LoadingIndicator();
                        } else if (state is GetDoctorsError) {
                          return ErrorIndicator(
                            message: state.message,
                          );
                        } else if (state is GetDoctorsSuccess) {
                          return Directionality(
                            textDirection: TextDirection.rtl,
                            child: ListView.builder(
                              shrinkWrap: true,
                              // physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (_, index) => DoctorItem(
                                doctorEntity: state.doctorEntity[index],
                                // .take(5).toList()[index]
                              ),
                              scrollDirection: Axis.horizontal,
                              itemCount: state.doctorEntity.length,
                            ),
                          );
                        }
                        return const Text("حدث خطأ ما يرجى المحاولة مرة أخرى");
                      }),
                    ),
                  )
                ],
              ),
            )));
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
