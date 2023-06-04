import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/widgets/main_card.dart';
import 'package:netflix/presentation/widgets/main_title.dart';

class MainTitleCard extends StatelessWidget {
  final String title;
  final List movieList;
  const MainTitleCard({
    super.key, required this.title, required this.movieList,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         MainTitle(
          title: title,
        ),
        kHeight,
        LimitedBox(
          maxHeight: 180,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) =>  MainCardWidget(posterPath: movieList[index].posterPath),
              separatorBuilder: (context, index) => kWidth,
              itemCount: movieList.length),
        ),
      ],
    );
  }
}