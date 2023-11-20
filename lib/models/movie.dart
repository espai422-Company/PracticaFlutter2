import 'dart:convert';

class Movie {
  String id;
  String resultId;
  PrimaryImage? primaryImage;
  TitleType? titleType;
  TitleText? titleText;
  TitleText? originalTitleText;
  ReleaseYear? releaseYear;
  ReleaseDate? releaseDate; // Nullable ReleaseDate

  Movie({
    required this.id,
    required this.resultId,
    required this.primaryImage,
    required this.titleType,
    required this.titleText,
    required this.originalTitleText,
    required this.releaseYear,
    required this.releaseDate,
  });

  factory Movie.fromRawJson(String str) => Movie.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        id: json["_id"],
        resultId: json["id"],
        primaryImage: json["primaryImage"] == null
            ? null
            : PrimaryImage.fromJson(json["primaryImage"]),
        titleType: TitleType.fromJson(json["titleType"]),
        titleText: TitleText.fromJson(json["titleText"]),
        originalTitleText: TitleText.fromJson(json["originalTitleText"]),
        releaseYear: ReleaseYear.fromJson(json["releaseYear"]),
        releaseDate: json["releaseDate"] == null
            ? null
            : ReleaseDate.fromJson(json["releaseDate"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "id": resultId,
        "primaryImage": primaryImage?.toJson(),
        "titleType": titleType?.toJson(),
        "titleText": titleText?.toJson(),
        "originalTitleText": originalTitleText?.toJson(),
        "releaseYear": releaseYear?.toJson(),
        "releaseDate": releaseDate?.toJson(),
      };
}

// Your other classes remain unchanged...

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
  int day;
  int month;
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

class ReleaseYear {
  int year;
  dynamic endYear;
  String typename;

  ReleaseYear({
    required this.year,
    required this.endYear,
    required this.typename,
  });

  factory ReleaseYear.fromRawJson(String str) =>
      ReleaseYear.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ReleaseYear.fromJson(Map<String, dynamic> json) => ReleaseYear(
        year: json["year"],
        endYear: json["endYear"],
        typename: json["__typename"],
      );

  Map<String, dynamic> toJson() => {
        "year": year,
        "endYear": endYear,
        "__typename": typename,
      };
}

class TitleType {
  DisplayableProperty displayableProperty;
  String text;
  String id;
  bool isSeries;
  bool isEpisode;
  List<Category> categories;
  bool canHaveEpisodes;
  String typename;

  TitleType({
    required this.displayableProperty,
    required this.text,
    required this.id,
    required this.isSeries,
    required this.isEpisode,
    required this.categories,
    required this.canHaveEpisodes,
    required this.typename,
  });

  factory TitleType.fromRawJson(String str) =>
      TitleType.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TitleType.fromJson(Map<String, dynamic> json) => TitleType(
        displayableProperty:
            DisplayableProperty.fromJson(json["displayableProperty"]),
        text: json["text"],
        id: json["id"],
        isSeries: json["isSeries"],
        isEpisode: json["isEpisode"],
        categories: List<Category>.from(
            json["categories"].map((x) => Category.fromJson(x))),
        canHaveEpisodes: json["canHaveEpisodes"],
        typename: json["__typename"],
      );

  Map<String, dynamic> toJson() => {
        "displayableProperty": displayableProperty.toJson(),
        "text": text,
        "id": id,
        "isSeries": isSeries,
        "isEpisode": isEpisode,
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
        "canHaveEpisodes": canHaveEpisodes,
        "__typename": typename,
      };
}

class Category {
  String value;
  String typename;

  Category({
    required this.value,
    required this.typename,
  });

  factory Category.fromRawJson(String str) =>
      Category.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        value: json["value"],
        typename: json["__typename"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "__typename": typename,
      };
}

class DisplayableProperty {
  Caption value;
  String typename;

  DisplayableProperty({
    required this.value,
    required this.typename,
  });

  factory DisplayableProperty.fromRawJson(String str) =>
      DisplayableProperty.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DisplayableProperty.fromJson(Map<String, dynamic> json) =>
      DisplayableProperty(
        value: Caption.fromJson(json["value"]),
        typename: json["__typename"],
      );

  Map<String, dynamic> toJson() => {
        "value": value.toJson(),
        "__typename": typename,
      };
}
