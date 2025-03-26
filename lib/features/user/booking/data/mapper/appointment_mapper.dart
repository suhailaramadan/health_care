import 'package:graduation_project/features/user/booking/data/models/appointment_by_doctor_id_response/appointment_by_doctor_id_response.dart';
import 'package:graduation_project/features/user/booking/data/models/appointment_by_doctor_id_response/appointment_model.dart';
import 'package:graduation_project/features/user/booking/domain/entities/appointment_entity.dart';

// extension AppointmentMapper on AppointmentModel {
//   AppointmentEntity get toEntity => AppointmentEntity(
//       availableSlots: availableSlots ?? [], date: date ?? '', day: day ?? '');
// }

// List<AppointmentEntity> mapResponseToEntity(AppointmentByDoctorIdResponse response) {
//   return response.data?.map((datum) {
//     return AppointmentEntity(
//       date: datum.date ?? "",
//       day: datum.day ?? "",
//       availableSlots: datum.availableSlots ?? [],
//     );
//   }).toList() ?? [];
// }
extension AppointmentMapper on AppointmentModel {
  AppointmentEntity get toEntity => AppointmentEntity(
        availableSlots:
            (availableSlots != null) ? List<String>.from(availableSlots!) : [],
        date: date ?? '',
        day: day ?? '',
      );
}

extension AppointmentListMapper on List<AppointmentModel> {
  List<AppointmentEntity> get toEntityList => map((e) => e.toEntity).toList();
}
