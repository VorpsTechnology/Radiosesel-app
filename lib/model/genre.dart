
class GenreModel {
  String id;
  String name;
  String image;
  int status;

  GenreModel({
    required this.id,
    required this.name,
    required this.image,
    required this.status,

  });

  factory GenreModel.fromJson(Map<String, dynamic> json) => GenreModel(
    id: json["id"] ,
    name: json["name"],
    image: json["image"] ,
    status: json["status"],

  );

}
