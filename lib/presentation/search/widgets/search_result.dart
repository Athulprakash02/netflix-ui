import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/search/widgets/title.dart';

const imageUrl =
    "https://www.themoviedb.org/t/p/w220_and_h330_face/dP5Fb6YRfzmCQtRbHOr2kO7tJW9.jpg";

// ignore: must_be_immutable
class SearchResultWidget extends StatefulWidget {
  List results = [];
  SearchResultWidget({
    super.key,
    required this.results,
  });

  @override
  State<SearchResultWidget> createState() => _SearchResultWidgetState();
}

class _SearchResultWidgetState extends State<SearchResultWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const searchTextTitle(title: "Movies & Tv"),
        kHeight,
        Expanded(
          child: GridView.count(
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            shrinkWrap: true,
            crossAxisCount: 3,
            childAspectRatio: 1 / 1.4,
            children: List.generate(
             widget.results.length,
              (index) {
                return widget.results[index].posterPath == null ? const Center(child: CircularProgressIndicator()): MainCard(posterPath: widget.results[index].posterPath);
              },
            ),
          ),
        ),
      ],
    );
  }
}

class MainCard extends StatelessWidget {
  final posterPath;
  const MainCard({
    super.key,
    required this.posterPath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        image: DecorationImage(
          image: NetworkImage(
            'https://www.themoviedb.org/t/p/w500' + posterPath,
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
