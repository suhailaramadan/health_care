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
import 'package:graduation_project/features/user/clinic/presentation/widget/custom_clinic_componant.dart';
import 'package:graduation_project/features/doctor/domain/use_case.dart/get_doctors.dart';
import 'package:graduation_project/features/doctor/presentation/cubit/doctor_cubit.dart';
import 'package:graduation_project/features/doctor/presentation/cubit/doctor_states.dart';
import 'package:graduation_project/features/home/presentation/widgets/doctor_item.dart';

class ClinicDetails extends StatefulWidget {
  const ClinicDetails({super.key});
  static const clinicDetails = "/clinicDetails";

  @override
  State<ClinicDetails> createState() => _ClinicDetailsState();
}

class _ClinicDetailsState extends State<ClinicDetails> {
  late ClinicDetailsArg args;
  // late DoctorArg doctorArg;
  late DoctorsCubit doctorsCubit;

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   final routeArgs = ModalRoute.of(context)?.settings.arguments;
  // if (args != null) {
  //   args = ModalRoute.of(context)?.settings.arguments as ClinicDetailsArg?;
  // if (args != null) {
  //   // _doctorsCubit = serviceLocator.get<DoctorsCubit>();

  // _doctorsCubit.getDoctorsByClinicId(args!.id);
  // }

  //   if (routeArgs != null && routeArgs is ClinicDetailsArg) {
  //     setState(() {
  //       args = routeArgs;
  //     });
  //     //   // final clinicId = args.id.toString();
  //     //   _doctorsCubit = serviceLocator.get<DoctorsCubit>();
  //     //   print("--------------------------------------> ${args!.id}");
  //     //   _doctorsCubit.getDoctorsByClinicId(args!.id);

  //     _doctorsCubit.getDoctorsByClinicId(args!.id);
  //   }
  // }
  @override
  void initState() {
    super.initState();
    // doctorsCubit = serviceLocator.get<DoctorsCubit>();
    // doctorsCubit?.getDoctorsByClinicId(args!.id);
    Future.microtask(() {
      final routeArgs = ModalRoute.of(context)?.settings.arguments;
      if (routeArgs is ClinicDetailsArg) {
        setState(() {
          args = routeArgs;
        });
        doctorsCubit = serviceLocator.get<DoctorsCubit>()
          ..getDoctorsByClinicId(args.id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // print("---------------------> ${args.name}");
    // final args = ModalRoute.of(context)?.settings.arguments as ClinicDetailsArg;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Center(
          child: SizedBox(
            // height: MediaQuery.sizeOf(context).height,
            // decoration: const BoxDecoration(
            //     color: ColorManager.blue,
            //     borderRadius: BorderRadius.only(
            //         topLeft: Radius.circular(70),
            //         topRight: Radius.circular(70))),
            child: Column(
              children: [
                // const SizedBox(
                //   height: 15,
                // ),
                Center(
                  child: CachedNetworkImage(
                      imageUrl: "${ApiConstants.imageBaseUrl}${args.imageUrl}",
                      height: 400,
                      width: double.infinity,
                      fit: BoxFit.fill,
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                      errorWidget: (context, url, error) =>
                          Image.asset("assets/images/default_clinic.png")),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  args.name,
                  style: getBoldStyle(
                      color: ColorManager.primary, fontSize: FontSize.s22.sp),
                ),
                const SizedBox(
                  height: 20,
                ),
                // const Text("نقدم لكم أفضل الخدمات"),

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
                        print("ARGGGGGGGGGGID----> ${args.id}");
                        return const LoadingIndicator();
                      } else if (state is GetDoctorsError) {
                        print(
                            "ErrorMessage-------------------> ${state.message}");
                        return ErrorIndicator(
                          message: state.message,
                        );
                      } else if (state is GetDoctorsSuccess) {
                        // print("SucccccccMessage${state.doctorEntity}");
                        return Expanded(
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: state.doctorEntity.length,
                              itemBuilder: (_, index) => DoctorItem(
                                    doctorEntity: state.doctorEntity[index],
                                  )),
                        );
                      } else {
                        return const SizedBox();
                      }
                    },
                  ),
                )
              ],
            ),
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
