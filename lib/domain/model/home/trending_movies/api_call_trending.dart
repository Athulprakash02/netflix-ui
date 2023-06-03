import 'dart:convert';

import 'package:netflix/domain/model/home/trending_movies/trending_list.dart';
import 'package:http/http.dart' as http;
import 'package:netflix/infrastructure/api_key.dart';

class TMDBServiceTrending{
  static Future<List<TrendingList>> getTrendingMovies() async{
    const url = 'https://api.themoviedb.org/3/trending/all/day?api_key=$apiKey';

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
    return TrendingList.trendingFromSnapshot(resultsList);
  }
}