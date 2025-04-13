import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/di/service_locator.dart';
import 'package:graduation_project/core/widgets/error_indicator.dart';
import 'package:graduation_project/core/widgets/loading_indicator.dart';
import 'package:graduation_project/features/doctor/presentation/cubit/doctor_cubit.dart';
import 'package:graduation_project/features/doctor/presentation/cubit/doctor_states.dart';
import 'package:graduation_project/features/home/presentation/widgets/doctor_item.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: const Text("أطباؤنا"),
        centerTitle: true,
      ),
      body: BlocProvider.value(
        value: doctorsCubit..getDoctors(),
        // (context) => _doctorsCubit,
        child:
            BlocBuilder<DoctorsCubit, DoctorsStates>(builder: (context, state) {
          if (state is GetDoctorsLoading) {
            return const Center(child: LoadingIndicator());
          } else if (state is GetDoctorsError) {
            return Center(
              child: ErrorIndicator(
                message: state.message,
              ),
            );
          } else if (state is GetDoctorsSuccess) {
            return GridView.builder(
              // padding: const EdgeInsets.all(1),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 6,
                  childAspectRatio: 0.8,
                  crossAxisSpacing: 6),
              itemBuilder: (_, index) => DoctorItem(
                doctorEntity: state.doctorEntity[index],
              ),
              itemCount: state.doctorEntity.length,
            );
          } else {
            return const SizedBox();
          }
        }),
      ),
    );
  }
}
