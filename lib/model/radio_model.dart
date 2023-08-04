class RadioModel {
  String id;
  String name;
  String streamUrl;

  String image;
  String about;

  String language;
  String genreName;
  String genreId;

  int status;
  int isFeatured;
  int searchCount;

  // String albums;

  RadioModel(
      {required this.id,
      required this.name,
      required this.image,
      required this.about,
      required this.language,
      required this.genreName,
      required this.genreId,
      required this.status,
      required this.streamUrl,
      required this.isFeatured,
      required this.searchCount
      // required this.albums,
      });

  factory RadioModel.fromJson(Map<String, dynamic> json) => RadioModel(
        id: json["id"] ?? '',
        name: json["name"] ?? '',
        about: json["about"] ?? '',
        genreName: json["genreName"],
        genreId: json["genreId"],
        streamUrl: json["streamUrl"] ?? '',
        image: json["image"] ?? '',
        language: json["language"],
        status: json["status"],
        isFeatured: json["isFeatured"] ?? 0,
        searchCount: json["searchedCount"] ?? 0,
        // albums: json["albums"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "about": about,
        "genreId": genreId,
        "genreName": genreName,
        "streamUrl": streamUrl,
        "status": status,
        "image": image,
        "language": language,
        "isFeatured": isFeatured,
      };
}

// class PlayingMediaModel {
//   String id;
//   String radioName;
//   String image;
//
//   PlayingMediaModel({
//     required this.id,
//     required this.radioName,
//     required this.image,
//   });
// }
