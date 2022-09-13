import 'package:flutter/material.dart';
import 'package:movies_app/api/api_model/NewMoviesReleaseResponse.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:movies_app/home/home_tab/details_movie_screen.dart';

class NewMoviesReleaseWidget extends StatelessWidget {
  NewMoviesReleaseResponse movie;

  NewMoviesReleaseWidget(this.movie);

  @override
  Widget build(BuildContext context) {
    return Stack(
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
                    'https://image.tmdb.org/t/p/w500/${movie.backdropPath}',
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
        Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.07,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  movie.posterPath == null
                      ? Image(
                          fit: BoxFit.cover,
                          height: 180,
                          width: 130,
                          image: AssetImage('assets/images/default.jpg'))
                      : CachedNetworkImage(
                          height: 180,
                          width: 130,
                          fit: BoxFit.cover,
                          imageUrl:
                              'https://image.tmdb.org/t/p/w500/${movie.posterPath ?? '/hek3koDUyRQk7FIhPXsa6mT2Zc3.jpg'}',
                          placeholder: (context, url) =>
                              Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) => Icon(
                            Icons.error,
                            color: Colors.red,
                          ),
                        ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          movie.title ?? '',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          movie.releaseDate ?? '',
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

//CarouselSlider.builder(
//       itemCount: movies.length,
//       itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
//           Stack(
//         children: [
//           CachedNetworkImage(
//             height: MediaQuery.of(context).size.height * 0.3,
//             fit: BoxFit.cover,
//             imageUrl:
//                 'https://image.tmdb.org/t/p/w500/${movies[itemIndex].backdropPath}',
//             placeholder: (context, url) =>
//                 Center(child: CircularProgressIndicator()),
//             errorWidget: (context, url, error) => Icon(Icons.error),
//           ),
//           Column(
//             children: [
//               SizedBox(
//                 height: MediaQuery.of(context).size.height * 0.13,
//               ),
//               Center(
//                 child: movies[1].video!
//                     ? Icon(
//                         Icons.play_circle,
//                         color: Colors.white,
//                         size: 55,
//                       )
//                     : Text(''),
//               ),
//             ],
//           ),
//           Column(
//             children: [
//               SizedBox(
//                 height: MediaQuery.of(context).size.height * 0.13,
//               ),
//               Padding(
//                 padding:
//                     const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   children: [
//                     CachedNetworkImage(
//                       height: 200,
//                       width: 130,
//                       fit: BoxFit.cover,
//                       imageUrl:
//                           'https://image.tmdb.org/t/p/w500/${movies[itemIndex].posterPath}',
//                       placeholder: (context, url) =>
//                           Center(child: CircularProgressIndicator()),
//                       errorWidget: (context, url, error) => Icon(Icons.error),
//                     ),
//                     SizedBox(
//                       width: 10,
//                     ),
//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             movies[itemIndex].title ?? '',
//                             style: Theme.of(context)
//                                 .textTheme
//                                 .bodyText2
//                                 ?.copyWith(fontWeight: FontWeight.bold),
//                           ),
//                           SizedBox(
//                             height: 10,
//                           ),
//                           Text(
//                             movies[itemIndex].releaseDate ?? '',
//                             style: Theme.of(context).textTheme.bodyText1,
//                           ),
//                           SizedBox(
//                             height: 20,
//                           ),
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//       options: CarouselOptions(
//         height: MediaQuery.of(context).size.height * 0.5,
//         viewportFraction: 1,
//         autoPlay: true,
//         autoPlayInterval: Duration(seconds: 5),
//         autoPlayAnimationDuration: Duration(milliseconds: 800),
//         autoPlayCurve: Curves.fastOutSlowIn,
//       ),
//     )
