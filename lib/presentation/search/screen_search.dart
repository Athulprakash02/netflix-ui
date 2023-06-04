import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/presentation/search/widgets/search_idle.dart';
import 'package:netflix/presentation/search/widgets/search_result.dart';
import 'package:netflix/presentation/widgets/sized_box_widget.dart';

class ScreenSearch extends StatefulWidget {
  const ScreenSearch({super.key});

  @override
  State<ScreenSearch> createState() => _ScreenSearchState();
}

class _ScreenSearchState extends State<ScreenSearch> {
  TextEditingController _searchController = TextEditingController();
  bool _isSearchIdle = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _searchController.addListener(_onSearchTextChanged);
  }


  @override
  void dispose() {
    // TODO: implement dispose
    _searchController.removeListener(_onSearchTextChanged);
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchTextChanged() {
    setState(() {
      _isSearchIdle = _searchController.text.isEmpty;
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
                // suffixIcon: _isSearchIdle
                //     ?  Icon(
                //         Icons.clear,
                //         color: Colors.grey,
                //       )
                //     : GestureDetector(
                //         onTap: () {
                //           _searchController.clear();
                //         },
                //         child: const Icon(
                //          Icons.clear,
                //           color: Colors.grey,
                //         ),
                //       ),
                style: const TextStyle(color: Colors.white),
              ),
            szdBox(10, 0),
           
             Expanded(child:_isSearchIdle ? const SearchIdleWidget() : SearchResultWidget()),
            // const Expanded(child: SearchResultWidget()),
          ],
        ),
      )),
    );
  }
}
