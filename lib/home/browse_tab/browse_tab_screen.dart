import 'package:flutter/material.dart';
import 'package:movies_app/api/api_manager.dart';
import 'package:movies_app/api/api_model/GenresResponse.dart';
import 'package:movies_app/home/browse_tab/movies_list_by_category.dart';

class BrowseTabScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
              'Browse Category ',
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: FutureBuilder<GenresResponse>(
                future: ApiManager.getMoviesGenersResponse(),
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

                  var categories = data?.genres;

                  return categories?.length != 0
                      ? GridView.count(
                          crossAxisCount: 2,
                          shrinkWrap: true,
                          children: List.generate(
                              categories!.length,
                              (index) => categorieslistItem(
                                  categories[index].name ?? '',categories[index].id!.toInt(),context)),
                        )
                      : Center(
                          child: Image(
                              image: AssetImage('assets/images/nomovies.png')),
                        );
                }),
          )
        ],
      ),
    );
  }

  Widget categorieslistItem(String categoryName,int categoryId,context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MoviesListByCategory(categoryId.toString(),categoryName)));
      },
      child: Container(
        margin: EdgeInsets.all(20),
        height: 100,
        width: 150,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/Action.jpg'),
                fit: BoxFit.fill),
            borderRadius: BorderRadius.circular(20)),
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/${categoryName}.jpg'),
                  fit: BoxFit.fill),
              borderRadius: BorderRadius.circular(20)),
          child: Center(
            child: Text(
              categoryName,
              style: TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22),
            ),
          ),
        ),
      ),
    );
  }
}
