import 'dart:convert';

class Actor {
  String id;
  String nconst;
  String primaryName;
  dynamic birthYear;
  dynamic deathYear;
  String primaryProfession;
  String knownForTitles;

  Actor({
    required this.id,
    required this.nconst,
    required this.primaryName,
    required this.birthYear,
    required this.deathYear,
    required this.primaryProfession,
    required this.knownForTitles,
  });

  Actor copyWith({
    String? id,
    String? nconst,
    String? primaryName,
    dynamic birthYear,
    dynamic deathYear,
    String? primaryProfession,
    String? knownForTitles,
  }) =>
      Actor(
        id: id ?? this.id,
        nconst: nconst ?? this.nconst,
        primaryName: primaryName ?? this.primaryName,
        birthYear: birthYear ?? this.birthYear,
        deathYear: deathYear ?? this.deathYear,
        primaryProfession: primaryProfession ?? this.primaryProfession,
        knownForTitles: knownForTitles ?? this.knownForTitles,
      );

  factory Actor.fromRawJson(String str) => Actor.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Actor.fromJson(Map<String, dynamic> json) => Actor(
        id: json["_id"],
        nconst: json["nconst"],
        primaryName: json["primaryName"],
        birthYear: json["birthYear"],
        deathYear: json["deathYear"],
        primaryProfession: json["primaryProfession"],
        knownForTitles: json["knownForTitles"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "nconst": nconst,
        "primaryName": primaryName,
        "birthYear": birthYear,
        "deathYear": deathYear,
        "primaryProfession": primaryProfession,
        "knownForTitles": knownForTitles,
      };
}
