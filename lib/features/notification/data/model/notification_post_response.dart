class NotificationPostResponse {
  String? message;

  NotificationPostResponse({this.message});

  factory NotificationPostResponse.fromJson(Map<String, dynamic> json) {
    return NotificationPostResponse(
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'message': message,
      };
}
