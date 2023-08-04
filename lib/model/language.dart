class LanguageModel{
  String id;
  String name;

  LanguageModel({required this.id, required this.name});

  factory LanguageModel.fromJson(Map<String, dynamic> json) => LanguageModel(
    id: json["id"] ?? '',
    name: json["name"] ?? '',
  );
}