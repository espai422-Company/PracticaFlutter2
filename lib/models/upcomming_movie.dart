import 'dart:convert';

class UpcommingMovie {
  String id;
  String resultId;
  MainImage? primaryImage;
  TitleType2? titleType;
  TitleContent? titleText;
  TitleContent? originalTitleText;
  ReleaseYear? releaseYear;
  ReleaseDates? releaseDate; // Nullable ReleaseDate

  UpcommingMovie({
    required this.id,
    required this.resultId,
    required this.primaryImage,
    required this.titleType,
    required this.titleText,
    required this.originalTitleText,
    required this.releaseYear,
    required this.releaseDate,
  });

  factory UpcommingMovie.fromRawJson(String str) =>
      UpcommingMovie.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UpcommingMovie.fromJson(Map<String, dynamic> json) => UpcommingMovie(
        id: json["_id"],
        resultId: json["id"],
        primaryImage: json["primaryImage"] == null
            ? null
            : MainImage.fromJson(json["primaryImage"]),
        titleType: TitleType2.fromJson(json["titleType"]),
        titleText: TitleContent.fromJson(json["titleText"]),
        originalTitleText: TitleContent.fromJson(json["originalTitleText"]),
        releaseYear: ReleaseYear.fromJson(json["releaseYear"]),
        releaseDate: json["releaseDate"] == null
            ? null
            : ReleaseDates.fromJson(json["releaseDate"]),
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

class TitleContent {
  String text;
  String typename;

  TitleContent({
    required this.text,
    required this.typename,
  });

  factory TitleContent.fromRawJson(String str) =>
      TitleContent.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TitleContent.fromJson(Map<String, dynamic> json) => TitleContent(
        text: json["text"],
        typename: json["__typename"],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "__typename": typename,
      };
}

class MainImage {
  String id;
  int width;
  int height;
  String url;
  Captions caption;
  String typename;

  MainImage({
    required this.id,
    required this.width,
    required this.height,
    required this.url,
    required this.caption,
    required this.typename,
  });

  factory MainImage.fromRawJson(String str) =>
      MainImage.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MainImage.fromJson(Map<String, dynamic> json) => MainImage(
        id: json["id"],
        width: json["width"],
        height: json["height"],
        url: json["url"],
        caption: Captions.fromJson(json["caption"]),
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

class Captions {
  String plainText;
  String typename;

  Captions({
    required this.plainText,
    required this.typename,
  });

  factory Captions.fromRawJson(String str) =>
      Captions.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Captions.fromJson(Map<String, dynamic> json) => Captions(
        plainText: json["plainText"],
        typename: json["__typename"],
      );

  Map<String, dynamic> toJson() => {
        "plainText": plainText,
        "__typename": typename,
      };
}

class ReleaseDates {
  int day;
  int month;
  int year;
  String typename;

  ReleaseDates({
    required this.day,
    required this.month,
    required this.year,
    required this.typename,
  });

  factory ReleaseDates.fromRawJson(String str) =>
      ReleaseDates.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ReleaseDates.fromJson(Map<String, dynamic> json) => ReleaseDates(
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

  @override
  String toString() {
    return 'Release Year: $year-${endYear ?? 'present'}';
  }
}

class TitleType2 {
  DisplayableProperty displayableProperty;
  String text;
  String id;
  bool isSeries;
  bool isEpisode;
  List<Category> categories;
  bool canHaveEpisodes;
  String typename;

  TitleType2({
    required this.displayableProperty,
    required this.text,
    required this.id,
    required this.isSeries,
    required this.isEpisode,
    required this.categories,
    required this.canHaveEpisodes,
    required this.typename,
  });

  factory TitleType2.fromRawJson(String str) =>
      TitleType2.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TitleType2.fromJson(Map<String, dynamic> json) => TitleType2(
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
  Captions value;
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
        value: Captions.fromJson(json["value"]),
        typename: json["__typename"],
      );

  Map<String, dynamic> toJson() => {
        "value": value.toJson(),
        "__typename": typename,
      };
}
