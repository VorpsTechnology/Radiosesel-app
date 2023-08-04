class HomeSliderModel {
  String id;
  String name;
  String image;
  String itemId;
  String language;
  int status;

  HomeSliderModel(
      {required this.id,
        required this.name,
        required this.image,
        required this.itemId,
        required this.status,
        required this.language});

  factory HomeSliderModel.fromJson(Map<String, dynamic> json) => HomeSliderModel(
    id: json["id"] ?? '',
    name: json["name"] ?? '',
    image: json["image"] ?? '',
    itemId: json["itemId"],
    language: json["language"],
    status: json["status"],

  );
}
