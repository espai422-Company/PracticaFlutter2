import 'dart:convert';

import 'package:movies_app/models/movie.dart';
import 'package:movies_app/models/movie2.dart';

class MoviesResponse {
  int page;
  String next;
  int entries;
  List<Movie> results;

  MoviesResponse({
    required this.page,
    required this.next,
    required this.entries,
    required this.results,
  });

  factory MoviesResponse.fromRawJson(String str) =>
      MoviesResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MoviesResponse.fromJson(Map<String, dynamic> json) => MoviesResponse(
        page: json["page"],
        next: json["next"],
        entries: json["entries"],
        results:
            List<Movie>.from(json["results"].map((x) => Movie.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "next": next,
        "entries": entries,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}
