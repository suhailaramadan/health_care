import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/constants.dart';
import 'package:graduation_project/core/resources/color_manager.dart';
import 'package:graduation_project/core/resources/font_manager.dart';
import 'package:graduation_project/core/resources/styles_manager.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/features/doctor/domain/entities/doctor_entity.dart';
import 'package:graduation_project/features/doctor/presentation/widgets/doctor_details.dart';

class CustomDoctor extends StatelessWidget {
  const CustomDoctor({super.key, required this.doctorEntity});
  final DoctorEntity doctorEntity;
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.sizeOf(context);

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
    //       return isLandscape ? 180.h : 150.h;
    //     case 'ImageWidth':
    //       return isLandscape ? 250.w : 300.w;
    //     case 'IconSize':
    //       return isLandscape ? 20.w : 25.w;
    //     case 'Text':
    //       return isLandscape ? 18.sp : 15.sp;
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
    // }

    // return Directionality(
    //   textDirection: TextDirection.rtl,
    //   child: InkWell(
    //       onTap: () => Navigator.of(context).push(MaterialPageRoute(
    //           builder: (context) => const DoctorDetails(),
    //           settings: RouteSettings(
    //               arguments: DoctorArg(
    //                   doctorEntity.clinicId,
    //                   doctorEntity.clinicName,
    //                   doctorEntity.description,
    //                   doctorEntity.firstName,
    //                   doctorEntity.id,
    //                   doctorEntity.lastName,
    //                   doctorEntity.specialty,
    //                   doctorEntity.imageUrl)))),
    //       child: Container(
    //         margin: EdgeInsets.symmetric(horizontal: 8),
    //         height: screenSize.height * 0.7,
    //         width: screenSize.width * .5,
    //         decoration: BoxDecoration(
    //           border: Border.all(
    //             color: ColorManager.primary.withOpacity(0.3),
    //             width: 2,
    //           ),
    //           borderRadius: BorderRadius.circular(16.r),
    //         ),
    //         child: Column(
    //           children: [
    //             ClipRRect(
    //               borderRadius: BorderRadius.circular(20),
    //               child: CachedNetworkImage(
    //                 imageUrl:
    //                     "${ApiConstants.imageBaseUrl}${doctorEntity.imageUrl}",
    //                 height: isLandscape
    //                     ? screenSize.width * .2
    //                     : screenSize.height * .24,
    //                 fit: BoxFit.cover,
    //               ),
    //             ),
    //             Text("${doctorEntity.firstName} ${doctorEntity.lastName}")
    //           ],
    //         ),
    //       )),
    // );
    return InkWell(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => DoctorDetails(
                doctorId: doctorEntity.id ?? '',
              ),
          settings: RouteSettings(
              arguments: DoctorArg(
                  doctorEntity.clinicId,
                  doctorEntity.clinicName,
                  doctorEntity.description,
                  doctorEntity.firstName,
                  doctorEntity.id,
                  doctorEntity.lastName,
                  doctorEntity.specialty,
                  doctorEntity.imageUrl,
                  doctorEntity.email,
                  doctorEntity.college)))),
      child: Directionality(
          textDirection: TextDirection.rtl,
          child: SizedBox(
            height: isLandscape ? 150 : 150,
            width: isLandscape ? 200 : 200,
            // 200,
            child: Card(
              // margin: EdgeInsets.symmetric(horizontal: 2),
              // s
              surfaceTintColor: ColorManager.white,
              color: ColorManager.white,
              // elevation: 3,
              child: Container(
                padding: const EdgeInsets.only(top: 5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(width: .1, color: ColorManager.primary)),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(8), bottom: Radius.circular(8)),
                      child: CachedNetworkImage(
                          imageUrl:
                              "${ApiConstants.imageBaseUrl}${doctorEntity.imageUrl}",
                          height: isLandscape ? 160 : 140,
                          // 140,
                          // width: double.infinity,
                          width: isLandscape ? 170 : 160,
                          // 160,
                          fit: BoxFit.fill,
                          placeholder: (context, url) => const Center(
                                  child: CircularProgressIndicator(
                                color: ColorManager.primary,
                              )),
                          errorWidget: (context, url, error) {
                            return Image.asset(
                              "assets/images/doctor_image.png",
                            );
                          }),
                    ),
                    // const SizedBox(
                    //   width: 15,
                    // ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "د. ${doctorEntity.firstName} ${doctorEntity.lastName}",
                            style: getSemiBoldStyle(
                              color: ColorManager.primary,
                            ),
                          ),
                          Text(
                            "${doctorEntity.specialty}",
                            overflow: TextOverflow.ellipsis,
                            style: getMediumStyle(
                              color: const Color.fromARGB(255, 111, 106, 106),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
          // Container(
          //   margin: EdgeInsets.symmetric(horizontal: 8),
          //   height: screenSize.height * 0.7,
          //   width: screenSize.width * .5,
          //   decoration: BoxDecoration(
          //     color: ColorManager.blue,
          //     border: Border.all(
          //       color: ColorManager.primary.withOpacity(0.3),
          //       width: 2,
          //     ),
          //     borderRadius: BorderRadius.circular(16.r),
          //   ),
          //   child: Column(
          //     // mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       ClipRRect(
          //         borderRadius: BorderRadius.circular(20),
          //         child: CachedNetworkImage(
          //           imageUrl:
          //               "${ApiConstants.imageBaseUrl}${doctorEntity.imageUrl}",
          //           height: isLandscape
          //               ? screenSize.width * .16
          //               : screenSize.height * .23,
          //           width: 350,
          //           fit: BoxFit.fitHeight,
          //         ),
          //       ),
          //       // Image.asset(
          //       //   "assets/images/doctor_image.png",
          //       //   height:
          //       //       isLandscape ? screenSize.width * .16 : screenSize.height * .2,
          //       //   // width:
          //       //   //     isLandscape ? screenSize.height * . : screenSize.width * .34,
          //       // ),
          //       // SizedBox(
          //       //   height: 15,
          //       // ),
          //       Text(
          //         "${doctorEntity.firstName ?? ''} ${doctorEntity.lastName}",
          //         style: getSemiBoldStyle(
          //             color: ColorManager.primary, fontSize: 18.sp),
          //       ),
          //       // const SizedBox(
          //       //   height: 5,
          //       // ),
          //       Text(
          //         doctorEntity.specialty ?? '',
          //         style: getMediumStyle(
          //             color: ColorManager.primary, fontSize: FontSize.s12),
          //       ),
          //       // const SizedBox(
          //       //   height: 10,
          //       // ),
          //     ],
          //   ),
          // ),
          ),
    );
  }
}

class DoctorArg {
  String? firstName;
  String? lastName;
  String? id;
  String? email;
  String? college;
  int? clincId;
  String? imageUrl;
  dynamic clinicName;
  String? description;
  String? specialty;

  DoctorArg(
      this.clincId,
      this.clinicName,
      this.description,
      this.firstName,
      this.id,
      this.lastName,
      this.specialty,
      this.imageUrl,
      this.email,
      this.college);
}
