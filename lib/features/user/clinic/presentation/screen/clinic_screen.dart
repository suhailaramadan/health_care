import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduation_project/core/di/service_locator.dart';
import 'package:graduation_project/core/resources/color_manager.dart';
import 'package:graduation_project/core/resources/font_manager.dart';
import 'package:graduation_project/core/resources/styles_manager.dart';
import 'package:graduation_project/core/resources/value_manager.dart';
import 'package:graduation_project/core/widgets/custom_text_field.dart';
import 'package:graduation_project/core/widgets/error_indicator.dart';
import 'package:graduation_project/core/widgets/loading_indicator.dart';
import 'package:graduation_project/features/user/clinic/presentation/cubit/clinic_cubit.dart';
import 'package:graduation_project/features/user/clinic/presentation/cubit/clinic_states.dart';
import 'package:graduation_project/features/user/clinic/presentation/widget/custom_clinic_componant.dart';
import 'package:graduation_project/features/home/presentation/widgets/clinic_item.dart';

class ClinicScreen extends StatefulWidget {
  const ClinicScreen({super.key});
  static const clinic = "/clinic";

  @override
  State<ClinicScreen> createState() => _ClinicScreenState();
}

class _ClinicScreenState extends State<ClinicScreen> {
  late final ClinicCubit _clinicCubit;
  @override
  void initState() {
    super.initState();
    _clinicCubit = serviceLocator.get<ClinicCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          backgroundColor: ColorManager.white,
          appBar: AppBar(
            backgroundColor: ColorManager.white,
            centerTitle: true,
            title: Text(
              "العيادات",
              // textAlign: TextAlign.center,
              style: getBoldStyle(color: ColorManager.textColor),
              // Color.fromARGB(255, 9, 55, 101)
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: CustomTextField(
                  hint: "ابحث عن العيادة",
                  label: "",
                  prefixIcon: Icon(
                    Icons.search,
                    color: ColorManager.kuhly,
                  ),
                  // hintTextStyle: getRegularStyle(
                  //     color: ColorManager.grey, fontSize: FontSize.s13.sp),
                  // labelTextStyle: getMediumStyle(
                  //     color: ColorManager.black, fontSize: FontSize.s5),
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
                      return Expanded(
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
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
          )),
    );
  }
}
