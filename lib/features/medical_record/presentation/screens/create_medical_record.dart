// // import 'package:flutter/material.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';
// // import 'package:graduation_project/features/medical_record/data/model/medical_record_add_response/add_medical_record_model.dart';
// // import 'package:graduation_project/features/medical_record/presentation/cubit/medical_record_cubit.dart';
// // import 'package:graduation_project/features/medical_record/presentation/cubit/medical_record_states.dart';

// // class AddMedicalRecordScreen extends StatefulWidget {
// //   static const addMedicalRecord = "/addMedical";
// //   final int bookingId;
// //   final String firstName;
// //   final String lastName;
// //   // final String doctorToken;

// //   const AddMedicalRecordScreen({
// //     super.key,
// //     required this.bookingId,
// //     required this.firstName,
// //     required this.lastName,
// //     // required this.doctorToken,
// //   });

// //   @override
// //   State<AddMedicalRecordScreen> createState() => _AddMedicalRecordScreenState();
// // }

// // class _AddMedicalRecordScreenState extends State<AddMedicalRecordScreen> {
// //   final _formKey = GlobalKey<FormState>();
// //   final diagnosisController = TextEditingController();
// //   final treatmentController = TextEditingController();
// //   final notesController = TextEditingController();

// //   @override
// //   Widget build(BuildContext context) {
// //     return BlocConsumer<MedicalRecordCubit, MedicalResocrdSates>(
// //       listener: (context, state) {
// //         if (state is AddMedicalRecordSuccess) {
// //           ScaffoldMessenger.of(context).showSnackBar(
// //             SnackBar(content: Text('تم الإضافة بنجاح')),
// //           );
// //           Navigator.pop(context);
// //         } else if (state is GetMedicalRecordError) {
// //           ScaffoldMessenger.of(context).showSnackBar(
// //             SnackBar(content: Text(state.message)),
// //           );
// //         }
// //       },
// //       builder: (context, state) {
// //         final cubit = context.read<MedicalRecordCubit>();

// //         return Scaffold(
// //           appBar: AppBar(title: const Text("إضافة تشخيص")),
// //           body: Padding(
// //             padding: const EdgeInsets.all(16.0),
// //             child: Form(
// //               key: _formKey,
// //               child: ListView(
// //                 children: [
// //                   Text("اسم المريض: ${widget.firstName} ${widget.lastName}"),
// //                   const SizedBox(height: 16),
// //                   TextFormField(
// //                     controller: diagnosisController,
// //                     decoration: const InputDecoration(labelText: 'التشخيص'),
// //                     validator: (value) =>
// //                         value!.isEmpty ? 'أدخل التشخيص' : null,
// //                   ),
// //                   const SizedBox(height: 16),
// //                   TextFormField(
// //                     controller: treatmentController,
// //                     decoration: const InputDecoration(labelText: 'العلاج'),
// //                     validator: (value) => value!.isEmpty ? 'أدخل العلاج' : null,
// //                   ),
// //                   const SizedBox(height: 16),
// //                   TextFormField(
// //                     controller: notesController,
// //                     decoration: const InputDecoration(labelText: 'الملاحظات'),
// //                     validator: (value) =>
// //                         value!.isEmpty ? 'أدخل الملاحظات' : null,
// //                     maxLines: 3,
// //                   ),
// //                   const SizedBox(height: 24),
// //                   state is GetMedicalRecordLoading
// //                       ? const Center(child: CircularProgressIndicator())
// //                       : ElevatedButton(
// //                           onPressed: () {
// //                             if (_formKey.currentState!.validate()) {
// //                               final model = AddMedicalRecordModel(
// //                                 bookingsId: widget.bookingId,
// //                                 diagnosis: diagnosisController.text.trim(),
// //                                 treatment: treatmentController.text.trim(),
// //                                 notes: notesController.text.trim(),
// //                               );
// //                               cubit.addMedicalRecord(model);
// //                             }
// //                           },
// //                           child: const Text('إرسال'),
// //                         ),
// //                 ],
// //               ),
// //             ),
// //           ),
// //         );
// //       },
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:graduation_project/core/resources/color_manager.dart';
// import 'package:graduation_project/features/medical_record/data/model/medical_record_add_response/add_medical_record_model.dart';
// import 'package:graduation_project/features/medical_record/presentation/cubit/medical_record_cubit.dart';
// import 'package:graduation_project/features/profile/data/model/profile_response/profile_data_model.dart';

// class AddMedicalRecordScreen extends StatelessWidget {
//   final TextEditingController diagnosisController = TextEditingController();
//   final TextEditingController notesController = TextEditingController();
//   final TextEditingController treatmentController = TextEditingController();
//   static const addMedicalRecord = "/addMedical";

//   AddMedicalRecordScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final args = ModalRoute.of(context)!.settings.arguments as ProfileDataModel;
//     final firstName = args.firstName;
//     final lastName = args.lastName;
//     final id = args.id;

//     return Scaffold(
//       appBar: AppBar(
//         title: Text("إضافة سجل طبي"),
//         backgroundColor: ColorManager.primary,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: ListView(
//           children: [
//             Text("اسم المريض: $firstName $lastName"),
//             const SizedBox(height: 20),
//             TextField(
//               controller: diagnosisController,
//               decoration: const InputDecoration(labelText: "التشخيص"),
//             ),
//             TextField(
//               controller: notesController,
//               decoration: const InputDecoration(labelText: "الملاحظات"),
//             ),
//             TextField(
//               controller: treatmentController,
//               decoration: const InputDecoration(labelText: "العلاج"),
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 // Call Cubit here to add the record
//                 context
//                     .read<MedicalRecordCubit>()
//                     .addMedicalRecord(AddMedicalRecordModel(
//                       diagnosis: diagnosisController.text,
//                       notes: notesController.text,
//                       treatment: treatmentController.text,
//                     ));
//                 Navigator.pop(context); // نرجع بعد الإضافة
//               },
//               child: const Text("إضافة"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

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
  bool isLoading = true;
  void _submitForm() {
    if (isLoading) return;
    if (formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });
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
            setState(() {
              isLoading = false;
            });
            Navigator.of(context).pop();
          } else if (state is GetMedicalRecordError) {
            UIUtils.showMessage(context, "تعذر إضافة الفحص", ColorManager.red);
            setState(() {
              isLoading = false;
            });
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
