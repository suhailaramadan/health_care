import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graduation_project/core/constants.dart';
import 'package:graduation_project/core/resources/color_manager.dart';
import 'package:graduation_project/core/resources/font_manager.dart';
import 'package:graduation_project/core/resources/image_manager.dart';
import 'package:graduation_project/core/resources/styles_manager.dart';
import 'package:graduation_project/core/resources/value_manager.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/features/user/clinic/domain/entities/clinic_entity.dart';
import 'package:graduation_project/features/user/clinic/presentation/widget/clinic_details.dart';
import 'package:graduation_project/features/user/clinic/presentation/widget/custom_clinic_componant.dart';

class ClinicItem extends StatelessWidget {
  const ClinicItem({
    super.key,
    //  required this.image, required this.clinicName,
    required this.clinicEntity,
  });
  final ClinicEntity clinicEntity;
  // final String image;
  // final String clinicName;
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.sizeOf(context);
    // final bool isLandscape = screenSize.width > screenSize.height;
    // final bool isLargeTablet =
    //     screenSize.width > 600 && screenSize.width < screenSize.height;
    // final bool isSmallScreen = screenSize.width <= 400;
    // final bool isMediumScreen =
    //     screenSize.width >= 600 && screenSize.width <= 800;
    // final isLargeScreen = screenSize.width > 800;
    final bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    //     screenSize.width > screenSize.height || isLargeTablet;
    // double getResponsiveFontSize(String itemType) {
    //   switch (itemType) {
    //     case 'ButtonWidth':
    //       return isLandscape ? 120.w : 150.w;
    //     case 'ButtonHeight':
    //       return isLandscape ? 40.h : 5.h;
    //     case 'ImageHeight':
    //       return isLandscape ? 180.h : 220.h;
    //     case 'ImageWidth':
    //       return isLandscape ? 250.w : 300.w;
    //     case 'IconSize':
    //       return isLandscape ? 20.w : 25.w;
    //     case 'Text':
    //       return isLandscape ? 14.sp : 15.sp;
    //     case 'Padding':
    //       return isLandscape ? 8.w : 12.w;
    //     case 'Hieight':
    //       return isLandscape ? 180.h : 220.h;
    //     case 'Width':
    //       return isLandscape ? 120.w : 150.w;
    //     case 'Size':
    //       return isLandscape ? 30.w : 40.w;
    //     default:
    //       return 50.w;
    //   }
    //   // if (isLandscape) {
    //   //   if (screenSize.width < 600) {
    //   //     return 80.w;
    //   //   } else if (screenSize.width < 900) {
    //   //     return 100.w;
    //   //   } else {
    //   //     return 120.w;
    //   //   }
    //   // } else {
    //   //   if (screenSize.width < 360) {
    //   //     return 100.w;
    //   //   } else if (screenSize.width < 600) {
    //   //     return 120.w;
    //   //   } else if (screenSize.width < 900) {
    //   //     return 150.w;
    //   //   } else {
    //   //     return 180.w;
    //   //   }
    //   // }
    // }

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const ClinicDetails(),
            settings: RouteSettings(arguments: clinicEntity
                //   ClinicDetailsArg(
                // id: clinicEntity.id,
                // name: clinicEntity.name,
                // imageUrl: clinicEntity.imageUrl,
                // )
                )));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        color: ColorManager.white,
        // height: 80,
        width: isLandscape ? 120.w : 150.w,

        child: Column(
          // mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: ColorManager.textColor, width: .5),
                  borderRadius: BorderRadius.circular(15)),
              // height: getResponsiveFontSize('Height'),
              height: 80,
              width: 150,

              //  isLandscape
              //     ? screenSize.width * .14
              //     : screenSize.height * .11,
              // width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child:
                    // Image.asset("assets/images/heart_clinic.png"),
                    CachedNetworkImage(
                        imageUrl:
                            "${ApiConstants.imageBaseUrl}${clinicEntity.imageUrl}",
                        fit: BoxFit.fill,
                        // height: 100,
                        // width: 150,
                        placeholder: (context, url) => const Center(
                              child: CircularProgressIndicator(
                                color: ColorManager.greyDark,
                              ),
                            ),
                        errorWidget: (context, url, error) => const Center(
                            child: Icon(Icons.error_outline_outlined,
                                color: ColorManager.red, size: 30))
                        // Image.asset(
                        //   "assets/images/brain_clinic.png",
                        //   // height: 100.w,
                        //   // width: 50,
                        //   // width: double.infinity,
                        //   fit: BoxFit.fill,
                        // ),
                        ),
              ),
            ),
            Text(
              clinicEntity.name,
              softWrap: true,
              overflow: TextOverflow.visible,
              style: getSemiBoldStyle(
                color: ColorManager.primary,
              ),
            ),
          ],
        ),
      ),
      // ),
    );
  }
}
