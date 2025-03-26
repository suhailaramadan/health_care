import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/constants.dart';
import 'package:graduation_project/core/di/service_locator.dart';
import 'package:graduation_project/core/resources/color_manager.dart';
import 'package:graduation_project/core/resources/font_manager.dart';
import 'package:graduation_project/core/resources/styles_manager.dart';
import 'package:graduation_project/core/widgets/custom_botton.dart';
import 'package:graduation_project/core/widgets/error_indicator.dart';
import 'package:graduation_project/core/widgets/loading_indicator.dart';
import 'package:graduation_project/features/doctor/domain/entities/doctor_entity.dart';
import 'package:graduation_project/features/doctor/presentation/widgets/appointment_list.dart';
import 'package:graduation_project/features/home/presentation/widgets/doctor_item.dart';
import 'package:graduation_project/features/user/booking/presentation/cubit/appointment/appointment_cubit.dart';
import 'package:graduation_project/features/user/booking/presentation/cubit/appointment/appointment_states.dart';

class DoctorDetails extends StatefulWidget {
  final String doctorId;
  const DoctorDetails({
    super.key,
    required this.doctorId,
  });
  static const dectorDetails = '/doctorDetails';

  @override
  State<DoctorDetails> createState() => _DoctorDetailsState();
}

// class _DoctorDetailsState extends State<DoctorDetails> {
//   // late DoctorArg args;
//   // @override
//   // void didChangeDependencies() {
//   //   super.didChangeDependencies();
//   //   final routeArgs = ModalRoute.of(context)?.settings.arguments;
//   //   if (routeArgs != null && routeArgs is DoctorArg) {
//   //     setState(() {
//   //       args = routeArgs;
//   //     });
//   //   }
//   // }
//   void initState() {
//     super.initState();
//     Future.microtask(() {
//       print("Calling getAppointmentDoctorById...");
//       context
//           .read<AppointmentCubit>()
//           .getAppointmentDoctorById(widget.doctorId);
//       // Future.microtask(() {
//       //   final routeArgs = ModalRoute.of(context)?.settings.arguments;
//       //   if (routeArgs is DoctorArg) {
//       //     setState(() {
//       //       args = routeArgs;
//       //     });
//       //   }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // final args = ModalRoute.of(context)?.settings.arguments as DoctorArg;
//     final args = ModalRoute.of(context)?.settings.arguments;
//     if (args == null || args is! DoctorArg) {
//       return const Scaffold(
//         body: Center(child: Text("حدث خطأ: لم يتم العثور على بيانات الطبيب")),
//       );
//     }

//     // print("---------------------> ${args.firstName}");
//     return Scaffold(
//         // appBar: AppBar(),
//         body: Directionality(
//       textDirection: TextDirection.rtl,
//       child: SingleChildScrollView(
//         child: Column(
//           // mainAxisSize: MainAxisSize.min,
//           // padding: const EdgeInsets.all(10),
//           children: [
//             ClipRRect(
//               borderRadius: BorderRadius.circular(25),
//               child: CachedNetworkImage(
//                   fit: BoxFit.fill,
//                   height: 400,
//                   width: double.infinity,
//                   // fit: BoxFit.cover,
//                   imageUrl: "${ApiConstants.imageBaseUrl}${args.imageUrl}",
//                   placeholder: (context, url) =>
//                       const Center(child: CircularProgressIndicator()),
//                   errorWidget: (context, url, error) {
//                     print("Image Load Error: $error");
//                     return Image.asset("assets/images/doctor_image.png");
//                   }),
//             ),
//             const SizedBox(
//               height: 15,
//             ),
//             Center(
//                 child: Text(
//               "${args.firstName} ${args.lastName}",
//               style:
//                   getBoldStyle(color: const Color.fromARGB(204, 82, 151, 221)),
//             )),
//             Center(
//                 child: Text(
//               '${args.description}',
//               style: getSemiBoldStyle(
//                   color: const Color.fromARGB(204, 82, 151, 221),
//                   fontSize: FontSize.s15),
//             )),
//             const SizedBox(
//               height: 20,
//             ),
//             BlocProvider(
//               // value: serviceLocator.get<AppointmentCubit>()
//               create: (context) => serviceLocator.get<AppointmentCubit>()
//                 ..getAppointmentDoctorById(widget.doctorId),
//               child: BlocBuilder<AppointmentCubit, AppointmentStates>(
//                   builder: (context, state) {
//                 print("Current State: ${state.runtimeType}");
//                 if (state is GetAppointmentLoading) {
//                   print(
//                       "---------------------------------->${state.toString()}");
//                   return const LoadingIndicator();
//                 } else if (state is GetAppointmentError) {
//                   return Center(
//                     child: ErrorIndicator(
//                       message: state.message,
//                     ),
//                   );
//                 } else if (state is GetAppointmentSuccess) {
//                   return SizedBox(
//                     height: 250,
//                     child: ListView.builder(
//                       shrinkWrap: true,

//                       scrollDirection: Axis.horizontal,
//                       // physics: const NeverScrollableScrollPhysics(),
//                       itemBuilder: (_, index) => AppointmentList(
//                         appointments: st,
//                       ),
//                       itemCount: 1,
//                     ),
//                   );
//                 } else
//                   // ignore: curly_braces_in_flow_control_structures
//                   return const Text('حدث خطأغير متوقع');
//               }),
//             ),
//           ],
//         ),
//       ),
//     ));
//   }
// }
/////////////////////////////////////////////////////////////////////////////////
class _DoctorDetailsState extends State<DoctorDetails> {
  String? selectedDay;
  String? selectedTime;
  void _updateSelectedAppointment(String? day, String? time) {
    setState(() {
      selectedDay = day;
      selectedTime = time;
    });
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args == null || args is! DoctorArg) {
      return const Scaffold(
        body: Center(child: Text("حدث خطأ: لم يتم العثور على بيانات الطبيب")),
      );
    }

    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: CachedNetworkImage(
                  fit: BoxFit.fill,
                  height: 400,
                  width: double.infinity,
                  imageUrl: "${ApiConstants.imageBaseUrl}${args.imageUrl}",
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) =>
                      Image.asset("assets/images/doctor_image.png"),
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "عن الطبيب",
                      style: getSemiBoldStyle(color: ColorManager.textColor),
                    )),
              ),
              // six
              Center(
                child: Text(
                  "${args.firstName} ${args.lastName}",
                  style: getBoldStyle(
                      color: const Color.fromARGB(204, 82, 151, 221)),
                ),
              ),
              Center(
                child: Text(
                  '${args.description}',
                  style: getSemiBoldStyle(
                    color: const Color.fromARGB(204, 82, 151, 221),
                    fontSize: FontSize.s15,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Align(
              //     alignment: Alignment.centerRight,
              //     child: Text("مواعيد الحجز",style: getSemiBoldStyle(color: ColorManager.black),)),
              BlocProvider(
                create: (context) => serviceLocator.get<AppointmentCubit>()
                  ..getAppointmentDoctorById(widget.doctorId),
                child: BlocBuilder<AppointmentCubit, AppointmentStates>(
                  builder: (context, state) {
                    if (state is GetAppointmentLoading) {
                      return const LoadingIndicator();
                    } else if (state is GetAppointmentError) {
                      return Center(
                          child: ErrorIndicator(message: state.message));
                    } else if (state is GetAppointmentSuccess) {
                      return AppointmentList(
                        appointments: state.appointmentEntity,
                        onSelectionChanged: _updateSelectedAppointment,
                      );
                    } else {
                      return const Text('حدث خطأغير متوقع');
                    }
                  },
                ),
              ),

              const SizedBox(height: 20),
              SizedBox(
                width: 180,
                child: ElevatedButton(
                  onPressed: (selectedDay != null && selectedTime != null)
                      ? () => _confirmBooking(context)
                      : null,
                  style: ButtonStyle(
                    shape:
                        const MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    )),
                    foregroundColor:
                        const MaterialStatePropertyAll(ColorManager.white),
                    backgroundColor: MaterialStateProperty.all(
                      // (selectedDay != null && selectedTime != null)
                          // ?
                           ColorManager.primary,
                          // : ColorManager.grey,
                    ),
                  ),
                  child: Text(
                    "حجز موعد",
                    style: getMediumStyle(color: ColorManager.white)
                        .copyWith(fontSize: FontSize.s20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _confirmBooking(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: ColorManager.blue,
        title: Center(
          child: Text(
            "تأكيد الحجز",
            style: getMediumStyle(color: ColorManager.black),
          ),
        ),
        content: Column(
          children: [
            Text(
              "هل تريد حجز موعد يوم $selectedDay الساعة $selectedTime؟",
              style: getMediumStyle(color: ColorManager.black, fontSize: 13),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(
              'إلغاء',
              style: getMediumStyle(
                color: ColorManager.red,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              _bookAppointment(context);
            },
            child: Text('تأكيد',
                style: getMediumStyle(color: ColorManager.primary)),
          ),
        ],
      ),
    );
  }

  void _bookAppointment(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content:
            Text("تم حجز موعد يوم $selectedDay الساعة $selectedTime بنجاح"),
        backgroundColor: Colors.green,
        padding: const EdgeInsets.all(8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}
