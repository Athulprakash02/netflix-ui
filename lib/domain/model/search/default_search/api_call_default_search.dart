import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:netflix/domain/model/search/default_search/default_search.dart';
import 'package:netflix/infrastructure/api_key.dart';

class TMDBServiceTopSearch{
  static Future<List<TopSearchedList>> getTopSearch() async{
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
    return TopSearchedList.topSearchFromSnapshot(resultsList);
  }
}