import 'package:flutter/material.dart';
import 'package:graduation_project/core/resources/color_manager.dart';
import 'package:graduation_project/core/resources/styles_manager.dart';
import 'package:graduation_project/core/utils/formated.dart';

// class DoctorAppointmentItem extends StatelessWidget {
//   final String day;
//   final String startTime;
//   final String endTime;
//   final bool isAvailable;

//   const DoctorAppointmentItem({
//     Key? key,
//     required this.day,
//     required this.startTime,
//     required this.endTime,
//     required this.isAvailable,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       elevation: 3,
//       child: Padding(
//         padding: const EdgeInsets.all(16),
//         child:
//             //  Column(
//             //   children: [
//             // Titles Row
//             // Row(
//             //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             //   children: [
//             //     Expanded(
//             //         child: Text("اليوم",
//             //             textAlign: TextAlign.center,
//             //             style: Theme.of(context).textTheme.titleSmall)),
//             //     Expanded(
//             //         child: Text("البداية",
//             //             textAlign: TextAlign.center,
//             //             style: Theme.of(context).textTheme.titleSmall)),
//             //     Expanded(
//             //         child: Text("النهاية",
//             //             textAlign: TextAlign.center,
//             //             style: Theme.of(context).textTheme.titleSmall)),
//             //     Expanded(
//             //         child: Text("الإجراءات",
//             //             textAlign: TextAlign.center,
//             //             style: Theme.of(context).textTheme.titleSmall)),
//             //   ],
//             // ),
//             // const SizedBox(height: 8),
//             // Data Row
//             Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Expanded(
//                 child: Text(day,
//                     textAlign: TextAlign.center,
//                     style: Theme.of(context).textTheme.bodyMedium)),
//             Expanded(
//                 child: Text(startTime,
//                     textAlign: TextAlign.center,
//                     style: Theme.of(context).textTheme.bodyMedium)),
//             Expanded(
//                 child: Text(endTime,
//                     textAlign: TextAlign.center,
//                     style: Theme.of(context).textTheme.bodyMedium)),
//             Expanded(
//               child: Center(
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: isAvailable ? Colors.red : Colors.green,
//                     minimumSize: const Size(80, 36),
//                     padding: EdgeInsets.zero,
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8)),
//                   ),
//                   onPressed: () {
//                     // هنكتب هنا بعدين لما تحدد الإجراء المطلوب
//                   },
//                   child: Text(
//                     isAvailable ? "تعطيل" : "تفعيل",
//                     style: const TextStyle(fontSize: 14),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//         // ],
//         // ),
//       ),
//     );
//   }
// }

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
