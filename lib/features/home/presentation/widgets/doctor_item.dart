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

class DoctorItem extends StatelessWidget {
  const DoctorItem({super.key, required this.doctorEntity});
  final DoctorEntity doctorEntity;
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.sizeOf(context);
    final bool isLandscape = screenSize.width > screenSize.height;
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
    return Container(
      // padding: const EdgeInsets.symmetric(horizontal: 10),
      // margin: const EdgeInsets.all(10),

      height: 400,
      // decoration: const BoxDecoration(
      //     // color: Color.fromARGB(255, 79, 136, 198),
      //     borderRadius: BorderRadius.all(Radius.circular(15))),
      child: InkWell(
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
                    doctorEntity.imageUrl)))),
        child: Directionality(
            textDirection: TextDirection.rtl,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 3,
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                        top: const Radius.circular(12)),
                    child: CachedNetworkImage(
                      imageUrl:
                          "${ApiConstants.imageBaseUrl}${doctorEntity.imageUrl}",
                      height: 150,
                      // width: double.infinity,
                      width: 200,
                      fit: BoxFit.fill,
                      placeholder: (context, url) =>
                          const Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) =>
                          Image.asset("assets/images/doctor_image.png"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      children: [
                        Text(
                          "${doctorEntity.firstName} ${doctorEntity.lastName}",
                          style:
                              getSemiBoldStyle(color: ColorManager.textColor),
                        ),
                        Text(
                          "${doctorEntity.specialty}",
                          style: getMediumStyle(color: ColorManager.grey),
                        )
                      ],
                    ),
                  )
                ],
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
      ),
    );
  }
}

class DoctorArg {
  String? firstName;
  String? lastName;
  String? id;
  int? clincId;
  String? imageUrl;
  dynamic clinicName;
  String? description;
  String? specialty;
  DoctorArg(this.clincId, this.clinicName, this.description, this.firstName,
      this.id, this.lastName, this.specialty, this.imageUrl);
}
