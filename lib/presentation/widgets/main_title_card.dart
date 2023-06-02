import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/widgets/main_card.dart';
import 'package:netflix/presentation/widgets/main_title.dart';

class MainTitleCard extends StatelessWidget {
  final String title;
  final List trending;
  const MainTitleCard({
    super.key, required this.title, required this.trending,
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
              itemBuilder: (context, index) =>  MainCardWidget(posterPath: trending[index]['poster_path']),
              separatorBuilder: (context, index) => kWidth,
              itemCount: 10),
        ),
      ],
    );
  }
}