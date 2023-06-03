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
import 'package:netflix/domain/model/downloads/api_response.dart';
import 'package:netflix/domain/model/downloads/demo_list_downloads.dart';
import 'package:netflix/infrastructure/api_key.dart';
import 'package:http/http.dart' as http;
import 'package:netflix/presentation/downloads/screen_downloads.dart';

final url = Uri.https('$KBaseUrl', '/movie/popular', {
  'api_key': apiKey,
});

class TMDBServiceDownloads {
  Future<APIResponse<List<DemoList>>> getDemo() {
    return http.get(url).then((value) {
      if (value.statusCode == 200) {
        final jsonData = json.decode(value.body);
        final movies = <DemoList>[];
        for (var item in jsonData) {
          final movie = DemoList(
            title: item['title'],
            posterPath: item['poster_path'],
          );
          imageList.add(movie);
        }
        return APIResponse<List<DemoList>>(
          data: movies,
        );
      }
      return APIResponse<List<DemoList>>(
        data: [],
        error: true,
        errorMessage: 'An error occured',
      );
    })
    .catchError((_)=> APIResponse<List<DemoList>>(
        data: [],
        error: true,
        errorMessage: 'An error occured',
      ));
  }
}
