import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/constants.dart';
import 'package:graduation_project/core/resources/color_manager.dart';
import 'package:graduation_project/core/resources/font_manager.dart';
import 'package:graduation_project/core/resources/image_manager.dart';
import 'package:graduation_project/core/resources/styles_manager.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/core/widgets/custom_botton.dart';
import 'package:graduation_project/core/widgets/custom_text_field.dart';
import 'package:graduation_project/core/widgets/loading_indicator.dart';
import 'package:graduation_project/features/user/clinic/domain/entities/clinic_entity.dart';
import 'package:graduation_project/features/user/clinic/presentation/widget/clinic_details.dart';

class CustomClinicComponant extends StatelessWidget {
  // const CustomClinicComponant({
//     super.key,
//     required this.clinicEntity,
//   });
//   final ClinicEntity clinicEntity;
//   class CustomClinicComponant extends StatelessWidget {
  const CustomClinicComponant({
    super.key,
    required this.clinicEntity,
  });

  final ClinicEntity clinicEntity;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const ClinicDetails(),
            settings: RouteSettings(
                arguments: ClinicDetailsArg(
              id: clinicEntity.id,
              name: clinicEntity.name,
              imageUrl: clinicEntity.imageUrl,
            ))));
      },
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Card(
          elevation: 3,
          color: ColorManager.white,
          margin: EdgeInsets.all(8.w),
          child: Padding(
            padding: EdgeInsets.all(8.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.r),
                  child: CachedNetworkImage(
                    height: 100.h,
                    width: 100.w,
                    imageUrl:
                        "${ApiConstants.imageBaseUrl}${clinicEntity.imageUrl}",
                    fit: BoxFit.cover,
                    placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator(
                            color: ColorManager.primary)),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Text(
                    "عيادة ${clinicEntity.name}",
                    style: getBoldStyle(
                      color: ColorManager.primary,
                      fontSize: FontSize.s16.sp,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
// @override
// Widget build(BuildContext context) {
//   return InkWell(
//     onTap: () {
//       Navigator.of(context).push(MaterialPageRoute(
//           builder: (context) => const ClinicDetails(),
//           settings: RouteSettings(
//               arguments: ClinicDetailsArg(
//             id: clinicEntity.id,
//             name: clinicEntity.name,
//             imageUrl: clinicEntity.imageUrl,
//           ))));
//     },
//     child: Directionality(
//       textDirection: TextDirection.rtl,
//       child: Card(
//         // height: 250,
//         // width: 100,
//         elevation: 3,
//         surfaceTintColor: ColorManager.white,
//         color: ColorManager.white,
//         margin: const EdgeInsets.all(8),
//         // padding: EdgeInsets.symmetric(horizontal: 8),
//         // decoration: BoxDecoration(
//         //     border: Border.all(width: 0.1, color: ColorManager.blue),
//         //     borderRadius: BorderRadius.circular(10),
//         //     color: ColorManager.white,
//         //     boxShadow: const [
//         //       BoxShadow(blurRadius: 10, color: ColorManager.blue)
//         //     ]),
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Row(
//             // mainAxisAlignment: MainAxisAlignment.spacee,
//             children: [
//               // CachedNetworkImage(imageUrl:"${ApiConstants.clinicBaseUrl}${clinicEntity.imageUrl}"),
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(5),
//                 child: CachedNetworkImage(
//                   height: 150,
//                   width: 150,
//                   imageUrl:
//                       "${ApiConstants.imageBaseUrl}${clinicEntity.imageUrl}",
//                   // height: 150.w,
//                   // width: 200.w,
//                   fit: BoxFit.fill,
//                 ),
//               ),
//               const SizedBox(
//                 width: 15,
//               ),

//               Text(
//                 "عيادة  ${clinicEntity.name}",
//                 style: getBoldStyle(
//                     color: ColorManager.primary, fontSize: FontSize.s15.sp),
//               ),
//               // SizedBox(
//               //   width: 20.w,
//               // )
//             ],
//           ),
//         ),
//       ),
//     ),
//   );

// }
// }

class ClinicDetailsArg {
  int id;
  String name;
  String imageUrl;
  ClinicDetailsArg(
      {required this.id, required this.name, required this.imageUrl});
}
