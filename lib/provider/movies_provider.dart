import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MoviesProvider extends ChangeNotifier {

  List<String> moviesIds=[];

  MoviesProvider() {
    loadMoviesIds();
  }

  void addMovieId(String movieId) {
    moviesIds.add(movieId);
    notifyListeners();
    _changeMoviesIdsListStorage();
  }
  void removeMovieId(String movieId) {
    moviesIds.remove(movieId);
    notifyListeners();
    _changeMoviesIdsListStorage();
  }

  void _changeMoviesIdsListStorage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('moviesIds', moviesIds);
  }


  void loadMoviesIds() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> ids = (prefs.getStringList('moviesIds') ?? []);
    moviesIds = ids;
    notifyListeners();
  }


}
