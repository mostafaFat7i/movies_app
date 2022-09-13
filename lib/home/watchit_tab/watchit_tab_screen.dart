import 'package:flutter/material.dart';
import 'package:movies_app/api/api_manager.dart';
import 'package:movies_app/api/api_model/DetailsMoviesResponse.dart';
import 'package:movies_app/home/watchit_tab/watchit_movies_item.dart';
import 'package:movies_app/provider/movies_provider.dart';
import 'package:provider/provider.dart';

class WatchitTabScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var moviesProvider = Provider.of<MoviesProvider>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Watchlist',
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.separated(
                itemBuilder: (_, index) {
                  return watchlistItem(moviesProvider.moviesIds[index]);
                },
                separatorBuilder: (_, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                    height: 1,
                    color: Colors.white,
                    width: double.infinity,
                  );
                },
                itemCount: moviesProvider.moviesIds.length),
          )
        ],
      ),
    );
  }

  Widget watchlistItem(String movieId) {
    return FutureBuilder<DetailsMoviesResponse>(
      future: ApiManager.getDetailsMoviesResponse(num.parse(movieId)),
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
        return WatchitMoviesItem(results!);
      },
    );

  }
}
