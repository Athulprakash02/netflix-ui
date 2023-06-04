import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:netflix/domain/model/search/searched_screen/search_results.dart';
import 'package:netflix/infrastructure/api_key.dart';

class TMDBServiceSearch{
  static Future<List<SearchModelList>> getSearchResults(String searchQuerry) async{
    final url = 'https://api.themoviedb.org/3/search/movie?query=$searchQuerry&api_key=$apiKey';

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
    return SearchModelList.searchResultsFromSnapshot(resultsList);
  }
}