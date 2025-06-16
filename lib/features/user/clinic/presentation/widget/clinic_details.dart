import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/constants.dart';
import 'package:graduation_project/core/di/service_locator.dart';
import 'package:graduation_project/core/resources/color_manager.dart';
import 'package:graduation_project/core/resources/font_manager.dart';
import 'package:graduation_project/core/resources/styles_manager.dart';
import 'package:graduation_project/core/widgets/custom_botton.dart';
import 'package:graduation_project/core/widgets/error_indicator.dart';
import 'package:graduation_project/core/widgets/loading_indicator.dart';
import 'package:graduation_project/features/home/presentation/widgets/custom_doctor.dart';
import 'package:graduation_project/features/user/clinic/domain/entities/clinic_entity.dart';
import 'package:graduation_project/features/user/clinic/presentation/widget/custom_clinic_componant.dart';
import 'package:graduation_project/features/doctor/domain/use_case.dart/get_doctors.dart';
import 'package:graduation_project/features/doctor/presentation/cubit/doctor_cubit.dart';
import 'package:graduation_project/features/doctor/presentation/cubit/doctor_states.dart';
import 'package:graduation_project/features/doctor/presentation/widgets/doctor_item.dart';

class ClinicDetails extends StatefulWidget {
  const ClinicDetails({super.key});
  static const clinicDetails = "/clinicDetails";

  @override
  State<ClinicDetails> createState() => _ClinicDetailsState();
}

class _ClinicDetailsState extends State<ClinicDetails> {
  late ClinicEntity args;
  late DoctorsCubit doctorsCubit;
  bool isInitialized = false;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!isInitialized) {
      final routeArgs = ModalRoute.of(context)?.settings.arguments;
      if (routeArgs is ClinicEntity) {
        args = routeArgs;
        doctorsCubit = serviceLocator.get<DoctorsCubit>()
          ..getDoctorsByClinicId(args.id);
        isInitialized = true;
      }
    }
  }

  // void initState() {
  //   super.initState();
  //   Future.microtask(() {
  //     final routeArgs = ModalRoute.of(context)?.settings.arguments;
  //     if (routeArgs is ClinicDetailsArg) {
  //       setState(() {
  //         args = routeArgs;
  //       });
  //       doctorsCubit = serviceLocator.get<DoctorsCubit>()
  //         ..getDoctorsByClinicId(args.id);
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    // final args = ModalRoute.of(context)!.settings.arguments as ClinicEntity;
    if (!isInitialized) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            color: ColorManager.primary,
          ),
        ),
      );
    }

    final fileName = args.imageUrl.split('/').last;
    final encodedFileName = Uri.encodeComponent(fileName);
    final fullUrl = '${ApiConstants.imageBaseUrl}/images/$encodedFileName';

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorManager.white,
        ),
        backgroundColor: ColorManager.white,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  const SizedBox(
                    height: 120,
                  ),
                  Container(
                      height: MediaQuery.of(context).size.height,
                      decoration: const BoxDecoration(
                          color: ColorManager.blue,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50)))),
                ],
              ),
              // const SizedBox(
              //   height: 15,
              // ),
              Positioned(
                  top: 40,
                  // right: MediaQuery.of(context).size.width * .35,
                  // left: MediaQuery.of(context).size.width * .35,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    // height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Column(children: [
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: ColorManager.primary, width: .4),
                            borderRadius: BorderRadius.circular(100)),
                        child: ClipOval(
                            // radius: MediaQuery.of(context).size.width * 0.2,

                            // borderRadius: BorderRadius.circular(150),
                            // backgroundImage:
                            child: CachedNetworkImage(
                          imageUrl: fullUrl,
                          placeholder: (context, url) => const Center(
                            child: CircularProgressIndicator(
                              color: ColorManager.greyDark,
                            ),
                          ),
                          errorWidget: (context, url, error) => const Center(
                              child: Icon(
                            Icons.error_outline_outlined,
                            color: ColorManager.red,
                            size: 25,
                          )),
                          height: 150,
                          width: 150,
                          fit: BoxFit.cover,
                        )
                            // CachedNetworkImageProvider(
                            //   "${ApiConstants.imageBaseUrl}${args.imageUrl}",
                            //   errorListener: (p0) =>
                            //       Image.asset("assets/images/default_clinic.png"),
                            // ),
                            // backgroundImage:
                            //     // child:
                            //     CachedNetworkImageProvider(
                            //   "${ApiConstants.imageBaseUrl}${args.imageUrl}",

                            //   errorListener: (p0) =>
                            //       Image.asset("assets/images/default_clinic.png"),
                            // )

                            // child: Container(

                            // width: double.infinity,
                            // decoration: BoxDecoration(
                            // image:
                            //  DecorationImage(
                            //     fit: BoxFit.fill,
                            //     image:
                            //  CachedNetworkImageProvider(
                            //   "${ApiConstants.imageBaseUrl}${args.imageUrl}",
                            //   errorListener: (p0) => Image.asset(
                            //       "assets/images/default_clinic.png"),
                            // ))))
                            // CachedNetworkImage(
                            //     height: 300,
                            //     width: 300,
                            //     // imageBuilder: (context, imageProvider) => ,
                            //     imageUrl:
                            //         "${ApiConstants.imageBaseUrl}${args.imageUrl}",
                            //     // fit: BoxFit.fill,
                            //     placeholder: (context, url) =>
                            //         const CircularProgressIndicator(),
                            //     errorWidget: (context, url, error) =>
                            //         Image.asset("assets/images/default_clinic.png"))
                            // ,
                            ),
                      ),

                      // IconButton(
                      //   icon: const Icon(
                      //     Icons.arrow_back_ios_rounded,
                      //     color: Colors.black,
                      //   ),
                      //   onPressed: () => Navigator.pop(context),
                      // ),
                      const SizedBox(
                        height: 20,
                      ),
                      // Container(
                      // padding: const EdgeInsets.all(10),
                      // // surfaceTintColor: ColorManager.white,
                      // // semanticContainer: false,
                      // decoration: const BoxDecoration(
                      //     color: Color.fromARGB(255, 254, 248, 248),
                      //     borderRadius: BorderRadius.only(
                      //         topLeft: Radius.circular(20),
                      //         topRight: Radius.circular(20))),

                      // child:
                      // Column(
                      //   children: [
                      Text(
                        args.name,
                        style: getBoldStyle(
                            color: ColorManager.primary,
                            fontSize: FontSize.s18.sp),
                      ),
                      // const SizedBox(
                      //   height: 20,
                      // ),
                      // // const Text("نقدم لكم أفضل الخدمات"),

                      const SizedBox(
                        height: 30,
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          "أطباء العيادة",
                          style: getMediumStyle(color: ColorManager.textColor),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      BlocProvider.value(
                        value: doctorsCubit,
                        // create: (context) =>
                        //     doctorsCubit..getDoctorsByClinicId(args.id),
                        child: BlocBuilder<DoctorsCubit, DoctorsStates>(
                          builder: (context, state) {
                            if (state is GetDoctorsLoading) {
                              return const LoadingIndicator();
                            } else if (state is GetDoctorsError) {
                              return ErrorIndicator(
                                message: state.message,
                              );
                            } else if (state is GetDoctorsSuccess) {
                              return SizedBox(
                                height: 500,
                                width: double.infinity,
                                child: ListView.builder(
                                    padding: const EdgeInsets.only(bottom: 18),
                                    // scrollDirection: Axis.vertical,
                                    itemCount: state.doctorEntity.length,
                                    itemBuilder: (_, index) => SizedBox(
                                          height: 150,
                                          child: DoctorItem(
                                            doctorEntity:
                                                state.doctorEntity[index],
                                          ),
                                        )),
                              );
                            } else {
                              return Center(
                                child: Text(
                                  "لا يوجد أطباء فى العيادة",
                                  style: getMediumStyle(
                                      color: ColorManager.primary),
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    ]),
                  ))
            ],

            //   ),

            // ],
          ),
        ),
      ),
    );
  }

  // @override
  // void dispose() {
  //   doctorsCubit.clearDoctors();
  //   super.dispose();
  // }
}
