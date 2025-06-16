import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
import 'package:graduation_project/features/user/clinic/presentation/cubit/clinic_cubit.dart';
import 'package:graduation_project/features/user/clinic/presentation/widget/clinic_details.dart';

class CustomClinicComponant extends StatelessWidget {
  const CustomClinicComponant({
    super.key,
    required this.clinicEntity,
  });
  final ClinicEntity clinicEntity;

  @override
  Widget build(BuildContext context) {
    final fileName = clinicEntity.imageUrl.split('/').last;
    final encodedFileName = Uri.encodeComponent(fileName);
    final fullUrl = '${ApiConstants.imageBaseUrl}/images/$encodedFileName';

    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const ClinicDetails(),
            settings: RouteSettings(
                arguments: ClinicEntity(clinicEntity.id, clinicEntity.name,
                    clinicEntity.imageUrl))));
        // context.read<ClinicCubit>().getClinics();
      },
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: SizedBox(
          height: 150,
          width: 300,
          child: Card(
            elevation: 3,
            surfaceTintColor: ColorManager.white,
            color: ColorManager.white,
            margin: const EdgeInsets.all(8),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(width: .3, color: ColorManager.primary)),
              child: Row(
                children: [
                  SizedBox(
                    width: 150,
                    height: 200,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: CachedNetworkImage(
                          imageUrl: fullUrl,
                          // "${ApiConstants.imageBaseUrl}${clinicEntity.imageUrl}",
                          fit: BoxFit.fill,
                          // height: 100,
                          // width: 150,
                          placeholder: (context, url) => const Center(
                                child: CircularProgressIndicator(
                                  color: ColorManager.greyDark,
                                ),
                              ),
                          errorWidget: (context, url, error) => const Center(
                                  child: Icon(
                                Icons.error_outline_outlined,
                                color: ColorManager.red,
                                size: 25,
                              ))),
                    ),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  Expanded(
                    child: Text(
                      "عيادة  ${clinicEntity.name}",
                      style: getBoldStyle(
                          color: ColorManager.primary, fontSize: 13),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ClinicDetailsArg {
  int id;
  String name;
  String imageUrl;
  ClinicDetailsArg(
      {required this.id, required this.name, required this.imageUrl});
}
