import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/home/widgets/top_ten_card.dart';
import 'package:netflix/presentation/widgets/main_title.dart';
import 'package:netflix/presentation/widgets/main_title_card.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              MainTitleCard(
                title: "Released in the past year",
              ),
              kHeight,
              MainTitleCard(
                title: "Trending Now",
              ),
              kHeight,
              Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         MainTitle(
          title: "Top 10 TV shows in India Today",
        ),
        kHeight,
        LimitedBox(
          maxHeight: 180,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => NumberCard(index: index),
              separatorBuilder: (context, index) => kWidth,
              itemCount: 10),
        ),
      ],
    ),
              MainTitleCard(
                title: "Tense Dramas",
              ),
              kHeight,
              MainTitleCard(
                title: "South Indian Cinema",
              ),
              kHeight,
            ],
          ),
        ),
      ),
    );
  }
}
