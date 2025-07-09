import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:graduation_project/core/resources/color_manager.dart';
import 'package:graduation_project/core/resources/styles_manager.dart';
import 'package:graduation_project/core/utils/formated.dart';
import 'package:graduation_project/features/medical_record/domain/entity/medical_record_patient_entity.dart';

class MedicalRecordCard extends StatefulWidget {
  final bool isDoctor;
  // final VoidCallback onEdit;
  // final VoidCallback onDelete;
  const MedicalRecordCard({
    super.key,
    required this.medicalRecordPatientEntity,
    required this.isDoctor,
    // required this.onEdit,
    // required this.onDelete
  });
  final MedicalRecordPatientEntity medicalRecordPatientEntity;
  @override
  State<MedicalRecordCard> createState() => _MedicalRecordCardState();
}

class _MedicalRecordCardState extends State<MedicalRecordCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: ColorManager.blue,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: .4, color: ColorManager.primary)),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "تم التسجيل بتاريخ  ",
                    style: getMediumStyle(color: ColorManager.primary),
                  ),
                  Text(
                    // FormatedDate.formateArabicDate(
                    FormatedDate.formatArabicDateTime(
                        widget.medicalRecordPatientEntity.dateOfVisit ?? ''),
                    // ?? '',
                    // day: ''),
                    style: getMediumStyle(color: ColorManager.primary),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.person,
                        color: ColorManager.primary,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "اسم الدكتور : ",
                        softWrap: true,
                        overflow: TextOverflow.visible,
                        style: getMediumStyle(color: ColorManager.primary),
                      ),
                    ],
                  ),
                  Text(
                    " ${widget.medicalRecordPatientEntity.doctorName}",
                    softWrap: true,
                    overflow: TextOverflow.visible,
                    style: getMediumStyle(color: ColorManager.textColor),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
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
                        "التشخيص : ",
                        softWrap: true,
                        overflow: TextOverflow.visible,
                        style: getMediumStyle(color: ColorManager.primary),
                      ),
                    ],
                  ),
                  Text(
                    "${widget.medicalRecordPatientEntity.diagnosis}",
                    softWrap: true,
                    overflow: TextOverflow.visible,
                    style: getMediumStyle(color: ColorManager.textColor),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
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
                        "العلاج : ",
                        softWrap: true,
                        overflow: TextOverflow.visible,
                        style: getMediumStyle(color: ColorManager.primary),
                      ),
                    ],
                  ),
                  Text(
                    "${widget.medicalRecordPatientEntity.treatment}",
                    softWrap: true,
                    overflow: TextOverflow.visible,
                    style: getMediumStyle(color: ColorManager.textColor),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.notes,
                        color: ColorManager.primary,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "الملاحظات : ",
                        softWrap: true,
                        overflow: TextOverflow.visible,
                        style: getMediumStyle(color: ColorManager.primary),
                      ),
                    ],
                  ),
                  Text(
                    "${widget.medicalRecordPatientEntity.notes}",
                    softWrap: true,
                    overflow: TextOverflow.visible,
                    style: getMediumStyle(color: ColorManager.textColor),
                  ),
                ],
              ),
              //   if (widget.isDoctor == true) ...[
              //     Row(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       children: [
              //         TextButton(
              //             onPressed: widget.onDelete,
              //             child: Text(
              //               "حذف",
              //               style: getMediumStyle(color: ColorManager.red),
              //             )),
              //         TextButton(
              //             onPressed: widget.onEdit,
              //             child: Text(
              //               "تعديل",
              //               style: getMediumStyle(color: ColorManager.primary),
              //             ))
              //       ],
              //     )
              //   ]
            ],
          ),
        ),
      ),
    );
  }
}
