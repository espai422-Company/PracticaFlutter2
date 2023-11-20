import 'dart:convert';
import 'package:movies_app/models/normal_movies_response.dart';

import 'movie.dart' as mv;

class Movie2 {
  String id;
  String resultId;
  PrimaryImage? primaryImage;
  TitleType titleType;
  TitleText titleText;
  TitleText originalTitleText;
  mv.ReleaseYear releaseYear;
  ReleaseDate? releaseDate;

  Movie2({
    required this.id,
    required this.resultId,
    required this.primaryImage,
    required this.titleType,
    required this.titleText,
    required this.originalTitleText,
    required this.releaseYear,
    required this.releaseDate,
  });

  factory Movie2.fromRawJson(String str) => Movie2.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Movie2.fromJson(Map<String, dynamic> json) => Movie2(
        id: json["_id"],
        resultId: json["id"],
        primaryImage: json["primaryImage"] == null
            ? null
            : PrimaryImage.fromJson(json["primaryImage"]),
        titleType: TitleType.fromJson(json["titleType"]),
        titleText: TitleText.fromJson(json["titleText"]),
        originalTitleText: TitleText.fromJson(json["originalTitleText"]),
        releaseYear: mv.ReleaseYear.fromJson(json["releaseYear"]),
        releaseDate: json["releaseDate"] == null
            ? null
            : ReleaseDate.fromJson(json["releaseDate"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "id": resultId,
        "primaryImage": primaryImage?.toJson(),
        "titleType": titleType.toJson(),
        "titleText": titleText.toJson(),
        "originalTitleText": originalTitleText.toJson(),
        "releaseYear": releaseYear.toJson(),
        "releaseDate": releaseDate?.toJson(),
      };
}
