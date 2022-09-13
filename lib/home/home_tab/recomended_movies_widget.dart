import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/api/api_model/PopularMoviesResponse.dart';
import 'package:movies_app/home/home_tab/details_movie_screen.dart';
import 'package:movies_app/provider/movies_provider.dart';
import 'package:movies_app/theme/my_theme.dart';
import 'package:provider/provider.dart';

class RecomendedMoviesWidget extends StatelessWidget {
  List<Results> results;

  RecomendedMoviesWidget(this.results);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: (_, index) {
        return InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => DetailsMovieScreen(
                      results[index].id, results[index].title ?? '')));
            },
            child: moviesRecomendedItem(results[index], context));
      },
      itemCount: results.length,
    );
  }
}

Widget moviesRecomendedItem(Results move, context) {
  var moviesProvider = Provider.of<MoviesProvider>(context);

  return Card(
    margin: EdgeInsets.all(10),
    color: MyTheme.widgetItemColor,
    child: Container(
      width: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              children: [
                move.posterPath == null
                    ? Image(
                    fit: BoxFit.cover,
                    width: 150,
                    image: AssetImage('assets/images/default.jpg'))
                    :CachedNetworkImage(
                  fit: BoxFit.cover,
                  width: 150,
                  imageUrl:
                      'https://image.tmdb.org/t/p/w500/${move.posterPath}',
                ),
                InkWell(
                  onTap: () {
                    if (moviesProvider.moviesIds.contains(move.id.toString())) {
                      moviesProvider.removeMovieId(move.id.toString());
                    } else {
                      moviesProvider.addMovieId(move.id.toString());
                    }
                  },
                  child: Image(
                    fit: BoxFit.fitHeight,
                    image: AssetImage(
                        moviesProvider.moviesIds.contains(move.id.toString())
                            ? 'assets/images/bookmark.png'
                            : 'assets/images/bookmark1.png'),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Icon(
                Icons.star,
                color: MyTheme.goldColor,
              ),
              SizedBox(
                width: 5,
              ),
              Text('${move.voteAverage}'),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(5.0),
            child: Text(move.title ?? ''),
          ),
          Padding(
            padding: EdgeInsets.all(5.0),
            child: Text(move.releaseDate ?? ''),
          ),
        ],
      ),
    ),
  );
}
