import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/api/api_model/DetailsMoviesResponse.dart';
import 'package:movies_app/home/home_tab/details_movie_screen.dart';
import 'package:movies_app/provider/movies_provider.dart';
import 'package:provider/provider.dart';

class WatchitMoviesItem extends StatelessWidget {
  DetailsMoviesResponse movie;

  WatchitMoviesItem(this.movie);

  @override
  Widget build(BuildContext context) {
    var moviesProvider = Provider.of<MoviesProvider>(context);

    return InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => DetailsMovieScreen(
                movie.id, movie.title ?? '')));
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
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
                ),
                InkWell(
                  onTap: () {
                    if (moviesProvider.moviesIds.contains(movie.id.toString())) {
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
                        fontSize: 18
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      movie.releaseDate?.split('-')[0] ?? '',
                      style: TextStyle(
                          color: Colors.grey
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '${moviesCompanies(movie.productionCompanies??[]).join(' , ')}' ?? '',
                      style: TextStyle(
                        color: Colors.grey
                      ),
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
  List<String> moviesCompanies(List<ProductionCompanies> companies){
    List<String> companiesName=[];
    companies.forEach((element) {companiesName.add(element.name??'');});
    return companiesName;
  }
}
