import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/home/widgets/number_card.dart';
import 'package:netflix/presentation/widgets/main_title.dart';

class NumberTitleCard extends StatelessWidget {
  final List movieList;
  const NumberTitleCard({
    super.key, required this.movieList,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MainTitle(
          title: "Top 10 TV shows in India Today",
        ),
        kHeight,
        LimitedBox(
          maxHeight: 180,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) =>
                  NumberCard(index: index,posterPath: movieList[index].posterPath),
              separatorBuilder: (context, index) => kWidth,
              itemCount: 10),
        ),
      ],
    );
  }
}