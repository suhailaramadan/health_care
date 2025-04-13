import 'data.dart';

class BookingAppointment {
	bool? success;
	String? message;
	Data? data;

	BookingAppointment({this.success, this.message, this.data});

	factory BookingAppointment.fromJson(Map<String, dynamic> json) {
		return BookingAppointment(
			success: json['success'] as bool?,
			message: json['message'] as String?,
			data: json['data'] == null
						? null
						: Data.fromJson(json['data'] as Map<String, dynamic>),
		);
	}



	Map<String, dynamic> toJson() => {
				'success': success,
				'message': message,
				'data': data?.toJson(),
			};
}
