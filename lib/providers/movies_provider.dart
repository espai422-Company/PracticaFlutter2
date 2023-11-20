import 'package:flutter/material.dart';
import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import 'package:movies_app/models/casting_response.dart';
import 'package:movies_app/models/models.dart';
import 'package:movies_app/models/movie2.dart';
import 'package:movies_app/models/normal_movies_response.dart';

class MoviesProvider extends ChangeNotifier {
  String _baseUrl = 'https://moviesdatabase.p.rapidapi.com';
  String _apiKey = 'e261fe5c1cmsheeb3731d4a3b275p15f337jsnb6c825996c77';
  String _apiHost = 'moviesdatabase.p.rapidapi.com';

  List<Movie> onDisplayMovies = [];
  List<Movie2> popularMovies = [];
  Map<int, List<Actor>> casting = {};

  MoviesProvider() {
    print('MoviesProvider inicializado');
    this.getOnDisplayMovies();
    this.getOnPopularMovies();
  }

  getOnDisplayMovies() async {
    Map<String, String> _headers = {
      'X-RapidAPI-Key': _apiKey,
      'X-RapidAPI-Host': 'moviesdatabase.p.rapidapi.com',
    };

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(Uri.parse('$_baseUrl/titles/x/upcoming'),
        headers: _headers);
    final Map<String, dynamic> decodedData = convert.jsonDecode(response.body);
    final nowPlayingResponse = MoviesResponse.fromJson(decodedData);
    onDisplayMovies = nowPlayingResponse.results;
    notifyListeners();
  }

  getOnPopularMovies() async {
    Map<String, String> _headers = {
      'X-RapidAPI-Key': _apiKey,
      'X-RapidAPI-Host': 'moviesdatabase.p.rapidapi.com',
    };

    // Await the http get response, then decode the json-formatted response.
    var response =
        await http.get(Uri.parse('$_baseUrl/titles'), headers: _headers);
    final Map<String, dynamic> decodedData = convert.jsonDecode(response.body);
    // print(decodedData);
    print('-------------------');
    print(NormalMoviesResponse.fromJson(decodedData));
    print('-------------------');
    final nowPlayingResponse = NormalMoviesResponse.fromJson(decodedData);
    popularMovies = nowPlayingResponse.results;
    notifyListeners();
  }

  Future<List<Actor>> getMovieCast(int idMovie) async {
    // if (casting.containsKey(idMovie)) return casting[idMovie]!;

    // var url = Uri.https(_baseUrl, '3/movie/$idMovie/credits', {
    //   'api_key': _apiKey,
    //   'language': _language,
    // });

    // // Await the http get response, then decode the json-formatted response.
    // var response = await http.get(url);
    // final Map<String, dynamic> decodedData = convert.jsonDecode(response.body);
    // final creditsResponse = CastResponse.fromJson(decodedData);
    // casting[idMovie] = creditsResponse.cast;

    return [];
    // return creditsResponse.cast;
  }
}
