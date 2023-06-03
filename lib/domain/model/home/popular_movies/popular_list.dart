class PopularModel {
  int? page;
  List<PopularList>? results;
  int? totalPages;
  int? totalResults;

  PopularModel({this.page, this.results, this.totalPages, this.totalResults});

  PopularModel.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      results = <PopularList>[];
      json['results'].forEach((v) {
        results!.add(new PopularList.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }
}

class PopularList {
  String? title;
  String? posterPath;

  PopularList({
    this.title,
    this.posterPath,
  });

  PopularList.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    posterPath = json['poster_path'];
  }

  static List<PopularList> popularFromSnapshot(List<dynamic> popularSnapshot) {
    return popularSnapshot
        .map((jsonData) => PopularList.fromJson(jsonData))
        .toList();
  }
}
