import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/core/resources/color_manager.dart';
import 'package:graduation_project/core/resources/styles_manager.dart';

class DoctorItem extends StatelessWidget {
  const DoctorItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
          // color: Color(0xff01984A5),
          // color: Color.fromARGB(237, 202, 228, 236),
          // border: Border.all(width: .1),
          borderRadius: BorderRadius.all(Radius.circular(25))),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child:
            // Row(
            //   children: [
            Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Directionality(
              textDirection: TextDirection.ltr,
              child: Image.asset(
                "assets/images/doctor_image2.png",
                height: 150,
                width: 150,
              ),
            ),
            Text(
              "د. محمد رمضان",
              style: getSemiBoldStyle(color: ColorManager.kuhly, fontSize: 15),
            ),
            Text(
              "جراح أسنان",
              style: getMediumStyle(color: ColorManager.kuhly, fontSize: 10),
            ),
            // SizedBox(
            //   height: 15,
            // ),
          ],
        ),
        //   ],
        // ),
      ),
    );
  }
}
