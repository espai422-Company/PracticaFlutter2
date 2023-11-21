import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:movies_app/models/models.dart';

class MoviesProvider extends ChangeNotifier {
  String _baseUrl = 'https://moviesdatabase.p.rapidapi.com';
  String _apiKey = 'e261fe5c1cmsheeb3731d4a3b275p15f337jsnb6c825996c77';
  String _apiHost = 'moviesdatabase.p.rapidapi.com';

  List<UpcommingMovie> onDisplayMovies = [];
  List<NormalMovie> popularMovies = [];
  Map<int, List<Actor>> casting = {};

  MoviesProvider() {
    print('hola');
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

    final nowPlayingResponse = NormalMoviesResponse.fromJson(decodedData);
    popularMovies = nowPlayingResponse.results;
    notifyListeners();
  }

  Future<List<Actor>> getMovieCast(int idMovie) async {
    var url = Uri.parse('${_baseUrl}/actors');
    var headers = {
      'X-RapidAPI-Key': 'e261fe5c1cmsheeb3731d4a3b275p15f337jsnb6c825996c77',
      'X-RapidAPI-Host': 'moviesdatabase.p.rapidapi.com'
    };
    var params = {'page': (idMovie % 9).toString()};

    var response = await http.get(
      url.replace(queryParameters: params),
      headers: headers,
    );

    var jsonResponse = convert.jsonDecode(response.body);
    return ActorsResponse.fromJson(jsonResponse).results;
  }
}
