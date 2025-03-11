import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/core/resources/color_manager.dart';
import 'package:graduation_project/core/resources/styles_manager.dart';

class DoctorItem extends StatelessWidget {
  const DoctorItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: ColorManager.blue,
          // color: Color.fromARGB(237, 202, 228, 236),
          border: Border.all(width: .1),
          borderRadius: BorderRadius.all(Radius.circular(25))),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child:
            // Row(
            //   children: [
            Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "د. محمد رمضان",
                  style: getSemiBoldStyle(
                      color: ColorManager.primary, fontSize: 20),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "كبير جراحين القلب",
                  style:
                      getMediumStyle(color: ColorManager.primary, fontSize: 13),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                  ],
                ),
              ],
            ),
            Spacer(),
            Image.asset(
              "assets/images/doctor_image2.png",
              height: 150,
              width: 150,
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
