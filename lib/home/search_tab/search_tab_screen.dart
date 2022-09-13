import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/api/api_manager.dart';
import 'package:movies_app/api/api_model/DetailsMoviesResponse.dart';
import 'package:movies_app/api/api_model/MoviesSerchedResponse.dart';
import 'package:movies_app/api/api_model/PopularMoviesResponse.dart';
import 'package:movies_app/home/home_tab/details_movie_screen.dart';
import 'package:movies_app/theme/my_theme.dart';

class SearchTabScreen extends StatefulWidget {
  const SearchTabScreen({Key? key}) : super(key: key);

  @override
  State<SearchTabScreen> createState() => _SearchTabScreenState();
}

class _SearchTabScreenState extends State<SearchTabScreen> {
  String queryValue = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                color: MyTheme.searchColor,
                borderRadius: BorderRadius.circular(50)),
            child: TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                hintText: 'search movies...',
                hintStyle: TextStyle(color: Colors.white),
                border: InputBorder.none,
              ),
              onChanged: (value) {
                queryValue = value;
                setState(() {});
              },
            ),
          ),
          Expanded(
            child: FutureBuilder<MoviesSerchedResponse>(
                future: ApiManager.getMoviesInSearchResponse(queryValue),
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

                  return results?.length != 0
                      ? ListView.separated(
                          separatorBuilder: (_, index) {
                            return Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 5),
                              height: 1,
                              color: Colors.white,
                              width: double.infinity,
                            );
                          },
                          itemCount: results?.length ?? 0,
                          itemBuilder: (_, index) {
                            return MovieWidget(results![index]);
                          },
                        )
                      : Center(
                          child: Image(image: AssetImage('assets/images/nomovies.png')),
                        );
                }),
          )
        ],
      ),
    );
  }

  Widget MovieWidget(Results movie) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => DetailsMovieScreen(movie.id, movie.title ?? '')));
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            movie.backdropPath == null
                ? Image(
                fit: BoxFit.cover,
                height: 120,
                width: 120,
                image: AssetImage('assets/images/default.jpg'))
                :CachedNetworkImage(
              fit: BoxFit.cover,
              height: 120,
              width: 120,
              imageUrl: 'https://image.tmdb.org/t/p/w500/${movie.backdropPath}',
              placeholder: (context, url) =>
                  Center(child: CircularProgressIndicator()),

            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.title ?? '',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 18),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      movie.releaseDate?.split('-')[0] ?? '',
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
                        Text('${movie.voteAverage}'),
                      ],
                    ),

                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
