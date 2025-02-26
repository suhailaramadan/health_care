class ClinicModel {
  int id;
  String name;
  String imageUrl;

  ClinicModel({required this.id, required this.name, required this.imageUrl});

  factory ClinicModel.fromJson(Map<String, dynamic> json) => ClinicModel(
      id: json['id'] as int,
      name: json['name'] as String,
      imageUrl: json['imageUrl'] as String);
}
