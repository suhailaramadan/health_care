class DeleteBookingResponse {
  bool? success;
  String? message;
  bool? data;

  DeleteBookingResponse({this.success, this.message, this.data});

  factory DeleteBookingResponse.fromJson(Map<String, dynamic> json) {
    return DeleteBookingResponse(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] as bool?,
    );
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'message': message,
        'data': data,
      };
}
