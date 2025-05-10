import 'package:flutter/material.dart';
import 'package:graduation_project/core/resources/color_manager.dart';
import 'package:graduation_project/core/resources/styles_manager.dart';
import 'package:graduation_project/core/utils/formated.dart';

class DoctorAppointmentItem extends StatelessWidget {
  final String day;
  final String startTime;
  final String endTime;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const DoctorAppointmentItem({
    super.key,
    required this.day,
    required this.startTime,
    required this.endTime,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
      ),
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spa,
        children: [
          Spacer(),
          Text(
            FormatedDate.formateArabicDate(day, day: day),
            style: getMediumStyle(color: ColorManager.textColor),
          ),
          Spacer(),
          Text(
            FormatedDate.formateTime(startTime),
            style: getRegularStyle(color: ColorManager.textColor),
          ),
          Spacer(),
          Text(
            FormatedDate.formateTime(endTime),
            style: getRegularStyle(color: ColorManager.textColor),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.edit_square,
                  color: ColorManager.primary,
                  size: 22,
                ),
                onPressed: onEdit,
              ),
              IconButton(
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                  size: 25,
                ),
                onPressed: onDelete,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
