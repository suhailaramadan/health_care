import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/constants.dart';
import 'package:graduation_project/core/resources/color_manager.dart';
import 'package:graduation_project/core/resources/font_manager.dart';
import 'package:graduation_project/core/resources/image_manager.dart';
import 'package:graduation_project/core/resources/styles_manager.dart';
import 'package:graduation_project/core/widgets/custom_botton.dart';
import 'package:graduation_project/core/widgets/custom_text_field.dart';
import 'package:graduation_project/core/widgets/loading_indicator.dart';
import 'package:graduation_project/features/user/clinic/domain/entities/clinic_entity.dart';

class CustomClinicComponant extends StatelessWidget {
  const CustomClinicComponant({
    super.key,
    required this.clinicEntity,
  });
  final ClinicEntity clinicEntity;
  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Container(
            height: 180,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 1.5, color: ColorManager.greyDark),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.r),
                  child: CachedNetworkImage(
                    imageUrl:
                        "${ApiConstants.clinicBaseUrl}${clinicEntity.imageUrl}",
                    imageBuilder: (context, imageProvider) => Image(
                      image: imageProvider,
                      filterQuality: FilterQuality.high,
                    ),
                    placeholder: (context, url) => Center(
                      child: CircularProgressIndicator(
                        color: ColorManager.kuhly,
                      ),
                    ),
                    errorWidget: (context, url, error) => Image.asset(
                      "assets/images/heart_clinic.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 8.0),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Text(
                //         clinicEntity.name,
                //         style: getSemiBoldStyle(color: ColorManager.textColor),
                //       ),
                //       // SizedBox(
                //       //   height: 10.h,
                //       // ),
                //       // Padding(
                //       //   padding: EdgeInsets.only(
                //       //       right: MediaQuery.of(context).size.width * .5,
                //       //       left: 5),
                //       // child:
                //       CustomButton(
                //         label: "احجز الآن",
                //         onTap: () {},
                //         backgroundColor: ColorManager.primary,
                //       ),
                //       // ),
                //     ],
                //   ),
                // )
              ],
            ),
          ),
        )
        //
        //     Row(
        //   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     // ClipRRect(
        //     //   borderRadius: BorderRadius.only(
        //     //       topRight: Radius.circular(20),
        //     //       bottomRight: Radius.circular(20)),
        //     //   child:
        //     CachedNetworkImage(
        //       imageUrl: "${ApiConstants.clinicBaseUrl}${clinicEntity.imageUrl}",
        //       height: 100.w,
        //       width: double.infinity,
        //       fit: BoxFit.fill,
        //       placeholder: (context, url) => Center(
        //         child: LoadingIndicator(),
        //       ),
        //       errorWidget: (context, url, error) => Image.asset(
        //         ImageManager.doctor_image, // حطي الصورة الافتراضية هنا
        //         height: 100.w,
        //         width: double.infinity,
        //         // fit: BoxFit.fill,
        //       ),
        //     ),

        //     // // const SizedBox(
        //     //   height: 18,
        //     // ),
        //     Padding(
        //       padding: const EdgeInsets.only(left: 20.0),
        //       child: Column(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         children: [
        //           Text(
        //             // "عيادة القلب",
        //             clinicEntity.name,
        //             style: getMediumStyle(color: ColorManager.kuhly),
        //           ),
        //           const SizedBox(
        //             width: 10,
        //           ),
        //           TextButton(
        //               style: const ButtonStyle(
        //                   shape: MaterialStatePropertyAll(
        //                       RoundedRectangleBorder(
        //                           borderRadius:
        //                               BorderRadius.all(Radius.circular(5)))),
        //                   padding: MaterialStatePropertyAll(EdgeInsets.all(10)),
        //                   backgroundColor:
        //                       MaterialStatePropertyAll(ColorManager.primary)),
        //               onPressed: () {},
        //               child: Text(
        //                 "احجز معنا",
        //                 style: getMediumStyle(
        //                     color: ColorManager.white, fontSize: FontSize.s15),
        //               ))
        //           // CustomButton(
        //           //   size: Size(100, 40),
        //           //   backgroundColor: ColorManager.primary,
        //           //   // size: Size(1, 1),
        //           //   label: "احجز معنا",
        //           //   textStyle: getRegularStyle(color: ColorManager.white),
        //           //   onTap: () {},
        //           // ),
        //         ],
        //       ),
        //     )
        //   ],
        // )
        // // )),
        );
  }
}
