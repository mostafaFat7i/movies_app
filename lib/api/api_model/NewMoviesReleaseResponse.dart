/// adult : true
/// backdrop_path : null
/// belongs_to_collection : null
/// budget : 0
/// genres : []
/// homepage : ""
/// id : 1020584
/// imdb_id : null
/// original_language : "de"
/// original_title : "Look What I've Got For You"
/// overview : ""
/// popularity : 0.0
/// poster_path : "/qzSATKF3cFt7Cg2ylwolCNw85DK.jpg"
/// production_companies : []
/// production_countries : []
/// release_date : ""
/// revenue : 0
/// runtime : 0
/// spoken_languages : [{"english_name":"English","iso_639_1":"en","name":"English"}]
/// status : "Released"
/// tagline : ""
/// title : "Look What I've Got For You"
/// video : false
/// vote_average : 0.0
/// vote_count : 0

class NewMoviesReleaseResponse {
  NewMoviesReleaseResponse({
      this.adult, 
      this.backdropPath, 
      this.belongsToCollection, 
      this.budget, 
      this.genres, 
      this.homepage, 
      this.id, 
      this.imdbId, 
      this.originalLanguage, 
      this.originalTitle, 
      this.overview, 
      this.popularity, 
      this.posterPath, 
      this.productionCompanies, 
      this.productionCountries, 
      this.releaseDate, 
      this.revenue, 
      this.runtime, 
      this.spokenLanguages, 
      this.status, 
      this.tagline, 
      this.title, 
      this.video, 
      this.voteAverage, 
      this.voteCount,
    this.status_message,
    this.status_code,
    this.success});

  NewMoviesReleaseResponse.fromJson(dynamic json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    belongsToCollection = json['belongs_to_collection'];
    budget = json['budget'];
    if (json['genres'] != null) {
      genres = [];
      json['genres'].forEach((v) {
        genres?.add(v);
      });
    }
    homepage = json['homepage'];
    id = json['id'];
    imdbId = json['imdb_id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    if (json['production_companies'] != null) {
      productionCompanies = [];
      json['production_companies'].forEach((v) {
        productionCompanies?.add(v);
      });
    }
    if (json['production_countries'] != null) {
      productionCountries = [];
      json['production_countries'].forEach((v) {
        productionCountries?.add(v);
      });
    }
    releaseDate = json['release_date'];
    revenue = json['revenue'];
    runtime = json['runtime'];
    if (json['spoken_languages'] != null) {
      spokenLanguages = [];
      json['spoken_languages'].forEach((v) {
        spokenLanguages?.add(SpokenLanguages.fromJson(v));
      });
    }
    status = json['status'];
    tagline = json['tagline'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
    status_message = json['status_message'];
    status_code = json['status_code'];
    success = json['success'];

  }
  bool? adult;
  dynamic? backdropPath;
  dynamic? belongsToCollection;
  num? budget;
  List<dynamic>? genres;
  String? homepage;
  num? id;
  dynamic imdbId;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  num? popularity;
  String? posterPath;
  List<dynamic>? productionCompanies;
  List<dynamic>? productionCountries;
  String? releaseDate;
  num? revenue;
  num? runtime;
  List<SpokenLanguages>? spokenLanguages;
  String? status;
  String? tagline;
  String? title;
  bool? video;
  num? voteAverage;
  num? voteCount;
  String? status_message;
  int? status_code;
  bool? success;
NewMoviesReleaseResponse copyWith({  bool? adult,
  dynamic backdropPath,
  dynamic belongsToCollection,
  num? budget,
  List<dynamic>? genres,
  String? homepage,
  num? id,
  dynamic imdbId,
  String? originalLanguage,
  String? originalTitle,
  String? overview,
  num? popularity,
  String? posterPath,
  List<dynamic>? productionCompanies,
  List<dynamic>? productionCountries,
  String? releaseDate,
  num? revenue,
  num? runtime,
  List<SpokenLanguages>? spokenLanguages,
  String? status,
  String? tagline,
  String? title,
  bool? video,
  num? voteAverage,
  num? voteCount,
}) => NewMoviesReleaseResponse(  adult: adult ?? this.adult,
  backdropPath: backdropPath ?? this.backdropPath,
  belongsToCollection: belongsToCollection ?? this.belongsToCollection,
  budget: budget ?? this.budget,
  genres: genres ?? this.genres,
  homepage: homepage ?? this.homepage,
  id: id ?? this.id,
  imdbId: imdbId ?? this.imdbId,
  originalLanguage: originalLanguage ?? this.originalLanguage,
  originalTitle: originalTitle ?? this.originalTitle,
  overview: overview ?? this.overview,
  popularity: popularity ?? this.popularity,
  posterPath: posterPath ?? this.posterPath,
  productionCompanies: productionCompanies ?? this.productionCompanies,
  productionCountries: productionCountries ?? this.productionCountries,
  releaseDate: releaseDate ?? this.releaseDate,
  revenue: revenue ?? this.revenue,
  runtime: runtime ?? this.runtime,
  spokenLanguages: spokenLanguages ?? this.spokenLanguages,
  status: status ?? this.status,
  tagline: tagline ?? this.tagline,
  title: title ?? this.title,
  video: video ?? this.video,
  voteAverage: voteAverage ?? this.voteAverage,
  voteCount: voteCount ?? this.voteCount,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['adult'] = adult;
    map['backdrop_path'] = backdropPath;
    map['belongs_to_collection'] = belongsToCollection;
    map['budget'] = budget;
    if (genres != null) {
      map['genres'] = genres?.map((v) => v.toJson()).toList();
    }
    map['homepage'] = homepage;
    map['id'] = id;
    map['imdb_id'] = imdbId;
    map['original_language'] = originalLanguage;
    map['original_title'] = originalTitle;
    map['overview'] = overview;
    map['popularity'] = popularity;
    map['poster_path'] = posterPath;
    if (productionCompanies != null) {
      map['production_companies'] = productionCompanies?.map((v) => v.toJson()).toList();
    }
    if (productionCountries != null) {
      map['production_countries'] = productionCountries?.map((v) => v.toJson()).toList();
    }
    map['release_date'] = releaseDate;
    map['revenue'] = revenue;
    map['runtime'] = runtime;
    if (spokenLanguages != null) {
      map['spoken_languages'] = spokenLanguages?.map((v) => v.toJson()).toList();
    }
    map['status'] = status;
    map['tagline'] = tagline;
    map['title'] = title;
    map['video'] = video;
    map['vote_average'] = voteAverage;
    map['vote_count'] = voteCount;
    return map;
  }

}

/// english_name : "English"
/// iso_639_1 : "en"
/// name : "English"

class SpokenLanguages {
  SpokenLanguages({
      this.englishName, 
      this.iso6391, 
      this.name,});

  SpokenLanguages.fromJson(dynamic json) {
    englishName = json['english_name'];
    iso6391 = json['iso_639_1'];
    name = json['name'];
  }
  String? englishName;
  String? iso6391;
  String? name;
SpokenLanguages copyWith({  String? englishName,
  String? iso6391,
  String? name,
}) => SpokenLanguages(  englishName: englishName ?? this.englishName,
  iso6391: iso6391 ?? this.iso6391,
  name: name ?? this.name,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['english_name'] = englishName;
    map['iso_639_1'] = iso6391;
    map['name'] = name;
    return map;
  }

}