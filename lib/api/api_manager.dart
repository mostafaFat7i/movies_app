import 'dart:convert';

import 'package:movies_app/api/api_model/DetailsMoviesResponse.dart';
import 'package:movies_app/api/api_model/GenresResponse.dart';
import 'package:movies_app/api/api_model/MoviesDiscoverResponse.dart';
import 'package:movies_app/api/api_model/MoviesMoreLikeResponse.dart';
import 'package:movies_app/api/api_model/MoviesSerchedResponse.dart';
import 'package:movies_app/api/api_model/NewMoviesReleaseResponse.dart';
import 'package:movies_app/api/api_model/PopularMoviesResponse.dart';
import 'package:http/http.dart' as http;
import 'package:movies_app/api/api_model/RecomendedMoviesResponse.dart';

class ApiManager{

  static const String BASE_URI = 'api.themoviedb.org';
  static const String API_KEY = 'de29dbc9e5391e656030926cf025e711';

 // https://api.themoviedb.org/3/movie/latest?api_key=de29dbc9e5391e656030926cf025e711

  static Future<NewMoviesReleaseResponse> getNewMoviesReleaseResponse() async{
    var uri = Uri.https(BASE_URI, '/3/movie/latest', {
      'api_key': API_KEY,
    });
    var response = await http.get(uri);
    var json=jsonDecode(response.body);
    NewMoviesReleaseResponse soursesRespons=NewMoviesReleaseResponse.fromJson(json);
    return soursesRespons;
  }

  //https://api.themoviedb.org/3/movie/popular?api_key=de29dbc9e5391e656030926cf025e711

  static Future<PopularMoviesResponse> getPopularMoviesResponse() async{
    var uri = Uri.https(BASE_URI, '/3/movie/popular', {
      'api_key': API_KEY,
    });
    var response = await http.get(uri);
    var json=jsonDecode(response.body);
    PopularMoviesResponse soursesRespons=PopularMoviesResponse.fromJson(json);
    return soursesRespons;
  }

  //https://api.themoviedb.org/3/movie/top_rated?api_key=de29dbc9e5391e656030926cf025e711

  static Future<RecomendedMoviesResponse> getRecomendedMoviesResponse() async{
    var uri = Uri.https(BASE_URI, '/3/movie/top_rated', {
      'api_key': API_KEY,
    });
    var response = await http.get(uri);
    var json=jsonDecode(response.body);
    RecomendedMoviesResponse soursesRespons=RecomendedMoviesResponse.fromJson(json);
    return soursesRespons;
  }

  //https://api.themoviedb.org/3/movie/610150?api_key=de29dbc9e5391e656030926cf025e711

  static Future<DetailsMoviesResponse> getDetailsMoviesResponse(num movieId) async{
    var uri = Uri.https(BASE_URI, '/3/movie/$movieId', {
      'api_key': API_KEY,
    });
    var response = await http.get(uri);
    var json=jsonDecode(response.body);
    DetailsMoviesResponse soursesRespons=DetailsMoviesResponse.fromJson(json);
    return soursesRespons;
  }

  //https://api.themoviedb.org/3/movie/2374/similar?api_key=de29dbc9e5391e656030926cf025e711&language=en-US&page=1

  static Future<MoviesMoreLikeResponse> getMoviesMoreLikeResponse(num movieId) async{
    var uri = Uri.https(BASE_URI, '/3/movie/$movieId/similar', {
      'api_key': API_KEY,
    });
    var response = await http.get(uri);
    var json=jsonDecode(response.body);
    MoviesMoreLikeResponse soursesRespons=MoviesMoreLikeResponse.fromJson(json);
    return soursesRespons;
  }

  //https://api.themoviedb.org/3/search/movie?api_key=de29dbc9e5391e656030926cf025e711&language=en-US&page=1&query=a

  static Future<MoviesSerchedResponse> getMoviesInSearchResponse(String queryValue) async{
    var uri = Uri.https(BASE_URI, '/3/search/movie', {
      'api_key': API_KEY,
      'query':queryValue==''?'\$':queryValue,
    });
    var response = await http.get(uri);
    var json=jsonDecode(response.body);
    MoviesSerchedResponse soursesRespons=MoviesSerchedResponse.fromJson(json);
    return soursesRespons;
  }
  //https://api.themoviedb.org/3/genre/movie/list?api_key=de29dbc9e5391e656030926cf025e711&language=en-US

  static Future<GenresResponse> getMoviesGenersResponse() async{
    var uri = Uri.https(BASE_URI, '/3/genre/movie/list', {
      'api_key': API_KEY,
    });
    var response = await http.get(uri);
    var json=jsonDecode(response.body);
    GenresResponse soursesRespons=GenresResponse.fromJson(json);
    return soursesRespons;
  }
  //https://api.themoviedb.org/3/discover/movie?api_key=de29dbc9e5391e656030926cf025e711&language=en-US&with_genres=80

  static Future<MoviesDiscoverResponse> getMoviesDiscoverResponse(String? categoryId) async{
    var uri = Uri.https(BASE_URI, '/3/discover/movie', {
      'api_key': API_KEY,
      'with_genres':categoryId,

    });
    var response = await http.get(uri);
    var json=jsonDecode(response.body);
    MoviesDiscoverResponse soursesRespons=MoviesDiscoverResponse.fromJson(json);
    return soursesRespons;
  }
}