import 'package:flutter/material.dart';
import 'package:movies_app/api/api_manager.dart';
import 'package:movies_app/api/api_model/DetailsMoviesResponse.dart';
import 'package:movies_app/home/home_tab/details_movies_widget.dart';

class DetailsMovieScreen extends StatelessWidget {

  num? movieID;
  String movieName;
  DetailsMovieScreen(this.movieID,this.movieName);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(movieName),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder<DetailsMoviesResponse>(
              future: ApiManager.getDetailsMoviesResponse(movieID!),
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
                return DetailsMoviesWidget(results!);
              },
            ),
          ],
        ),
      ),
    );
  }
}
