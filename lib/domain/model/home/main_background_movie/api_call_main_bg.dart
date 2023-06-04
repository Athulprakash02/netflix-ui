
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:netflix/domain/model/home/main_background_movie/main_bg_movie.dart';



import 'package:netflix/infrastructure/api_key.dart';

class TMDBServiceMainBGMovie{
  static Future<List<MainBackgroundMovie>> getMainBGMovie() async{
    const url = 'https://api.themoviedb.org/3/movie/now_playing?api_key=$apiKey';

    final response = await http.get(Uri.parse(url));
    List resultsList = [];
    if(response.statusCode == 200){
      final jsonData = jsonDecode(response.body);
      // print(jsonData);
      final List<dynamic> results = jsonData['results'];

      for(var item in results){
        resultsList.add(item);
      }
    }
    return MainBackgroundMovie.MainBGMovieFromSnapshot(resultsList);
  }
}

