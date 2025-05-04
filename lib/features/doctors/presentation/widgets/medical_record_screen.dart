import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/resources/color_manager.dart';
import 'package:graduation_project/core/resources/styles_manager.dart';
import 'package:graduation_project/core/widgets/error_indicator.dart';
import 'package:graduation_project/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:graduation_project/features/profile/presentation/cubit/profile_states.dart';

class MedicalRecordScreen extends StatefulWidget {
  static const medicalRecord = "/medicalRecord";
  MedicalRecordScreen({super.key, required this.patientId});
  String patientId;

  @override
  State<MedicalRecordScreen> createState() => _MedicalRecordScreenState();
}

class _MedicalRecordScreenState extends State<MedicalRecordScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ProfileCubit>().getPatientProfileById(widget.patientId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.white,
      ),
      backgroundColor: ColorManager.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // const SizedBox(
            //   height: 50,
            // ),
            Container(
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: .3, color: ColorManager.primary)),
              child: Card(
                color: ColorManager.white,
                surfaceTintColor: ColorManager.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        padding: const EdgeInsets.only(
                            top: 10, bottom: 10, left: 15, right: 15),
                        decoration: BoxDecoration(
                            color: ColorManager.blue,
                            borderRadius: BorderRadius.circular(8)),
                        child: Text(
                          "بيانات المريض",
                          style: getBoldStyle(
                              fontSize: 17, color: ColorManager.primary),
                        )),
                    const SizedBox(
                      height: 15,
                    ),
                    BlocBuilder<ProfileCubit, ProfileStates>(
                      builder: (context, state) {
                        if (state is GetProfilesLoading) {
                          return const Center(
                            child: CircularProgressIndicator(
                              color: ColorManager.primary,
                            ),
                          );
                        }
                        if (state is GetProfilesError) {
                          return Center(
                            child: ErrorIndicator(
                              message: state.message,
                            ),
                          );
                        } else if (state is GetProfilesSuccess) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "الاسم : ",
                                      style: getMediumStyle(
                                          color: ColorManager.primary),
                                    ),
                                    const Spacer(),
                                    Text(
                                      " ${state.profileEntity.firstName} ${state.profileEntity.lastName}",
                                      style: getRegularStyle(
                                          color: ColorManager.textColor),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "الكلية : ",
                                      style: getMediumStyle(
                                          color: ColorManager.primary),
                                    ),
                                    const Spacer(),
                                    Text(
                                      state.profileEntity.college ?? '',
                                      style: getRegularStyle(
                                          color: ColorManager.textColor),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "الرقم القومي : ",
                                      style: getMediumStyle(
                                          color: ColorManager.primary),
                                    ),
                                    const Spacer(),
                                    Text(state.profileEntity.nationalId ?? '',
                                        style: getRegularStyle(
                                            color: ColorManager.textColor))
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "رقم الهاتف : ",
                                      style: getMediumStyle(
                                          color: ColorManager.primary),
                                    ),
                                    const Spacer(),
                                    Text(
                                      state.profileEntity.phoneNumber ?? '',
                                      style: getRegularStyle(
                                          color: ColorManager.textColor),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "البريد الإلكتروني : ",
                                      style: getMediumStyle(
                                          color: ColorManager.primary),
                                    ),
                                    const Spacer(),
                                    Text(
                                      state.profileEntity.email ?? '',
                                      style: getRegularStyle(
                                          color: ColorManager.textColor),
                                    )
                                  ],
                                )
                              ],
                            ),
                          );
                        } else {
                          return const SizedBox();
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width * .7,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: ColorManager.blue,
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.note_add_rounded,
                    color: ColorManager.primary,
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  Text(
                    "السجلات الطبية للمريض",
                    style:
                        getBoldStyle(fontSize: 16, color: ColorManager.primary),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
