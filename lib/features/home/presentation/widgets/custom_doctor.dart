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
            height: isLandscape ? 150.h : 200.h,
            width: isLandscape ? 120.w : 200.h,
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
                          height: isLandscape ? 110.w : 130.h,
                          // 140,
                          // width: double.infinity,
                          width: isLandscape ? 100.w : 160.h,
                          // 160,
                          // fit: BoxFit.fill,
                          placeholder: (context, url) => const Center(
                                  child: CircularProgressIndicator(
                                color: ColorManager.primary,
                              )),
                          errorWidget: (context, url, error) {
                            return Image.asset(
                              "assets/images/OIP.jpg",
                            );
                          }),
                    ),
                    // const SizedBox(
                    //   width: 15,
                    // ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "د. ${doctorEntity.firstName} ${doctorEntity.lastName}",
                              textAlign: TextAlign.center,
                              style: getSemiBoldStyle(
                                color: ColorManager.primary,
                              ),
                            ),
                            Text(
                              "${doctorEntity.specialty}",
                              style: getMediumStyle(
                                fontSize: 13,
                                color: const Color.fromARGB(255, 111, 106, 106),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )),
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
