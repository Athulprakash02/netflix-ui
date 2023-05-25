import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/home/widgets/custom_button.dart';
import 'package:netflix/presentation/home/widgets/number_title_card.dart';
import 'package:netflix/presentation/widgets/main_title_card.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 500,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(mainImage), fit: BoxFit.cover)),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const CustomButtonWidget(
                            icon: Icons.add, title: "My List"),
                        _playButton(),
                        const CustomButtonWidget(
                            icon: Icons.info_outline, title: "Info"),
                      ],
                    ),
                  ),
                )
              ],
            ),
            const MainTitleCard(
              title: "Released in the past year",
            ),
            kHeight,
            const MainTitleCard(
              title: "Trending Now",
            ),
            kHeight,
            const NumberTitleCard(),
            kHeight,
            const MainTitleCard(
              title: "Tense Dramas",
            ),
            kHeight,
            const MainTitleCard(
              title: "South Indian Cinema",
            ),
            kHeight,
          ],
        ),
      ),
    );
  }

  TextButton _playButton() {
    return TextButton.icon(
        onPressed: () {},
        style: ButtonStyle(
            // minimumSize: MaterialStateProperty.all(Size(50, 20)),
            backgroundColor: MaterialStateProperty.all(Colors.white)),
        icon: const Icon(
          Icons.play_arrow,
          size: 30,
          color: KBlackColor,
        ),
        label: const Padding(
          padding: EdgeInsets.only(right: 10),
          child: Text(
            'Play',
            style: TextStyle(
                fontSize: 20, color: KBlackColor, fontWeight: FontWeight.bold),
          ),
        ));
  }
}
