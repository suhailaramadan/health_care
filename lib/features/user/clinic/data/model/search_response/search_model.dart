class SearchModel {
  int? id;
  String? name;
  String? imageUrl;

  SearchModel({this.id, this.name, this.imageUrl});

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
        id: json['id'] as int?,
        name: json['name'] as String?,
        imageUrl: json['imageUrl'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'imageUrl': imageUrl,
      };
}
