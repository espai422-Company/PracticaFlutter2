import 'dart:convert';

import 'package:movies_app/models/normal_movie.dart';

class NormalMoviesResponse {
  int page;
  String next;
  int entries;
  List<NormalMovie> results;

  NormalMoviesResponse({
    required this.page,
    required this.next,
    required this.entries,
    required this.results,
  });

  factory NormalMoviesResponse.fromRawJson(String str) =>
      NormalMoviesResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory NormalMoviesResponse.fromJson(Map<String, dynamic> json) =>
      NormalMoviesResponse(
        page: json["page"],
        next: json["next"],
        entries: json["entries"],
        results: List<NormalMovie>.from(
            json["results"].map((x) => NormalMovie.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "next": next,
        "entries": entries,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class TitleText {
  String text;
  String typename;

  TitleText({
    required this.text,
    required this.typename,
  });

  factory TitleText.fromRawJson(String str) =>
      TitleText.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TitleText.fromJson(Map<String, dynamic> json) => TitleText(
        text: json["text"],
        typename: json["__typename"],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "__typename": typename,
      };
}

class PrimaryImage {
  String id;
  int width;
  int height;
  String url;
  Caption caption;
  String typename;

  PrimaryImage({
    required this.id,
    required this.width,
    required this.height,
    required this.url,
    required this.caption,
    required this.typename,
  });

  factory PrimaryImage.fromRawJson(String str) =>
      PrimaryImage.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PrimaryImage.fromJson(Map<String, dynamic> json) => PrimaryImage(
        id: json["id"],
        width: json["width"],
        height: json["height"],
        url: json["url"],
        caption: Caption.fromJson(json["caption"]),
        typename: json["__typename"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "width": width,
        "height": height,
        "url": url,
        "caption": caption.toJson(),
        "__typename": typename,
      };
}

class Caption {
  String plainText;
  String typename;

  Caption({
    required this.plainText,
    required this.typename,
  });

  factory Caption.fromRawJson(String str) => Caption.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Caption.fromJson(Map<String, dynamic> json) => Caption(
        plainText: json["plainText"],
        typename: json["__typename"],
      );

  Map<String, dynamic> toJson() => {
        "plainText": plainText,
        "__typename": typename,
      };
}

class ReleaseDate {
  dynamic day;
  int? month;
  int year;
  String typename;

  ReleaseDate({
    required this.day,
    required this.month,
    required this.year,
    required this.typename,
  });

  factory ReleaseDate.fromRawJson(String str) =>
      ReleaseDate.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ReleaseDate.fromJson(Map<String, dynamic> json) => ReleaseDate(
        day: json["day"],
        month: json["month"],
        year: json["year"],
        typename: json["__typename"],
      );

  Map<String, dynamic> toJson() => {
        "day": day,
        "month": month,
        "year": year,
        "__typename": typename,
      };
}

class TitleType {
  String text;
  String id;
  bool isSeries;
  bool isEpisode;
  String typename;

  TitleType({
    required this.text,
    required this.id,
    required this.isSeries,
    required this.isEpisode,
    required this.typename,
  });

  factory TitleType.fromRawJson(String str) =>
      TitleType.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TitleType.fromJson(Map<String, dynamic> json) => TitleType(
        text: json["text"],
        id: json["id"],
        isSeries: json["isSeries"],
        isEpisode: json["isEpisode"],
        typename: json["__typename"],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "id": id,
        "isSeries": isSeries,
        "isEpisode": isEpisode,
        "__typename": typename,
      };
}
