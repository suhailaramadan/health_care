import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/constants.dart';
import 'package:graduation_project/core/resources/color_manager.dart';
import 'package:graduation_project/core/resources/styles_manager.dart';
import 'package:graduation_project/core/widgets/loading_indicator.dart';
import 'package:graduation_project/features/doctor/presentation/cubit/doctor_cubit.dart';
import 'package:graduation_project/features/doctor/presentation/cubit/doctor_states.dart';
import 'package:graduation_project/features/doctor/presentation/widgets/appointment_list.dart';
import 'package:graduation_project/features/user/booking/data/models/booking_response/booking_patient_response/booking_patient_model.dart';
import 'package:graduation_project/features/user/booking/data/models/booking_response/booking_request.dart';
import 'package:graduation_project/features/user/booking/presentation/cubit/booking/booking_cubit.dart';
import 'package:graduation_project/features/user/booking/presentation/cubit/booking/booking_patient_cubit.dart';
import 'package:graduation_project/features/user/clinic/presentation/cubit/clinic_cubit.dart';
import 'package:graduation_project/features/user/clinic/presentation/cubit/clinic_states.dart';
import 'package:graduation_project/features/user/booking/presentation/cubit/appointment/appointment_cubit.dart';
import 'package:graduation_project/features/user/booking/presentation/cubit/appointment/appointment_states.dart';

class ReBooking extends StatefulWidget {
  final int oldBookingId;
  final BookingPatientModel booking;

  const ReBooking(
      {super.key, required this.oldBookingId, required this.booking});

  @override
  State<ReBooking> createState() => _ReBookingState();
}

class _ReBookingState extends State<ReBooking> {
  int? selectedClinicId;
  String? selectedDoctorId;
  String? selectedDate;
  String? selectedTime;
  String? selectedClinicName;
  @override
  void initState() {
    super.initState();
    selectedClinicId = widget.booking.id;
    selectedDoctorId = widget.booking.doctorId;
    selectedDate = widget.booking.date;
    selectedTime = widget.booking.time;
    selectedClinicName = widget.booking.clinicName;
    context.read<ClinicCubit>().getClinics();
    context.read<DoctorsCubit>().getDoctorsByClinicId(widget.booking.id);
    context
        .read<AppointmentCubit>()
        .getAppointmentDoctorById(widget.booking.doctorId ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.all(1.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildClinicDropdown(),
              const SizedBox(height: 10),
              _buildDoctorDropdown(),
              const SizedBox(height: 10),
              _buildAppointmentList(),
              const SizedBox(height: 15),
              _buildConfirmButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildClinicDropdown() {
    return BlocBuilder<ClinicCubit, ClinicState>(
      builder: (context, state) {
        if (state is GetClinicsLoading) {
          return Container(
            margin: EdgeInsets.all(10),
            child: const CircularProgressIndicator(
              color: ColorManager.blue,
            ),
          );
        }
        if (state is GetClinicsSuccess) {
          bool exists = state.clinicEntity.any(
            (clinic) => clinic.id == selectedClinicId,
          );
          if (!exists) {
            selectedClinicId = null;
          }
          return DropdownButtonFormField<int>(
            focusColor: ColorManager.primary,
            iconEnabledColor: ColorManager.primary,
            borderRadius: BorderRadius.circular(25),
            value: selectedClinicId,
            decoration: const InputDecoration(
                hoverColor: ColorManager.primary,
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.all(8)),
            // focusColor: ColorManager.primary,
            // hoverColor: ColorManager.primary,
            // contentPadding: EdgeInsets.all(8)),
            hint: Text(
              widget.booking.clinicName ?? '',
              style: getMediumStyle(color: ColorManager.textColor),
            ),
            items: state.clinicEntity
                .map((clinic) => DropdownMenuItem(
                      value: clinic.id,
                      child: Text(
                        clinic.name,
                        style: getMediumStyle(color: ColorManager.textColor),
                      ),
                    ))
                .toList(),
            onChanged: (val) {
              setState(() {
                selectedClinicId = val;
                selectedDoctorId = null;
              });

              context.read<DoctorsCubit>().getDoctorsByClinicId(val!);
            },
          );
        }
        return const SizedBox();
      },
    );
  }

  Widget _buildDoctorDropdown() {
    return BlocBuilder<DoctorsCubit, DoctorsStates>(
      builder: (context, state) {
        if (state is GetDoctorsLoading) {
          return Container(
            margin: EdgeInsets.all(10),
            child: const CircularProgressIndicator(
              color: ColorManager.blue,
            ),
          );
        }
        if (state is GetDoctorsSuccess) {
          return DropdownButtonFormField<String>(
            focusColor: ColorManager.primary,
            iconEnabledColor: ColorManager.primary,
            borderRadius: BorderRadius.circular(25),
            value: selectedDoctorId,
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(8),
                focusColor: ColorManager.primary,
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: ColorManager.primary),
                )),
            // contentPadding: EdgeInsets.all(8)),
            hint: Text(
              "${widget.booking.doctorFirstName} ${widget.booking.doctorLastName}",
              style: getMediumStyle(color: ColorManager.textColor),
            ),
            items: state.doctorEntity
                .map((doctor) => DropdownMenuItem(
                      value: doctor.id,
                      child: Text(
                        "${doctor.firstName} ${doctor.lastName}",
                        style: getMediumStyle(color: ColorManager.textColor),
                      ),
                    ))
                .toList(),
            onChanged: (val) {
              setState(() => selectedDoctorId = val);
              context.read<AppointmentCubit>().getAppointmentDoctorById(val!);
            },
          );
        }
        return const SizedBox();
      },
    );
  }

  Widget _buildAppointmentList() {
    return BlocBuilder<AppointmentCubit, AppointmentStates>(
      builder: (context, state) {
        if (state is GetAppointmentLoading) {
          return Container(
            margin: EdgeInsets.all(10),
            child: const CircularProgressIndicator(
              color: ColorManager.blue,
            ),
          );
        }
        if (state is GetAppointmentSuccess) {
          return AppointmentList(
            appointments: state.appointmentEntity,
            onSelectionChanged: (day, time) {
              setState(() {
                selectedDate = day;
                selectedTime = time;
              });
            },
          );
        }
        return const SizedBox();
      },
    );
  }

  Widget _buildConfirmButton() {
    bool isChanged = (
        // selectedClinicId != widget.booking.id ||
        // selectedDoctorId != widget.booking.doctorId ||
        selectedDate != widget.booking.date ||
            selectedTime != widget.booking.time);

    return ElevatedButton(
      onPressed: (
              // selectedClinicId != null &&
              //       selectedDoctorId != null &&
              selectedDate != null && selectedTime != null && isChanged)
          ? () async {
              await context.read<BookingCubit>().bookAppointment(
                    BookingRequest(
                      doctorId: selectedDoctorId!,
                      date: selectedDate!,
                      time: selectedTime!,
                      isBooking: true,
                    ),
                  );
              Navigator.pop(context);
              context
                  .read<DeleteBookingCubit>()
                  .deleteBooking(widget.oldBookingId);

              await context.read<BookingPatientCubit>().getBookingPatient();

              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      "تمت إعادة الحجز بنجاح",
                      style: getMediumStyle(color: ColorManager.white),
                    ),
                    backgroundColor: Colors.green,
                    duration: const Duration(seconds: 2),
                  ),
                );

                Future.delayed(const Duration(seconds: 2), () {
                  Navigator.of(context).pop();
                });
              }
            }
          : null,
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorManager.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(
        "تأكيد الحجز",
        style: getMediumStyle(color: ColorManager.white),
      ),
    );
  }
}
