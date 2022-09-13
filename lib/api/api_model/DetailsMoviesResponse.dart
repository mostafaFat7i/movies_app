/// adult : false
/// backdrop_path : "/ugS5FVfCI3RV0ZwZtBV3HAV75OX.jpg"
/// belongs_to_collection : {"id":620873,"name":"Dragon Ball Super Collection","poster_path":"/38fLvtJHsU9iH7NQ2YQIMZuWIm8.jpg","backdrop_path":"/hBzDzjMesdB3SoxFaSjGK3rFRVG.jpg"}
/// budget : 0
/// genres : [{"id":16,"name":"Animation"},{"id":878,"name":"Science Fiction"},{"id":28,"name":"Action"}]
/// homepage : "https://www.2022dbs-global.com"
/// id : 610150
/// imdb_id : "tt14614892"
/// original_language : "ja"
/// original_title : "ドラゴンボール超 スーパーヒーロー"
/// overview : "The Red Ribbon Army, an evil organization that was once destroyed by Goku in the past, has been reformed by a group of people who have created new and mightier Androids, Gamma 1 and Gamma 2, and seek vengeance against Goku and his family."
/// popularity : 8753.85
/// poster_path : "/rugyJdeoJm7cSJL1q4jBpTNbxyU.jpg"
/// production_companies : [{"id":2918,"logo_path":"/gyEWUBWwqrm3H5T2hkERD9LxpOq.png","name":"Shueisha","origin_country":"JP"},{"id":3341,"logo_path":"/dTG5dXE1kU2mpmL9BNnraffckLU.png","name":"Fuji Television Network","origin_country":"JP"},{"id":5542,"logo_path":"/ayE4LIqoAWotavo7xdvYngwqGML.png","name":"Toei Animation","origin_country":"JP"},{"id":5822,"logo_path":"/qyTbRgCyU9NLKvKaiQVbadtr7RY.png","name":"Toei Company","origin_country":"JP"},{"id":12502,"logo_path":"/aDcFy26DtVbyZIFOZNTLsooWH5X.png","name":"Bandai Namco Entertainment","origin_country":"JP"},{"id":24051,"logo_path":null,"name":"Bird Studios","origin_country":"JP"}]
/// production_countries : [{"iso_3166_1":"JP","name":"Japan"}]
/// release_date : "2022-06-11"
/// revenue : 70000000
/// runtime : 99
/// spoken_languages : [{"english_name":"Japanese","iso_639_1":"ja","name":"日本語"}]
/// status : "Released"
/// tagline : "A super awakening and calamity is born."
/// title : "Dragon Ball Super: Super Hero"
/// video : false
/// vote_average : 7.993
/// vote_count : 1309

class DetailsMoviesResponse {
  bool? adult;
  String? backdropPath;
  BelongsToCollection? belongsToCollection;
  num? budget;
  List<Genres>? genres;
  String? homepage;
  num? id;
  String? imdbId;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  num? popularity;
  String? posterPath;
  List<ProductionCompanies>? productionCompanies;
  List<ProductionCountries>? productionCountries;
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

  DetailsMoviesResponse(
      {this.adult,
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

  DetailsMoviesResponse.fromJson(dynamic json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    status_message = json['status_message'];
    status_code = json['status_code'];
    success = json['success'];
    belongsToCollection = json['belongs_to_collection'] != null
        ? BelongsToCollection.fromJson(json['belongs_to_collection'])
        : null;
    budget = json['budget'];
    if (json['genres'] != null) {
      genres = [];
      json['genres'].forEach((v) {
        genres?.add(Genres.fromJson(v));
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
        productionCompanies?.add(ProductionCompanies.fromJson(v));
      });
    }
    if (json['production_countries'] != null) {
      productionCountries = [];
      json['production_countries'].forEach((v) {
        productionCountries?.add(ProductionCountries.fromJson(v));
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
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['adult'] = adult;
    map['backdrop_path'] = backdropPath;
    if (belongsToCollection != null) {
      map['belongs_to_collection'] = belongsToCollection?.toJson();
    }
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
      map['production_companies'] =
          productionCompanies?.map((v) => v.toJson()).toList();
    }
    if (productionCountries != null) {
      map['production_countries'] =
          productionCountries?.map((v) => v.toJson()).toList();
    }
    map['release_date'] = releaseDate;
    map['revenue'] = revenue;
    map['runtime'] = runtime;
    if (spokenLanguages != null) {
      map['spoken_languages'] =
          spokenLanguages?.map((v) => v.toJson()).toList();
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

/// english_name : "Japanese"
/// iso_639_1 : "ja"
/// name : "日本語"

class SpokenLanguages {
  SpokenLanguages({
    this.englishName,
    this.iso6391,
    this.name,
  });

  SpokenLanguages.fromJson(dynamic json) {
    englishName = json['english_name'];
    iso6391 = json['iso_639_1'];
    name = json['name'];
  }

  String? englishName;
  String? iso6391;
  String? name;

  SpokenLanguages copyWith({
    String? englishName,
    String? iso6391,
    String? name,
  }) =>
      SpokenLanguages(
        englishName: englishName ?? this.englishName,
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

/// iso_3166_1 : "JP"
/// name : "Japan"

class ProductionCountries {
  ProductionCountries({
    this.iso31661,
    this.name,
  });

  ProductionCountries.fromJson(dynamic json) {
    iso31661 = json['iso_3166_1'];
    name = json['name'];
  }

  String? iso31661;
  String? name;

  ProductionCountries copyWith({
    String? iso31661,
    String? name,
  }) =>
      ProductionCountries(
        iso31661: iso31661 ?? this.iso31661,
        name: name ?? this.name,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['iso_3166_1'] = iso31661;
    map['name'] = name;
    return map;
  }
}

/// id : 2918
/// logo_path : "/gyEWUBWwqrm3H5T2hkERD9LxpOq.png"
/// name : "Shueisha"
/// origin_country : "JP"

class ProductionCompanies {
  ProductionCompanies({
    this.id,
    this.logoPath,
    this.name,
    this.originCountry,
  });

  ProductionCompanies.fromJson(dynamic json) {
    id = json['id'];
    logoPath = json['logo_path'];
    name = json['name'];
    originCountry = json['origin_country'];
  }

  num? id;
  String? logoPath;
  String? name;
  String? originCountry;

  ProductionCompanies copyWith({
    num? id,
    String? logoPath,
    String? name,
    String? originCountry,
  }) =>
      ProductionCompanies(
        id: id ?? this.id,
        logoPath: logoPath ?? this.logoPath,
        name: name ?? this.name,
        originCountry: originCountry ?? this.originCountry,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['logo_path'] = logoPath;
    map['name'] = name;
    map['origin_country'] = originCountry;
    return map;
  }
}

/// id : 16
/// name : "Animation"

class Genres {
  Genres({
    this.id,
    this.name,
  });

  Genres.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }

  num? id;
  String? name;

  Genres copyWith({
    num? id,
    String? name,
  }) =>
      Genres(
        id: id ?? this.id,
        name: name ?? this.name,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }
}

/// id : 620873
/// name : "Dragon Ball Super Collection"
/// poster_path : "/38fLvtJHsU9iH7NQ2YQIMZuWIm8.jpg"
/// backdrop_path : "/hBzDzjMesdB3SoxFaSjGK3rFRVG.jpg"

class BelongsToCollection {
  BelongsToCollection({
    this.id,
    this.name,
    this.posterPath,
    this.backdropPath,
  });

  BelongsToCollection.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    posterPath = json['poster_path'];
    backdropPath = json['backdrop_path'];
  }

  num? id;
  String? name;
  String? posterPath;
  String? backdropPath;

  BelongsToCollection copyWith({
    num? id,
    String? name,
    String? posterPath,
    String? backdropPath,
  }) =>
      BelongsToCollection(
        id: id ?? this.id,
        name: name ?? this.name,
        posterPath: posterPath ?? this.posterPath,
        backdropPath: backdropPath ?? this.backdropPath,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['poster_path'] = posterPath;
    map['backdrop_path'] = backdropPath;
    return map;
  }
}
