class MainBackgroundModel {
  Dates? dates;
  int? page;
  List<MainBackgroundMovie>? results;
  int? totalPages;
  int? totalResults;

  MainBackgroundModel(
      {this.dates,
      this.page,
      this.results,
      this.totalPages,
      this.totalResults});

  MainBackgroundModel.fromJson(Map<String, dynamic> json) {
    dates = json['dates'] != null ? new Dates.fromJson(json['dates']) : null;
    page = json['page'];
    if (json['results'] != null) {
      results = <MainBackgroundMovie>[];
      json['results'].forEach((v) {
        results!.add(new MainBackgroundMovie.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }
}

class Dates {
  String? maximum;
  String? minimum;

  Dates({this.maximum, this.minimum});

  Dates.fromJson(Map<String, dynamic> json) {
    maximum = json['maximum'];
    minimum = json['minimum'];
  }
}

class MainBackgroundMovie {
  bool? adult;
  String? backdropPath;
  List<int>? genreIds;
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  String? releaseDate;
  String? title;
  // bool? video;
  // double? voteAverage;
  // int? voteCount;

  MainBackgroundMovie({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    // this.video,
    // this.voteAverage,
    // this.voteCount,
  });

  MainBackgroundMovie.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    genreIds = json['genre_ids'].cast<int>();
    id = json['id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    title = json['title'];
    // video = json['video'];
    // voteAverage = json['vote_average'];
    // voteCount = json['vote_count'];
  }

  static List<MainBackgroundMovie> MainBGMovieFromSnapshot(
      List<dynamic> mainBGMovieSnapshot) {
    return mainBGMovieSnapshot
        .map((jsonData) => MainBackgroundMovie.fromJson(jsonData))
        .toList();
  }
}
