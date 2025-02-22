import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/resources/color_manager.dart';
import 'package:graduation_project/core/resources/font_manager.dart';
import 'package:graduation_project/core/resources/styles_manager.dart';

class CustomClinicComponant extends StatelessWidget {
  const CustomClinicComponant({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
          margin: const EdgeInsets.all(10),
          height: 120.h,
          decoration: BoxDecoration(
              // color: ColorManager.red,
              borderRadius: BorderRadius.circular(20),
              // boxShadow: [
              //   BoxShadow(
              //       blurRadius: 15,
              //       offset: Offset(0, .2),
              //       color: ColorManager.grey.withOpacity(.02))
              // ],
              border: Border.all(width: .2, color: ColorManager.grey)),
          // color: Colors.amber,
          // height: 100,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // ClipRRect(
              //   borderRadius: BorderRadius.only(
              //       topRight: Radius.circular(20),
              //       bottomRight: Radius.circular(20)),
              //   child:
              Image.asset(
                image,
                height: 120.h,
                width: 150.w,
                fit: BoxFit.fill,
                // ),
              ),
              const SizedBox(
                width: 25,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "عيادة جراحة القلب",
                      style: getMediumStyle(color: ColorManager.kuhly),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextButton(
                        style: const ButtonStyle(
                            shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)))),
                            padding:
                                MaterialStatePropertyAll(EdgeInsets.all(10)),
                            backgroundColor:
                                MaterialStatePropertyAll(ColorManager.primary)),
                        onPressed: () {},
                        child: Text(
                          "احجز معنا",
                          style: getMediumStyle(
                              color: ColorManager.white,
                              fontSize: FontSize.s15),
                        ))
                    // CustomButton(
                    //   size: Size(100, 40),
                    //   backgroundColor: ColorManager.primary,
                    //   // size: Size(1, 1),
                    //   label: "احجز معنا",
                    //   textStyle: getRegularStyle(color: ColorManager.white),
                    //   onTap: () {},
                    // ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
