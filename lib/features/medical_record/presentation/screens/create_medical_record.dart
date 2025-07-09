import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/resources/color_manager.dart';
import 'package:graduation_project/core/resources/font_manager.dart';
import 'package:graduation_project/core/resources/styles_manager.dart';
import 'package:graduation_project/core/resources/value_manager.dart';
import 'package:graduation_project/core/utils/ui_utils.dart';
import 'package:graduation_project/core/widgets/custom_botton.dart';
import 'package:graduation_project/core/widgets/custom_text_field.dart';
import 'package:graduation_project/features/medical_record/data/model/medical_record_add_response/add_medical_record_model.dart';
import 'package:graduation_project/features/medical_record/domain/entity/medical_record_add_entity.dart';
import 'package:graduation_project/features/medical_record/presentation/cubit/medical_record_cubit.dart';
import 'package:graduation_project/features/medical_record/presentation/cubit/medical_record_states.dart';
import 'package:graduation_project/features/user/booking/presentation/cubit/appointment/appointment_states.dart';

class AddMedicalRecordScreen extends StatefulWidget {
  final int bookingId;
  final String firstName;
  final String lastName;
  static const addMedicalRecord = "/addMedical";
  AddMedicalRecordScreen({
    required this.bookingId,
    required this.firstName,
    required this.lastName,
  });

  @override
  State<AddMedicalRecordScreen> createState() => _AddMedicalRecordScreenState();
}

class _AddMedicalRecordScreenState extends State<AddMedicalRecordScreen> {
  // @override
  // void initState() {
  //   super.initState();
  //   context
  //       .read<MedicalRecordCubit>()
  //       .addMedicalRecord(AddMedicalRecordModel());
  // }

  final TextEditingController diagnosisController = TextEditingController();
  final TextEditingController treatmentController = TextEditingController();
  final TextEditingController notesController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;
  void _submitForm() {
    // if (isLoading) return;
    if (formKey.currentState!.validate()) {
      // setState(() {
      //   isLoading = true;
      // });
      context.read<MedicalRecordCubit>().addMedicalRecord(AddMedicalRecordModel(
            bookingsId: widget.bookingId,
            diagnosis: diagnosisController.text,
            treatment: treatmentController.text,
            notes: notesController.text,
          ));
    } else {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "إضافة فحص للمريض",
            style: getSemiBoldStyle(color: ColorManager.textColor),
          ),
          centerTitle: true,
        ),
        body: BlocConsumer<MedicalRecordCubit, MedicalResocrdSates>(
            listener: (context, state) {
          if (state is AddMedicalRecordSuccess) {
            UIUtils.showMessage(
                context, "تم إضافة الفحص بنجاح", ColorManager.green);
            // setState(() {
            //   isLoading = false;
            // });
            Navigator.of(context).pop();
            context.read<MedicalRecordCubit>().getPatientMedicalRecord();
          } else if (state is GetMedicalRecordError) {
            UIUtils.showMessage(context, "تعذر إضافة الفحص", ColorManager.red);
            // setState(() {
            //   isLoading = false;
            // });
          }
        }, builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: BlocBuilder<MedicalRecordCubit, MedicalResocrdSates>(
                  builder: (context, snapshot) {
                return Form(
                  key: formKey,
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 80,
                      ),
                      Row(
                        children: [
                          const Icon(Icons.person, color: ColorManager.primary),
                          Text("اسم المريض",
                              softWrap: true,
                              overflow: TextOverflow.visible,
                              style:
                                  getMediumStyle(color: ColorManager.primary)),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                        readOnly: true,
                        label: "${widget.firstName} ${widget.lastName}",
                        controller: TextEditingController(
                            text: "${widget.firstName} ${widget.lastName}"),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.sticky_note_2_outlined,
                            color: ColorManager.primary,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            "التشخيص",
                            softWrap: true,
                            overflow: TextOverflow.visible,
                            style: getMediumStyle(color: ColorManager.primary),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        controller: diagnosisController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "من فضلك أدخل التشخيص";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          // labelText: "التشخيص",
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 214, 213, 213)
                                // color: Color.fromARGB(102, 0, 0, 0), width: 1.5
                                ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                            borderSide: const BorderSide(
                                color: ColorManager.red, width: 1.5),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                            borderSide: const BorderSide(
                                color: ColorManager.red, width: 1.5),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                              borderSide: const BorderSide(
                                  color: ColorManager.primary, width: 1.5)),
                          contentPadding: const EdgeInsets.all(Insets.s12),
                          labelStyle: getRegularStyle(
                              color: ColorManager.primary,
                              fontSize: FontSize.s18),
                          border: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1.5, color: ColorManager.red)),
                          errorStyle: TextStyle(
                            fontSize: FontSize.s14,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.medication,
                            color: ColorManager.primary,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            "العلاج",
                            softWrap: true,
                            overflow: TextOverflow.visible,
                            style: getMediumStyle(color: ColorManager.primary),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                          controller: treatmentController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "من فضلك أدخل العلاج";
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            // labelText: "العلاج",

                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                              borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 214, 213, 213)
                                  // color: Color.fromARGB(102, 0, 0, 0), width: 1.5
                                  ),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                              borderSide: const BorderSide(
                                  color: ColorManager.red, width: 1.5),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                              borderSide: const BorderSide(
                                  color: ColorManager.red, width: 1.5),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.r),
                                borderSide: const BorderSide(
                                    color: ColorManager.primary, width: 1.5)),
                            contentPadding: const EdgeInsets.all(Insets.s12),

                            // ),
                            labelStyle: getRegularStyle(
                                color: ColorManager.primary,
                                fontSize: FontSize.s18),

                            border: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1.5, color: ColorManager.red)),
                            // enabledBorder: InputBorder.none,
                            errorStyle: TextStyle(
                              fontSize: FontSize.s14,
                              // color: ColorManager.transparent,
                            ),
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.notes,
                            color: ColorManager.primary,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text("الملاحظات",
                              softWrap: true,
                              overflow: TextOverflow.visible,
                              style:
                                  getMediumStyle(color: ColorManager.primary)),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextField(
                          controller: notesController,
                          maxLines: 5,
                          decoration: InputDecoration(
                            // labelText: "الملاحظات",
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                              borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 214, 213, 213)
                                  // color: Color.fromARGB(102, 0, 0, 0), width: 1.5
                                  ),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                              borderSide: const BorderSide(
                                  color: ColorManager.red, width: 1.5),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                              borderSide: const BorderSide(
                                  color: ColorManager.red, width: 1.5),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.r),
                                borderSide: const BorderSide(
                                    color: ColorManager.primary, width: 1.5)),
                            contentPadding: const EdgeInsets.all(Insets.s12),

                            labelStyle: getRegularStyle(
                                color: ColorManager.primary,
                                fontSize: FontSize.s18),

                            border: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1.5, color: ColorManager.red)),
                            // enabledBorder: InputBorder.none,
                            errorStyle: TextStyle(
                              fontSize: FontSize.s14,
                              // color: ColorManager.transparent,
                            ),
                          )),
                      const SizedBox(height: 20),
                      CustomButton(
                          backgroundColor: ColorManager.primary,
                          onTap: () => _submitForm(),
                          label: "إضافة الفحص"),
                      // if (state is GetMedicalRecordError) CircularProgressIndicator(),
                    ],
                  ),
                );
              }),
            ),
          );
        }));
  }
  // ),
  // );
  // }
}
