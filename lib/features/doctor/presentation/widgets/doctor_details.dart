import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/constants.dart';
import 'package:graduation_project/core/di/service_locator.dart';
import 'package:graduation_project/core/resources/color_manager.dart';
import 'package:graduation_project/core/resources/font_manager.dart';
import 'package:graduation_project/core/resources/styles_manager.dart';
import 'package:graduation_project/core/utils/formated.dart';
import 'package:graduation_project/core/utils/ui_utils.dart';
import 'package:graduation_project/core/widgets/custom_botton.dart';
import 'package:graduation_project/core/widgets/error_indicator.dart';
import 'package:graduation_project/core/widgets/loading_indicator.dart';
import 'package:graduation_project/features/doctor/domain/entities/doctor_entity.dart';
import 'package:graduation_project/features/doctor/presentation/widgets/appointment_list.dart';
import 'package:graduation_project/features/home/presentation/widgets/custom_doctor.dart';
import 'package:graduation_project/features/doctor/presentation/widgets/doctor_item.dart';
import 'package:graduation_project/features/user/booking/data/models/booking_response/booking_request.dart';
import 'package:graduation_project/features/user/booking/presentation/cubit/appointment/appointment_cubit.dart';
import 'package:graduation_project/features/user/booking/presentation/cubit/appointment/appointment_states.dart';
import 'package:graduation_project/features/user/booking/presentation/cubit/booking/booking_cubit.dart';
import 'package:graduation_project/features/user/booking/presentation/cubit/booking/booking_states.dart';

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

class _DoctorDetailsState extends State<DoctorDetails> {
  String? selectedDay;
  String? selectedTime;
  bool isBooking = false;
  bool _showFullDescription = false;
  late ScrollController _scrollController;
  void _updateSelectedAppointment(String? day, String? time) {
    setState(() {
      selectedDay = day;
      selectedTime = time;
    });
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    context.read<AppointmentCubit>().getAppointmentDoctorById(widget.doctorId);
    context.read<BookingCubit>();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args == null || args is! DoctorArg) {
      return const Scaffold(
        body: Center(child: Text("حدث خطأ: لم يتم العثور على بيانات الطبيب")),
      );
    }
    print("Image URL = ${ApiConstants.imageBaseUrl}${args.imageUrl}");
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: ColorManager.white,
        appBar: AppBar(
          backgroundColor: ColorManager.white,
        ),
        body: SingleChildScrollView(
            child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          // height: MediaQuery.of(context).size.height,
          // width: MediaQuery.of(context).size.width,

          decoration: const BoxDecoration(color: ColorManager.white),
          //     // color: ColorManager.blue,
          //     borderRadius: BorderRadius.only(
          //         topLeft: Radius.circular(105),
          //         topRight: Radius.circular(105))),
          child: SingleChildScrollView(
            child: Column(children: [
              SizedBox(
                height: 200,
                child: Container(
                  // surfaceTintColor: ColorManager.white,
                  color: ColorManager.white,
                  // elevation: 3,
                  child: Container(
                    margin: const EdgeInsets.all(3),
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border:
                            Border.all(width: 1, color: ColorManager.primary)),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "د. ${args.firstName} ${args.lastName}",
                                  // softWrap: true,
                                  // overflow: TextOverflow.visible,
                                  style: getBoldStyle(
                                      color: ColorManager.primary,
                                      fontSize: 18),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  textAlign: TextAlign.center,
                                  "${args.specialty}",
                                  // softWrap: true,
                                  // overflow: TextOverflow.visible,
                                  // maxLines: 2,
                                  style: getSemiBoldStyle(
                                      color: Color.fromARGB(255, 155, 151, 151),
                                      fontSize: 13),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "${args.email}",
                                  // softWrap: true,
                                  // overflow: TextOverflow.visible,
                                  style: getBoldStyle(
                                      color: Color.fromARGB(255, 135, 132, 132),
                                      fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(12),
                              bottom: Radius.circular(12)),
                          child: CachedNetworkImage(
                              imageUrl:
                                  "${ApiConstants.imageBaseUrl}${args.imageUrl}",
                              height: 130,
                              // width: double.infinity,
                              width: 150,
                              fit: BoxFit.fill,
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
                      ],
                    ),
                  ),
                ),
              ),
              // ClipOval(
              //     child: CachedNetworkImage(
              //   imageUrl: "${ApiConstants.imageBaseUrl}${args.imageUrl}",
              //   errorListener: (p0) =>
              //       Image.asset("assets/images/doctor_image.png"),
              //   height: 150,
              //   width: 150,
              //   fit: BoxFit.cover,
              // )),
              const SizedBox(
                height: 15,
              ),
              // Text("${args.firstName} ${args.lastName}",
              //     style: getSemiBoldStyle(color: ColorManager.primary
              //         // color: const Color.fromARGB(204, 82, 151, 221)
              //         )),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Row(
                    children: [
                      const Icon(
                        Icons.article,
                        color: ColorManager.primary,
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      Text(
                        "عن الطبيب",
                        style: getMediumStyle(color: ColorManager.primary),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RichText(
                      text: TextSpan(children: [
                    TextSpan(
                      text: _showFullDescription
                          ? args.description ?? ''
                          : (args.description != null &&
                                  args.description!.length > 80
                              ? args.description!.substring(0, 80)
                              : args.description ?? ''),
                      style: getRegularStyle(color: ColorManager.textColor),
                    ),
                    if (args.description != null &&
                        args.description!.length > 80)
                      TextSpan(
                        text: _showFullDescription
                            ? 'عرض أقل   '
                            : '... عرض المزيد',
                        style: getSemiBoldStyle(
                            color: ColorManager.primary, fontSize: 15),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            setState(() {
                              _showFullDescription = !_showFullDescription;
                            });
                            if (_showFullDescription) {
                              WidgetsBinding.instance
                                  .addPostFrameCallback((timeStamp) {
                                _scrollController.animateTo(
                                    _scrollController.position.maxScrollExtent,
                                    duration: const Duration(milliseconds: 400),
                                    curve: Curves.easeInOut);
                              });
                            }
                          },
                      )
                  ]))),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Row(
                    children: [
                      const Icon(
                        Icons.access_time,
                        color: ColorManager.primary,
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      Text("اختر ميعاد الحجز",
                          style: getMediumStyle(color: ColorManager.primary)),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),
              BlocBuilder<AppointmentCubit, AppointmentStates>(
                builder: (context, state) {
                  if (state is GetAppointmentLoading) {
                    return const CircularProgressIndicator(
                      color: ColorManager.primary,
                    );
                  }
                  if (state is GetAppointmentError) {
                    return Text(state.message);
                  }
                  if (state is GetAppointmentSuccess) {
                    return AppointmentList(
                      appointments: state.appointmentEntity,
                      onSelectionChanged: _updateSelectedAppointment,
                    );
                  }
                  return const Text('لم يتم تحميل البيانات');
                },
              ),
              const SizedBox(height: 20),
              BlocListener<BookingCubit, BookingStates>(
                listener: (context, state) {
                  if (state is GetBookingLoading) {
                    setState(() => isBooking = true);
                  } else if (state is GetBookingSuccess) {
                    setState(() => isBooking = false);

                    UIUtils.showMessage(
                        context,
                        "تم حجز موعد يوم ${FormatedDate.formateArabicDate(state.booking.data!.date ?? '', day: '')} الساعة ${FormatedDate.formateArabicDate(state.booking.data!.time ?? '', day: '')} بنجاح",
                        ColorManager.green);
                  } else if (state is GetBookingError) {
                    setState(() => isBooking = false);
                    UIUtils.showMessage(
                        context, state.message, ColorManager.red);
                  }
                },
                child: ElevatedButton(
                  onPressed: (selectedDay != null &&
                          selectedTime != null &&
                          !isBooking &&
                          (isDateAvailableForBooking(selectedDay!)))
                      ? () => _showConfirmationDialog(context)
                      : null,
                  style: ButtonStyle(
                    shape:
                        const MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    )),
                    foregroundColor:
                        const MaterialStatePropertyAll(ColorManager.white),
                    backgroundColor:
                        MaterialStateProperty.all(ColorManager.primary),
                  ),
                  child: isBooking
                      ? const CircularProgressIndicator(
                          color: ColorManager.white)
                      : Text("حجز موعد",
                          style: getMediumStyle(color: ColorManager.white)
                              .copyWith(fontSize: 20)),
                ),
              ),
              const SizedBox(height: 20),
            ]),
          ),
        )
            // ],
            ),
      ),
    );
  }

  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // if (isDateAvailableForBooking(selectedDay!)) {
        //   UIUtils.showMessage(context,
        //       "لا يمكن الحجز قبل 24 ساعة من الموعد المحدد", ColorManager.red);
        // }
        return Directionality(
          textDirection: TextDirection.rtl,
          child: AlertDialog(
            shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(25)),
            title: Center(
                child: Text(
              "تأكيد الحجز",
              style: getMediumStyle(color: ColorManager.textColor),
            )),
            backgroundColor: ColorManager.white,
            surfaceTintColor: ColorManager.white,
            content: Text(
              "هل تريد حجز موعد يوم${FormatedDate.formateArabicDate(selectedDay!, day: '')} الساعة ${FormatedDate.formateTime(selectedTime!)}؟",
              style: getMediumStyle(color: ColorManager.textColor),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  final bookingCubit = context.read<BookingCubit>();
                  bookingCubit.bookAppointment(
                    BookingRequest(
                      time: selectedTime!,
                      date: selectedDay!,
                      doctorId: widget.doctorId,
                      isBooking: isBooking,
                    ),
                  );
                  Navigator.of(context).pop();
                  context
                      .read<AppointmentCubit>()
                      .getAppointmentDoctorById(widget.doctorId);
                },
                child: Text("تأكيد",
                    style: getMediumStyle(color: ColorManager.primary)),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text("إلغاء",
                    style: getMediumStyle(color: ColorManager.red)),
              ),
            ],
          ),
        );
      },
    );
  }

  bool isDateAvailableForBooking(String date) {
    try {
      DateTime selectedDate = DateTime.parse(date);
      DateTime now = DateTime.now();
      Duration differense = selectedDate.difference(now);
      return differense.inHours >= 24;
    } catch (e) {
      return false;
    }
  }
}
