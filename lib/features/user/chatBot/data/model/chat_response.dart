class ChatResponse {
  String? reply;

  ChatResponse({this.reply});

  factory ChatResponse.fromJson(Map<String, dynamic> json) => ChatResponse(
        reply: json['reply'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'reply': reply,
      };
}
