// import 'package:freezed_annotation/freezed_annotation.dart';
// part 'downloads.freezed.dart';
// part 'downloads.g.dart';
// @freezed
// class Downloads with _$Downloads{
//   const factory Downloads({
//    @JsonKey(name: "poster_path") required String? posterPath,
//   }) = _Downloads;

//   factory Downloads.fromJson(Map<String, dynamic> json) => _$DownloadsFromJson(json);
// }

import 'dart:convert';

import 'package:netflix/core/colors/strings.dart';
import 'package:netflix/infrastructure/api_key.dart';
import 'package:http/http.dart' as http;

class TMDBService {
  Future<Map<String, dynamic>> getPopularMovies() async {
    final url = Uri.https('$KBaseUrl', '/movie/popular', {
      'api_key': apiKey,
    });
    final response = await http.get(url);

    if(response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return jsonData;
    }else{
      throw Exception('Failed to load popular movies');
    }
  }
}
