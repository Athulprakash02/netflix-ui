class DownloadsModel {
  int? page;
  List<DownloadsMovieList>? results;
  int? totalPages;
  int? totalResults;

  DownloadsModel({this.page, this.results, this.totalPages, this.totalResults});

  DownloadsModel.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      results = <DownloadsMovieList>[];
      json['results'].forEach((v) {
        results!.add(new DownloadsMovieList.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }
}

class DownloadsMovieList {
  String? title;
  String? posterPath;

  DownloadsMovieList({
    this.title,
    this.posterPath,
  });

  DownloadsMovieList.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    posterPath = json['poster_path'];
  }

  static List<DownloadsMovieList> downloadFromSnapshot(List<dynamic> downloadSnapshot) {
    return downloadSnapshot
        .map((jsonData) => DownloadsMovieList.fromJson(jsonData))
        .toList();
  }
}
