import 'dart:convert';

import 'package:netflix/domain/model/home/top10_tvshows/top_rated_list.dart';
import 'package:http/http.dart' as http;
import 'package:netflix/infrastructure/api_key.dart';

class TMDBServiceTopRated{
  static Future<List<TopRatedList>> getTopRatedMovies() async{
    const url = 'https://api.themoviedb.org/3/tv/top_rated?api_key=$apiKey';

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
    return TopRatedList.TopRatedFromSnapshot(resultsList);
  }
}