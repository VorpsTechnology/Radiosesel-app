class UserModel {
  String id;
  List<String> likedRadios;
  List<String> prefLanguages;

  int status;

  UserModel({
    required this.id,
    required this.likedRadios,
    required this.prefLanguages,
    required this.status,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        likedRadios: json["likedRadio"] == null
            ? []
            : (json["likedRadio"] as List<dynamic>)
                .map((e) => e.toString())
                .toList(),
        prefLanguages: json["languagePref"] == null
            ? ["English"]
            : (json["languagePref"] as List<dynamic>)
                .map((e) => e.toString())
                .toList(),
        status: json["status"],
      );
}
