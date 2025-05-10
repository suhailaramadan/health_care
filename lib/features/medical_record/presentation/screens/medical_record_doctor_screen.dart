import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/resources/color_manager.dart';
import 'package:graduation_project/core/resources/styles_manager.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/core/widgets/error_indicator.dart';
import 'package:graduation_project/core/widgets/loading_indicator.dart';
import 'package:graduation_project/features/auth/data/data_sources/local/auth_local_data_source.dart';
import 'package:graduation_project/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:graduation_project/features/medical_record/data/model/medical_record_add_response/add_medical_record_model.dart';
import 'package:graduation_project/features/medical_record/presentation/cubit/medical_record_cubit.dart';
import 'package:graduation_project/features/medical_record/presentation/cubit/medical_record_states.dart';
import 'package:graduation_project/features/medical_record/presentation/widgets/medical_record_card.dart';
import 'package:graduation_project/features/profile/data/model/profile_response/profile_data_model.dart';
import 'package:graduation_project/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:graduation_project/features/profile/presentation/cubit/profile_states.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MedicalRecordScreen extends StatefulWidget {
  static const medicalRecord = "/medicalRecord";
  MedicalRecordScreen({super.key, required this.patientId, required this.id});
  String patientId;
  int id;
  @override
  State<MedicalRecordScreen> createState() => _MedicalRecordScreenState();
}

class _MedicalRecordScreenState extends State<MedicalRecordScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ProfileCubit>().getPatientProfileById(widget.patientId);
    context
        .read<MedicalRecordCubit>()
        .getMedicalRecord(widget.id)
        .then((value) => print("Succsedddddddddddddddddd"))
        .catchError((error) => print("Ewwwwwwwwwwwwwwwwyii$error"));
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
              height: 30,
            ),
            Container(
                width: MediaQuery.of(context).size.width * .7,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: ColorManager.blue,
                    borderRadius: BorderRadius.circular(10)),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
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
                  )
                ])),
            BlocBuilder<MedicalRecordCubit, MedicalResocrdSates>(
              builder: (context, state) {
                if (state is GetMedicalRecordLoading) {
                  return const Center(
                      child: Column(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      LoadingIndicator(),
                    ],
                  ));
                } else if (state is GetMedicalRecordError) {
                  return const Center(child: ErrorIndicator());
                } else if (state is GetMedicalRecordPatientSuccess) {
                  return Expanded(
                    child: state.medicalRecord.isEmpty
                        ? Center(
                            child: Text(
                              "لا يوجد سجلات",
                              style:
                                  getMediumStyle(color: ColorManager.primary),
                            ),
                          )
                        : ListView.builder(
                            itemCount: state.medicalRecord.length,
                            itemBuilder: (context, index) => MedicalRecordCard(
                                  onDelete: () async {
                                    final cubit =
                                        context.read<MedicalRecordCubit>();
                                    final recordId = state.medicalRecord[index];
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return Directionality(
                                          textDirection: TextDirection.rtl,
                                          child: AlertDialog(
                                            surfaceTintColor:
                                                ColorManager.white,
                                            backgroundColor: ColorManager.white,
                                            title: const Icon(
                                              Icons.warning_amber,
                                              color: ColorManager.red,
                                              size: 35,
                                            ),
                                            content: Text(
                                              "هل تريد حذف السجل الطبي ",
                                              style: getBoldStyle(
                                                  fontSize: 18,
                                                  color:
                                                      ColorManager.textColor),
                                            ),
                                            actions: [
                                              TextButton(
                                                  onPressed: () {
                                                    cubit.deleteMedicalRecord(
                                                        recordId.id ?? 0);
                                                  },
                                                  style: ButtonStyle(
                                                      padding:
                                                          const MaterialStatePropertyAll(
                                                              EdgeInsets.all(
                                                                  12)),
                                                      backgroundColor:
                                                          const MaterialStatePropertyAll(
                                                              ColorManager.red),
                                                      shape: MaterialStatePropertyAll(
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5),
                                                              side:
                                                                  const BorderSide(
                                                                      width:
                                                                          .3)))),
                                                  child: Text(
                                                    "إلغاء السجل ",
                                                    style: getRegularStyle(
                                                        color:
                                                            ColorManager.white),
                                                  )),
                                              SizedBox(
                                                width: 50.w,
                                              ),
                                              TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  style: ButtonStyle(
                                                      padding:
                                                          const MaterialStatePropertyAll(
                                                              EdgeInsets.all(
                                                                  15)),
                                                      backgroundColor:
                                                          const MaterialStatePropertyAll(
                                                              ColorManager
                                                                  .transparent),
                                                      shape: MaterialStatePropertyAll(
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5),
                                                              side:
                                                                  const BorderSide(
                                                                      width:
                                                                          .3)))),
                                                  child: Text(
                                                    "لا أريد ذلك",
                                                    style: getRegularStyle(
                                                        color: ColorManager
                                                            .textColor),
                                                  )),
                                              //     onTap: () {
                                              //       Navigator.of(context).pop();

                                              //       cubit.deleteAppointment(
                                              //           appointment.id ?? 0);
                                              //     }),
                                              // CustomButton(
                                              //     label: "لا أريد ذلك",
                                              //     backgroundColor:
                                              //         ColorManager.transparent,
                                              //     onTap: () {
                                              //       Navigator.of(context).pop();
                                              //     }),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  onEdit: () async {
                                    final profile =
                                        context.read<ProfileCubit>().state;
                                    if (profile is GetProfilesSuccess) {
                                      final result =
                                          await Navigator.of(context).pushNamed(
                                        Routes.updateMedicalRecord,
                                        arguments: {
                                          'bookingId':
                                              state.medicalRecord[index].id,
                                          "diagnosis": state
                                              .medicalRecord[index].diagnosis,
                                          "treatment": state
                                              .medicalRecord[index].treatment,
                                          "notes":
                                              state.medicalRecord[index].notes,
                                          'firstName':
                                              profile.profileEntity.firstName,
                                          'lastName':
                                              profile.profileEntity.lastName
                                        },
                                      );

                                      if (result == null) {
                                        context
                                            .read<MedicalRecordCubit>()
                                            .getMedicalRecord(widget.id);
                                      }
                                    }
                                  },
                                  isDoctor: true,
                                  medicalRecordPatientEntity:
                                      state.medicalRecord[index],
                                )),
                  );
                } else {
                  return const SizedBox();
                }
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final state = context.read<ProfileCubit>().state;
          if (state is GetProfilesSuccess) {
            Navigator.of(context).pushNamed(
              Routes.addMedicalRecord,
              arguments: {
                'bookingId': widget.id,
                'firstName': state.profileEntity.firstName,
                'lastName': state.profileEntity.lastName,
              },
            );
          }
        },
        backgroundColor: ColorManager.primary,
        child: const Icon(Icons.add, color: ColorManager.white),
      ),
    );
  }
}
