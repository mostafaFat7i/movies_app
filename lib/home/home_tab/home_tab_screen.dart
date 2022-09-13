import 'package:flutter/material.dart';
import 'package:movies_app/api/api_manager.dart';
import 'package:movies_app/api/api_model/NewMoviesReleaseResponse.dart';
import 'package:movies_app/api/api_model/PopularMoviesResponse.dart';
import 'package:movies_app/api/api_model/RecomendedMoviesResponse.dart';
import 'package:movies_app/home/home_tab/new_movies_release_widget.dart';
import 'package:movies_app/home/home_tab/popular_movies_widget.dart';
import 'package:movies_app/home/home_tab/recomended_movies_widget.dart';
import 'package:movies_app/theme/my_theme.dart';

class HomeTabScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              FutureBuilder<NewMoviesReleaseResponse>(
                future: ApiManager.getNewMoviesReleaseResponse(),
                builder: (context, snapshot) {
                  if (snapshot.hasError)
                    return Center(
                      child: Text('${snapshot.error}'),
                    );
                  else if (snapshot.connectionState == ConnectionState.waiting)
                    return Center(child: CircularProgressIndicator());
                  var data = snapshot.data;
                  if (data?.status_code != null)
                    return Center(
                      child: Text('${data?.status_message}'),
                    );
                  var results = data;
                  return NewMoviesReleaseWidget(results!);
                },
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                height: MediaQuery.of(context).size.height*0.3,
                color: MyTheme.widgetColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        'Popular',
                        style: Theme.of(context).textTheme.headline4?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      child: FutureBuilder<PopularMoviesResponse>(
                        future: ApiManager.getPopularMoviesResponse(),
                        builder: (context, snapshot) {
                          if (snapshot.hasError)
                            return Center(
                              child: Text('${snapshot.error}'),
                            );
                          else if (snapshot.connectionState == ConnectionState.waiting)
                            return Center(child: CircularProgressIndicator());
                          var data = snapshot.data;
                          if (data?.status_code != null)
                            return Center(
                              child: Text('${data?.status_message}'),
                            );
                          var results = data?.results;
                          return PopularMoviesWidget(results!);
                        },
                      ),
                    ),

                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 15),
                height: MediaQuery.of(context).size.height*0.4,
                color: MyTheme.widgetColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        'Recomended',
                        style: Theme.of(context).textTheme.headline4?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                    Expanded(
                      child: FutureBuilder<RecomendedMoviesResponse>(
                        future: ApiManager.getRecomendedMoviesResponse(),
                        builder: (context, snapshot) {
                          if (snapshot.hasError)
                            return Center(
                              child: Text('${snapshot.error}'),
                            );
                          else if (snapshot.connectionState == ConnectionState.waiting)
                            return Center(child: CircularProgressIndicator());
                          var data = snapshot.data;
                          if (data?.status_code != null)
                            return Center(
                              child: Text('${data?.status_message}'),
                            );
                          var results = data?.results;
                          return RecomendedMoviesWidget(results!);
                        },
                      ),
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Image(image: NetworkImage('https://image.tmdb.org/t/p/w500/${results![0].backdropPath}'))
