import 'package:flutter/material.dart';
import 'package:movies_app/api/api_manager.dart';
import 'package:movies_app/api/api_model/DetailsMoviesResponse.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:movies_app/api/api_model/MoviesMoreLikeResponse.dart';
import 'package:movies_app/home/home_tab/recomended_movies_widget.dart';
import 'package:movies_app/provider/movies_provider.dart';
import 'package:movies_app/theme/my_theme.dart';
import 'package:provider/provider.dart';

class DetailsMoviesWidget extends StatelessWidget {
  DetailsMoviesResponse movie;

  DetailsMoviesWidget(this.movie);

  @override
  Widget build(BuildContext context) {
    List<Genres> genres = movie.genres ?? [];
    var moviesProvider = Provider.of<MoviesProvider>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            movie.backdropPath == null
                ? Image(
                    fit: BoxFit.cover,
                    height: MediaQuery.of(context).size.height * 0.22,
                    width: double.infinity,
                    image: AssetImage('assets/images/default.jpg'))
                : CachedNetworkImage(
                    height: MediaQuery.of(context).size.height * 0.22,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    imageUrl:
                        'https://image.tmdb.org/t/p/w500/${(movie.backdropPath)}',
                    placeholder: (context, url) =>
                        Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => Icon(
                      Icons.error,
                      color: Colors.red,
                    ),
                  ),
            Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.07,
                ),
                Center(
                  child: Icon(
                    Icons.play_circle,
                    color: Colors.white,
                    size: 65,
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            movie.title ?? '',
            style: Theme.of(context)
                .textTheme
                .headline4
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            movie.releaseDate ?? '',
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  movie.posterPath == null
                      ? Image(
                          fit: BoxFit.cover,
                          height: 220,
                          width: 130,
                          image: AssetImage('assets/images/default.jpg'))
                      : CachedNetworkImage(
                          height: 220,
                          width: 130,
                          fit: BoxFit.cover,
                          imageUrl:
                              'https://image.tmdb.org/t/p/w500/${movie.posterPath}',
                          placeholder: (context, url) =>
                              Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) => Icon(
                            Icons.error,
                            color: Colors.red,
                          ),
                        ),
                  InkWell(
                    onTap: () {
                      if (moviesProvider.moviesIds
                          .contains(movie.id.toString())) {
                        moviesProvider.removeMovieId(movie.id.toString());
                      } else {
                        moviesProvider.addMovieId(movie.id.toString());
                      }
                    },
                    child: Image(
                      fit: BoxFit.fitHeight,
                      image: AssetImage(
                          moviesProvider.moviesIds.contains(movie.id.toString())
                              ? 'assets/images/bookmark.png'
                              : 'assets/images/bookmark1.png'),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Visibility(
                          visible: genres.length != 0 ? true : false,
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 5),
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: Colors.white,
                                  width: 2,
                                )),
                            child: Text(
                              genres.length != 0
                                  ? (movie.genres?[0].name) ?? ''
                                  : '',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        Visibility(
                          visible: genres.length >= 2 ? true : false,
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 5),
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: Colors.white,
                                  width: 2,
                                )),
                            child: Text(
                              genres.length >= 2
                                  ? (movie.genres?[1].name) ?? ''
                                  : '',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Visibility(
                          visible: genres.length >= 3 ? true : false,
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 5),
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: Colors.white,
                                  width: 2,
                                )),
                            child: Text(
                              genres.length >= 3
                                  ? (movie.genres?[2].name) ?? ''
                                  : '',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        Visibility(
                          visible: genres.length >= 4 ? true : false,
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 5),
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: Colors.white,
                                  width: 2,
                                )),
                            child: Text(
                              genres.length >= 4
                                  ? (movie.genres?[3].name) ?? ''
                                  : '',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Visibility(
                          visible: genres.length >= 5 ? true : false,
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 5),
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: Colors.white,
                                  width: 2,
                                )),
                            child: Text(
                              genres.length >= 5
                                  ? (movie.genres?[4].name) ?? ''
                                  : '',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        Visibility(
                          visible: genres.length >= 6 ? true : false,
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 5),
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: Colors.white,
                                  width: 2,
                                )),
                            child: Text(
                              genres.length >= 6
                                  ? (movie.genres?[5].name) ?? ''
                                  : '',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        movie.overview ?? '',
                        style: Theme.of(context).textTheme.bodyText2,
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
                        Text('${(movie.voteAverage)?.toStringAsFixed(1)}'),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          height: MediaQuery.of(context).size.height * 0.4,
          color: MyTheme.widgetColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'More Like This',
                  style: Theme.of(context).textTheme.headline4?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              Expanded(
                child: FutureBuilder<MoviesMoreLikeResponse>(
                  future: ApiManager.getMoviesMoreLikeResponse(movie.id!),
                  builder: (context, snapshot) {
                    if (snapshot.hasError)
                      return Center(
                        child: Text('${snapshot.error}'),
                      );
                    else if (snapshot.connectionState ==
                        ConnectionState.waiting)
                      return Center(child: CircularProgressIndicator());
                    var data = snapshot.data;
                    if (data?.status_code != null)
                      return Center(
                        child: Text('${data?.status_message}'),
                      );
                    var results = data?.results;
                    return results?.length == 0
                        ? Center(
                            child: Text(
                              'No Data to Display',
                              style: Theme.of(context).textTheme.headline4,
                            ),
                          )
                        : RecomendedMoviesWidget(results!);
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
