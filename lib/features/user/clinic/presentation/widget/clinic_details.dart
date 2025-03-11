import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/constants.dart';
import 'package:graduation_project/core/resources/color_manager.dart';
import 'package:graduation_project/core/resources/font_manager.dart';
import 'package:graduation_project/core/resources/styles_manager.dart';
import 'package:graduation_project/core/widgets/custom_botton.dart';
import 'package:graduation_project/features/user/clinic/presentation/widget/custom_clinic_componant.dart';
import 'package:graduation_project/features/user/home/presentation/widgets/doctor_item.dart';

class ClinicDetails extends StatefulWidget {
  const ClinicDetails({super.key});
  static const clinicDetails = "/clinicDetails";

  @override
  State<ClinicDetails> createState() => _ClinicDetailsState();
}

class _ClinicDetailsState extends State<ClinicDetails> {
  late ClinicDetailsArg args;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final routeArgs = ModalRoute.of(context)?.settings.arguments;
    if (routeArgs != null && routeArgs is ClinicDetailsArg) {
      setState(() {
        args = routeArgs;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
            // automaticallyImplyLeading: false,
            ),
        body: Center(
          child: Container(
            height: MediaQuery.sizeOf(context).height,
            // decoration: const BoxDecoration(
            //     color: ColorManager.blue,
            //     borderRadius: BorderRadius.only(
            //         topLeft: Radius.circular(70),
            //         topRight: Radius.circular(70))),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  Center(
                    child: CachedNetworkImage(
                        imageUrl:
                            "${ApiConstants.imageBaseUrl}${args.imageUrl}",
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.fill,
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        errorWidget: (context, url, error) =>
                            Image.asset("assets/images/default_clinic.png")),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    args.name,
                    style: getBoldStyle(
                        color: ColorManager.primary, fontSize: FontSize.s22.sp),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text("نقدم لكم أفضل الخدمات"),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: 5,
                        itemBuilder: (_, index) => const DoctorItem()),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
