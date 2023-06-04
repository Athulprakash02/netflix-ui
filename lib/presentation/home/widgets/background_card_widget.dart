import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/presentation/home/widgets/custom_button.dart';

class BackgroundCard extends StatelessWidget {
  final mainImage;
  const BackgroundCard({super.key, this.mainImage});

  @override
  Widget build(BuildContext context) {
    return Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Container(
                  width: double.infinity,
                  height: 500,
                  decoration:  BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage('https://www.themoviedb.org/t/p/w500'+ mainImage), fit: BoxFit.cover)),
                ),
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