import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/di/service_locator.dart';
import 'package:graduation_project/core/resources/color_manager.dart';
import 'package:graduation_project/core/resources/styles_manager.dart';
import 'package:graduation_project/core/widgets/error_indicator.dart';
import 'package:graduation_project/core/widgets/loading_indicator.dart';
import 'package:graduation_project/features/doctor/presentation/cubit/doctor_cubit.dart';
import 'package:graduation_project/features/doctor/presentation/cubit/doctor_states.dart';
import 'package:graduation_project/features/doctor/presentation/widgets/doctor_item.dart';

class DoctorsScreen extends StatefulWidget {
  const DoctorsScreen({super.key});
  static const doctor = '/doctor';
  @override
  State<DoctorsScreen> createState() => _DoctorsScreenState();
}

class _DoctorsScreenState extends State<DoctorsScreen> {
  late final DoctorsCubit doctorsCubit;
  @override
  void initState() {
    super.initState();
    doctorsCubit = serviceLocator.get<DoctorsCubit>()..getDoctors();
    // if (_doctorsCubit.state is! GetDoctorsSuccess) {
    //   _doctorsCubit.getDoctors();
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: ColorManager.white,
        appBar: AppBar(
          toolbarHeight: 70,
          backgroundColor: ColorManager.white,
          title: Text(
            "أطباؤنا",
            style: getSemiBoldStyle(color: ColorManager.textColor),
          ),
          centerTitle: true,
        ),
        body: BlocProvider.value(
          value: doctorsCubit..getDoctors(),
          // (context) => _doctorsCubit,
          child: BlocBuilder<DoctorsCubit, DoctorsStates>(
              builder: (context, state) {
            if (state is GetDoctorsLoading) {
              return const Center(child: LoadingIndicator());
            } else if (state is GetDoctorsError) {
              return Center(
                child: ErrorIndicator(
                  message: state.message,
                ),
              );
            } else if (state is GetDoctorsSuccess &&
                state.doctorEntity.isNotEmpty) {
              return ListView.builder(
                padding: const EdgeInsets.all(1),
                itemBuilder: (_, index) => SizedBox(
                  height: 190,
                  width: 200,
                  child: DoctorItem(
                    doctorEntity: state.doctorEntity[index],
                  ),
                ),
                itemCount: state.doctorEntity.length,
              );
            } else if (state is GetDoctorsSuccess &&
                state.doctorEntity.isEmpty) {
              return Center(
                child: Text(
                  "لا يوجد أطباء",
                  style: getSemiBoldStyle(color: ColorManager.kuhly),
                ),
              );
            } else {
              return const SizedBox();
            }
          }),
        ),
      ),
    );
  }
}
