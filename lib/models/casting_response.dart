import 'dart:convert';

import 'package:movies_app/models/actor.dart';

class CastResponse {
  int id;
  List<Actor> cast;
  List<Actor> crew;

  CastResponse({
    required this.id,
    required this.cast,
    required this.crew,
  });

  factory CastResponse.fromRawJson(String str) =>
      CastResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CastResponse.fromJson(Map<String, dynamic> json) => CastResponse(
        id: json["id"],
        cast: List<Actor>.from(json["cast"].map((x) => Actor.fromJson(x))),
        crew: List<Actor>.from(json["crew"].map((x) => Actor.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "cast": List<dynamic>.from(cast.map((x) => x.toJson())),
        "crew": List<dynamic>.from(crew.map((x) => x.toJson())),
      };
}

enum Department {
  ACTING,
  ART,
  CAMERA,
  COSTUME_MAKE_UP,
  CREW,
  DIRECTING,
  EDITING,
  LIGHTING,
  PRODUCTION,
  SOUND,
  VISUAL_EFFECTS,
  WRITING
}

final departmentValues = EnumValues({
  "Acting": Department.ACTING,
  "Art": Department.ART,
  "Camera": Department.CAMERA,
  "Costume & Make-Up": Department.COSTUME_MAKE_UP,
  "Crew": Department.CREW,
  "Directing": Department.DIRECTING,
  "Editing": Department.EDITING,
  "Lighting": Department.LIGHTING,
  "Production": Department.PRODUCTION,
  "Sound": Department.SOUND,
  "Visual Effects": Department.VISUAL_EFFECTS,
  "Writing": Department.WRITING
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
