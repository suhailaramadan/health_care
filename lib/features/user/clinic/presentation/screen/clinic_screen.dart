import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduation_project/core/di/service_locator.dart';
import 'package:graduation_project/core/resources/color_manager.dart';
import 'package:graduation_project/core/resources/font_manager.dart';
import 'package:graduation_project/core/resources/styles_manager.dart';
import 'package:graduation_project/core/widgets/custom_text_field.dart';
import 'package:graduation_project/core/widgets/error_indicator.dart';
import 'package:graduation_project/core/widgets/loading_indicator.dart';
import 'package:graduation_project/features/clinic/presentation/cubit/clinic_cubit.dart';
import 'package:graduation_project/features/clinic/presentation/cubit/clinic_states.dart';
import 'package:graduation_project/features/clinic/presentation/widget/custom_clinic_componant.dart';

class ClinicScreen extends StatefulWidget {
  const ClinicScreen({super.key});
  static const clinic = "/clinic";

  @override
  State<ClinicScreen> createState() => _ClinicScreenState();
}

class _ClinicScreenState extends State<ClinicScreen> {
  // List<String> images = [
  //   "assets/images/heart_clinic.png",
  //   "assets/images/density_clinic.png",
  //   "assets/images/brain_clinic.png",
  //   "assets/images/heart_clinic.png",
  //   "assets/images/density_clinic.png",
  //   "assets/images/brain_clinic.png",
  //   "assets/images/heart_clinic.png",
  //   "assets/images/density_clinic.png",
  //   "assets/images/brain_clinic.png",
  //   "assets/images/heart_clinic.png",
  //   "assets/images/density_clinic.png",
  //   "assets/images/brain_clinic.png",
  // ];
  late final ClinicCubit _clinicCubit;
  @override
  void initState() {
    super.initState();
    _clinicCubit = serviceLocator.get<ClinicCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManager.white,
        appBar: AppBar(
          backgroundColor: ColorManager.white,
          centerTitle: true,
          title: Text(
            "العيادات",
            // textAlign: TextAlign.center,
            style: getBoldStyle(color: ColorManager.textColor),
          ),
        ),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: CustomTextField(
                  fillColor: Color.fromARGB(255, 245, 246, 248),
                  hint: "ابحث عن العيادة",
                  prefixIcon: Icon(
                    Icons.search,
                    color: ColorManager.kuhly,
                  ),
                  hintTextStyle: getRegularStyle(
                      color: ColorManager.grey, fontSize: FontSize.s13.sp),
                  labelTextStyle: getMediumStyle(
                      color: ColorManager.black, fontSize: FontSize.s5),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              BlocProvider(
                create: (context) => _clinicCubit,
                child: BlocBuilder<ClinicCubit, ClinicState>(
                  builder: (context, state) {
                    if (state is GetClinicsLoading) {
                      return const LoadingIndicator();
                    } else if (state is GetClinicsError) {
                      return ErrorIndicator(
                        message: state.message,
                      );
                    } else if (state is GetClinicsSuccess) {
                      return Flexible(
                        child: ListView.builder(
                          itemBuilder: (_, index) => CustomClinicComponant(
                            clinicEntity: state.clinicEntity[index],
                          ),
                          itemCount: state.clinicEntity.length,
                        ),
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
              )
            ]),
          ),
        ));
  }
}
