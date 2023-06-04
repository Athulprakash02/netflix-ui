import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/home/widgets/custom_button.dart';
import 'package:netflix/presentation/widgets/sized_box_widget.dart';
import 'package:netflix/presentation/widgets/video_widget.dart';

class EveryonesWatchingWidget extends StatelessWidget {

   EveryonesWatchingWidget({
    super.key,
    required this.movies,
    required this.index
  });

  List movies;
  int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          kHeight,
           Text(
            movies[index].title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          kHeight,
           SizedBox(
            child: Text(
              movies[index].overview,
              style: const TextStyle(color: KGreyColor),
            ),
          ),
          szdBox(50, 0),
           VideoWidget(posterPath: movies[index].backdropPath),
          kHeight,
          const Row(
            children: [
              // Image.network(
              //   movieTitleImage,
              //   height: 50,
              // ),
              Spacer(),
              CustomButtonWidget(
                icon: Icons.send,
                title: "Share",
                iconSize: 20,
                textSize: 12,
              ),
              kWidth,
              CustomButtonWidget(
                icon: Icons.add,
                title: "My List",
                iconSize: 20,
                textSize: 12,
              ),
              kWidth,
              CustomButtonWidget(
                icon: Icons.play_arrow,
                title: "Play",
                iconSize: 20,
                textSize: 12,
              ),
              kWidth,
            ],
          )
        ],
      ),
    );
  }
}