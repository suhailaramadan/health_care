import 'dart:io';

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
import 'package:graduation_project/features/medical_record/data/model/update_medical_record_response/update_medical_record_model.dart';
import 'package:graduation_project/features/medical_record/presentation/cubit/medical_record_cubit.dart';
import 'package:graduation_project/features/medical_record/presentation/cubit/medical_record_states.dart';

class UpdateMedicalRecord extends StatefulWidget {
  static const updatMedicalRecord = "/updateMedical";
  const UpdateMedicalRecord(
      {super.key,
      required this.firstName,
      required this.lastName,
      required this.bookingId,
      required this.diagnosis,
      required this.treatment,
      required this.notes});

  final int bookingId;
  final String diagnosis;
  final String treatment;
  final String notes;
  final String firstName;
  final String lastName;
  @override
  State<UpdateMedicalRecord> createState() => _UpdateMedicalRecordState();
}

class _UpdateMedicalRecordState extends State<UpdateMedicalRecord> {
  final formKey = GlobalKey<FormState>();
  late TextEditingController diagnosisController;
  late TextEditingController treatmentController;
  late TextEditingController notesController;
  @override
  void initState() {
    super.initState();
    diagnosisController = TextEditingController(text: widget.diagnosis);
    treatmentController = TextEditingController(text: widget.treatment);
    notesController = TextEditingController(text: widget.notes);
  }

  void _submitForm() {
    if (formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(
              color: ColorManager.primary,
            ),
          );
        },
      );
      context
          .read<MedicalRecordCubit>()
          .updateMedicalRecord(
              UpdateMedicalRecordModel(
                  diagnosis: diagnosisController.text,
                  treatment: treatmentController.text,
                  notes: notesController.text),
              widget.bookingId)
          .then((value) => Navigator.pop(context));
      // context.read<MedicalRecordCubit>().getPatientMedicalRecord();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "تحديث الفحص",
          style: getMediumStyle(color: ColorManager.textColor),
        ),
        centerTitle: true,
      ),
      body: BlocConsumer<MedicalRecordCubit, MedicalResocrdSates>(
        listener: (context, state) {
          if (state is UpdateMedicalRecordSuccess) {
            UIUtils.showMessage(
                context, "تم تحديث الفحص بنجاح", ColorManager.green);
            Navigator.pop(context);
            context.read<MedicalRecordCubit>().getPatientMedicalRecord();
          } else if (state is GetMedicalRecordError) {
            return UIUtils.showMessage(
                context, state.message, ColorManager.red);
          }
        },
        builder: (context, state) {
          return Padding(
              padding: const EdgeInsets.all(8),
              child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 80,
                      ),
                      // Text("اسم المريض",
                      // style: getMediumStyle(color: ColorManager.primary)),
                      CustomTextField(
                        readOnly: true,
                        label: "اسم المريض",
                        controller: TextEditingController(
                            text: "${widget.firstName} ${widget.lastName}"),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      // Text(
                      //   "التشخيص",
                      //   style: getMediumStyle(color: ColorManager.primary),
                      // ),
                      TextFormField(
                        controller: diagnosisController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "من فضلك أدخل التشخيص";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: "التشخيص",
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
                              color: ColorManager.grey, fontSize: FontSize.s18),
                          border: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1.5, color: ColorManager.red)),
                          errorStyle: TextStyle(
                            fontSize: FontSize.s0,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      // Text(
                      //   "العلاج",
                      //   style: getMediumStyle(color: ColorManager.primary),
                      // ),
                      TextFormField(
                          controller: treatmentController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "من فضلك أدخل العلاج";
                            } else
                              return null;
                          },
                          decoration: InputDecoration(
                            labelText: "العلاج",

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
                                color: ColorManager.textColor,
                                fontSize: FontSize.s18),

                            border: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1.5, color: ColorManager.red)),
                            // enabledBorder: InputBorder.none,
                            errorStyle: TextStyle(
                              fontSize: FontSize.s0,
                              // color: ColorManager.transparent,
                            ),
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      // Text("الملاحظات",
                      //     style: getMediumStyle(color: ColorManager.primary)),
                      TextField(
                          controller: notesController,
                          decoration: InputDecoration(
                            labelText: "الملاحظات",
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
                              fontSize: FontSize.s0,
                              // color: ColorManager.transparent,
                            ),
                          )),
                      const SizedBox(height: 20),
                      CustomButton(
                          backgroundColor: ColorManager.primary,
                          onTap: () => state is GetMedicalRecordLoading
                              ? null
                              : _submitForm(),
                          label: "تحديث الفحص"),
                    ],
                  )));
        },
      ),
    );
  }
}
