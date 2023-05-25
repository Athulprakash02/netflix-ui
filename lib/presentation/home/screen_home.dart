import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/widgets/main_title_card.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
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
