import 'package:movies_app/models/models.dart';

class ActorsResponse {
  String page;
  String next;
  int entries;
  List<Actor> results;

  ActorsResponse({
    required this.page,
    required this.next,
    required this.entries,
    required this.results,
  });

  ActorsResponse copyWith({
    String? page,
    String? next,
    int? entries,
    List<Actor>? results,
  }) =>
      ActorsResponse(
        page: page ?? this.page,
        next: next ?? this.next,
        entries: entries ?? this.entries,
        results: results ?? this.results,
      );

  factory ActorsResponse.fromRawJson(String str) =>
      ActorsResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ActorsResponse.fromJson(Map<String, dynamic> json) => ActorsResponse(
        page: json["page"],
        next: json["next"],
        entries: json["entries"],
        results:
            List<Actor>.from(json["results"].map((x) => Actor.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "next": next,
        "entries": entries,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}
