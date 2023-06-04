import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/domain/model/search/default_search/api_call_default_search.dart';
import 'package:netflix/domain/model/search/default_search/default_search.dart';
import 'package:netflix/domain/model/search/searched_screen/api_call_search.dart';
import 'package:netflix/domain/model/search/searched_screen/search_results.dart';
import 'package:netflix/presentation/search/widgets/search_idle.dart';
import 'package:netflix/presentation/search/widgets/search_result.dart';
import 'package:netflix/presentation/widgets/sized_box_widget.dart';

class ScreenSearch extends StatefulWidget {
  const ScreenSearch({super.key});

  @override
  State<ScreenSearch> createState() => _ScreenSearchState();
}

class _ScreenSearchState extends State<ScreenSearch> {
  List<TopSearchedList> topSearches = [];
  List<SearchModelList> searchResults = [];
  TextEditingController _searchController = TextEditingController();
  bool _isSearchIdle = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getTopSearch();
    _getSearchResults();
    _searchController.addListener(_onSearchTextChanged);
  }

  _getTopSearch() async{
    topSearches = await TMDBServiceTopSearch.getTopSearch();
    setState(() {
      
    });
  }

  _getSearchResults() async {
    searchResults =
        await TMDBServiceSearch.getSearchResults(_searchController.text.trim());
    setState(() {});
  }

  void _onSearchTextChanged() {
    _getSearchResults();
    setState(() {
      _isSearchIdle = _searchController.text.isEmpty;
      print(_isSearchIdle);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CupertinoSearchTextField(
              controller: _searchController,
              backgroundColor: Colors.grey.withOpacity(0.3),
              prefixIcon: const Icon(
                CupertinoIcons.search,
                color: Colors.grey,
              ),
              suffixIcon: Icon(
                Icons.clear,
                color: Colors.grey,
              ),
              style: const TextStyle(color: Colors.white),
            ),
            szdBox(10, 0),

            Expanded(
                child: _isSearchIdle
                    ?  SearchIdleWidget(results: topSearches)
                    : SearchResultWidget(results: searchResults)),
            // const Expanded(child: SearchResultWidget()),
          ],
        ),
      )),
    );
  }
}
