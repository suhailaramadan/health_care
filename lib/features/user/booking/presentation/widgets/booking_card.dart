import 'package:flutter/material.dart';
import 'package:graduation_project/core/resources/color_manager.dart';
import 'package:graduation_project/core/resources/styles_manager.dart';
import 'package:graduation_project/core/utils/formated_date_time.dart';

class BookingCard extends StatelessWidget {
  final String doctorFirstName;
  final String doctorlastName;
  final String clinicName;
  final String doctorImage;
  final String bookingDate;
  final String bookingTime;
  final VoidCallback onCancel;
  final VoidCallback onReschedule;
  const BookingCard(
      {super.key,
      required this.clinicName,
      required this.doctorImage,
      required this.bookingDate,
      required this.bookingTime,
      required this.onCancel,
      required this.onReschedule,
      required this.doctorFirstName,
      required this.doctorlastName});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColorManager.white,
      surfaceTintColor: ColorManager.white,
      margin: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 35,
                  backgroundImage: AssetImage(doctorImage),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(
                    " د/ $doctorFirstName $doctorlastName",
                    style: getSemiBoldStyle(
                        color: ColorManager.black, fontSize: 18),
                  ),
                  Text(
                    clinicName,
                    style: getSemiBoldStyle(color: ColorManager.grey),
                  ),
                ])
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Text(
                  FormatedDate.formateArabicDate(bookingDate, day: ""),
                  style: getLightStyle(color: ColorManager.black),
                ),
                const SizedBox(
                  width: 7,
                ),
                Text(
                  FormatedDate.formateTime(bookingTime),
                  style: getLightStyle(color: ColorManager.black),
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: onReschedule,
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(12),
                      backgroundColor: ColorManager.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      "إعادة حجز",
                      style: getRegularStyle(color: ColorManager.white),
                    )),
                OutlinedButton(
                    onPressed: onCancel,
                    style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.all(12),
                        backgroundColor: ColorManager.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        )),
                    child: Text("إلغاء الحجز",
                        style: getRegularStyle(color: ColorManager.red)))
              ],
            )
          ],
        ),
      ),
    );
  }
}
