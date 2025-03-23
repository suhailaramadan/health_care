import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/core/constants.dart';
import 'package:graduation_project/core/resources/color_manager.dart';
import 'package:graduation_project/core/resources/font_manager.dart';
import 'package:graduation_project/core/resources/styles_manager.dart';
import 'package:graduation_project/core/widgets/custom_botton.dart';
import 'package:graduation_project/features/doctor/domain/entities/doctor_entity.dart';
import 'package:graduation_project/features/home/presentation/widgets/doctor_item.dart';

class DoctorDetails extends StatefulWidget {
  const DoctorDetails({
    super.key,
  });
  static const dectorDetails = '/doctorDetails';

  @override
  State<DoctorDetails> createState() => _DoctorDetailsState();
}

class _DoctorDetailsState extends State<DoctorDetails> {
  // late DoctorArg args;
  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   final routeArgs = ModalRoute.of(context)?.settings.arguments;
  //   if (routeArgs != null && routeArgs is DoctorArg) {
  //     setState(() {
  //       args = routeArgs;
  //     });
  //   }
  // }
  // void initState() {
  //   super.initState();
  //   Future.microtask(() {
  //     final routeArgs = ModalRoute.of(context)?.settings.arguments;
  //     if (routeArgs is DoctorArg) {
  //       setState(() {
  //         args = routeArgs;
  //       });
  //     }
  //   });
  // }

  List<Map<String, String>> days = [
    {"السبت": ''},
    {"الأحد": ""},
    {
      "الاثنين": "",
    },
    {
      "الاثنين": "",
    },
    {
      "الاثنين": "",
    },
    {
      "الاثنين": "",
    },
  ];
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as DoctorArg;
    // print("---------------------> ${args.firstName}");
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: SingleChildScrollView(
            physics: ScrollPhysics(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              // padding: const EdgeInsets.all(10),
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: CachedNetworkImage(
                    fit: BoxFit.fill,
                    height: 200,
                    width: double.infinity,
                    // fit: BoxFit.cover,
                    imageUrl: "${ApiConstants.imageBaseUrl}${args.imageUrl}",
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) =>
                        Image.asset("assets/images/doctor_image.png"),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Center(
                    child: Text(
                  "${args.firstName} ${args.lastName}",
                  style: getBoldStyle(
                      color: const Color.fromARGB(204, 82, 151, 221)),
                )),
                Center(
                    child: Text(
                  '${args.description}',
                  style: getSemiBoldStyle(
                      color: const Color.fromARGB(204, 82, 151, 221),
                      fontSize: FontSize.s15),
                )),
                const SizedBox(
                  height: 20,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  // scrollDirection: Axis.vertical
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (_, index) {
                    final schedual = days[index];
                    return ListTile(
                      title: Text("جدول الايام"),
                      subtitle: Text("الوقت "),
                      trailing: Icon(
                        Icons.calendar_today,
                        color: ColorManager.primary,
                      ),
                      onTap: () => _confirmBooking(schedual),
                    );
                  },
                  itemCount: days.length,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _confirmBooking(Map<String, String> schedual) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: const Text("تأكيد الحجز"),
              content: const Text("هل تريد حجز موعد في يومالاتنين من 10ل 10.5"),
              actions: [
                TextButton(
                    onPressed: () => Navigator.of(_).pop(),
                    child: const Text('إلغاء')),
                CustomButton(
                  label: "تأكيد",
                  onTap: () => Navigator.of(context).pop(),
                )
              ],
            ));
  }
}
