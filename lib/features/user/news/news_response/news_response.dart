class NewsResponse {
  int? id;
  String? title;
  String? content;
  String? image;
  DateTime? createdAt;

  NewsResponse({
    this.id,
    this.title,
    this.content,
    this.image,
    this.createdAt,
  });

  factory NewsResponse.fromJson(Map<String, dynamic> json) => NewsResponse(
        id: json['id'] as int?,
        title: json['title'] as String?,
        content: json['content'] as String?,
        image: json['image'] as String?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'content': content,
        'image': image,
        'createdAt': createdAt?.toIso8601String(),
      };
}
