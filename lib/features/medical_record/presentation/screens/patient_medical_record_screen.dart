import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/constants.dart';
import 'package:graduation_project/core/resources/color_manager.dart';
import 'package:graduation_project/core/resources/font_manager.dart';
import 'package:graduation_project/core/resources/styles_manager.dart';
import 'package:graduation_project/core/utils/formated.dart';
import 'package:graduation_project/core/widgets/error_indicator.dart';
import 'package:graduation_project/core/widgets/loading_indicator.dart';
import 'package:graduation_project/features/medical_record/presentation/cubit/medical_record_cubit.dart';
import 'package:graduation_project/features/medical_record/presentation/cubit/medical_record_states.dart';
import 'package:graduation_project/features/medical_record/presentation/widgets/medical_record_card.dart';

class PatientMedicalRecordScreen extends StatefulWidget {
  const PatientMedicalRecordScreen({super.key});
  static const patientMedicalRecord = "/patient";

  @override
  State<PatientMedicalRecordScreen> createState() =>
      _PatientMedicalRecordScreenState();
}

class _PatientMedicalRecordScreenState
    extends State<PatientMedicalRecordScreen> {
  @override
  void initState() {
    super.initState();
    final currentMonth = DateTime(DateTime.now().year, DateTime.now().month);
    selectedMonth = currentMonth;
    context.read<MedicalRecordCubit>().getPatientMedicalRecord().then((value) {
      context.read<MedicalRecordCubit>().changeMonth(currentMonth);
    });
  }

  // final months = [
  //   'يناير',
  //   "فبراير",
  //   "مارس",
  //   "أبريل",
  //   "مايو",
  //   "يونيو",
  //   "يوليو",
  //   "أغسطس",
  //   "سبتمبر",
  //   "أكتوبر",
  //   "نوفمبر",
  //   "ديسمبر"
  // ];
  final List<DateTime> months =
      List.generate(12, (index) => DateTime(DateTime.now().year, index + 1));

  DateTime? selectedMonth;

  // String formatArabicDateTime(String dateString) {
  //   final date = DateTime.tryParse(dateString);
  //   if (date == null) return "تاريخ غير صالح";
  //   // final months = [
  //   //   'يناير',
  //   //   "فبراير",
  //   //   "مارس",
  //   //   "أبريل",
  //   //   "مايو",
  //   //   "يونيو",
  //   //   "يوليو",
  //   //   "أغسطس",
  //   //   "سبتمبر",
  //   //   "أكتوبر",
  //   //   "نوفمبر",
  //   //   "ديسمبر"
  //   // ];
  //   final day = date.day;
  //   final month = months[date.month - 1];
  //   final year = date.year;
  //   final hour = date.hour > 12 ? date.hour - 12 : date.hour;
  //   final minute = date.minute.toString().padLeft(2, '0');
  //   final period = date.hour >= 12 ? 'م' : "ص";
  //   return "$day $month $year - ${hour.toString().padLeft(2, '0')}:$minute $period";
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<MedicalRecordCubit, MedicalResocrdSates>(
        builder: (context, state) {
          if (state is GetMedicalRecordLoading) {
            return const Center(child: LoadingIndicator());
          } else if (state is GetMedicalRecordError) {
            return const Center(child: ErrorIndicator());
          } else if (state is GetMedicalRecordPatientSuccess) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .5,
                    // height: 70,
                    child: DropdownButtonFormField(
                      // items: DropdownButton<String>(
                      //   hint: const Text("اختر الشهر"),
                      value: selectedMonth,

                      decoration: InputDecoration(
                        filled: true,
                        fillColor: ColorManager.transparent,
                        // focusColor: ColorManager.primary,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 214, 213, 213)
                                // color: Color.fromARGB(102, 0, 0, 0), width: 1.5
                                )),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                            borderSide: const BorderSide(
                                color: ColorManager.primary, width: 1.5)),
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
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.r)),
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 214, 213, 213))),
                        hintText: "اختر الشهر",
                        hintStyle: getMediumStyle(
                            color: ColorManager.grey, fontSize: FontSize.s16),
                      ),

                      items: months.map((month) {
                        return DropdownMenuItem<DateTime>(
                            value: month,
                            child: Text(
                              FormatedDate.formatArabicMonthYear(month),
                              style: getRegularStyle(
                                  color: ColorManager.textColor),
                            ),
                            onTap: () => setState(() {
                                  selectedMonth = month;
                                }));
                      }).toList(),
                      onChanged: (selected) {
                        if (selected != null) {
                          setState(() {
                            selectedMonth = selected;
                          });
                          context
                              .read<MedicalRecordCubit>()
                              .changeMonth(selected);
                        }
                      },
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // ),
                  Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ColorManager.blue,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.assignment_rounded,
                          color: ColorManager.primary,
                        ),
                        Text(
                          ' السجل الطبي لشهر ${selectedMonth != null ? FormatedDate.formatArabicMonthYear(selectedMonth!) : ''}',
                          style: getSemiBoldStyle(color: ColorManager.primary),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: state.medicalRecord.isEmpty
                        ? Center(
                            child: Text(
                              "لا يوجد سجلات لهذا الشهر",
                              style:
                                  getMediumStyle(color: ColorManager.primary),
                            ),
                          )
                        : ListView.builder(
                            itemCount: state.medicalRecord.length,
                            itemBuilder: (context, index) => MedicalRecordCard(
                                  onDelete: () {},
                                  onEdit: () {},
                                  isDoctor: false,
                                  medicalRecordPatientEntity:
                                      state.medicalRecord[index],
                                )),
                  ),
                ],
              ),
            );
          } else if (state is InitialState) {
            return const SizedBox();
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
