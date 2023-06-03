class TrendingModel {
  int? page;
  List<TrendingList>? results;
  int? totalPages;
  int? totalResults;

  TrendingModel({this.page, this.results, this.totalPages, this.totalResults});

  TrendingModel.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      results = <TrendingList>[];
      json['results'].forEach((v) {
        results!.add(new TrendingList.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }
}

class TrendingList {
  bool? adult;
  String? backdropPath;
  int? id;
  String? title;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  String? posterPath;
  String? mediaType;
  List<int>? genreIds;
  double? popularity;
  String? releaseDate;
  bool? video;
  double? voteAverage;
  int? voteCount;
  String? name;
  String? originalName;
  String? firstAirDate;
  // List<String>? originCountry;

  TrendingList({
    this.adult,
    this.backdropPath,
    this.id,
    this.title,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.posterPath,
    this.mediaType,
    this.genreIds,
    this.popularity,
    this.releaseDate,
    this.video,
    this.voteAverage,
    this.voteCount,
    this.name,
    this.originalName,
    this.firstAirDate,
    // this.originCountry,
  });

  TrendingList.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    id = json['id'];
    title = json['title'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    posterPath = json['poster_path'];
    mediaType = json['media_type'];
    genreIds = json['genre_ids'].cast<int>();
    popularity = json['popularity'];
    releaseDate = json['release_date'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
    name = json['name'];
    originalName = json['original_name'];
    firstAirDate = json['first_air_date'];
    // originCountry = json['origin_country'].cast<String>();
  }

  static List<TrendingList> trendingFromSnapshot(
      List<dynamic> trendingSnapshot) {
    return trendingSnapshot
        .map((jsonData) => TrendingList.fromJson(jsonData))
        .toList();
  }
}
