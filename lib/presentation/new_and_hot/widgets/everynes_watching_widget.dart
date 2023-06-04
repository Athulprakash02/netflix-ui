import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/home/widgets/custom_button.dart';
import 'package:netflix/presentation/new_and_hot/screen_new_and_hot.dart';
import 'package:netflix/presentation/widgets/sized_box_widget.dart';
import 'package:netflix/presentation/widgets/video_widget.dart';

class EveryonesWatchingWidget extends StatelessWidget {
  const EveryonesWatchingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          kHeight,
          const Text(
            "Friends",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          kHeight,
          const SizedBox(
            child: Text(
              "This hit sitcom follows the merry misadventures of six 20-something pals as they navigate the pitfalls of work, life and love in 1990's Manhattan.",
              style: TextStyle(color: KGreyColor),
            ),
          ),
          szdBox(50, 0),
          // const VideoWidget(),
          kHeight,
          Row(
            children: [
              Image.network(
                movieTitleImage,
                height: 50,
              ),
              const Spacer(),
              const CustomButtonWidget(
                icon: Icons.send,
                title: "Share",
                iconSize: 20,
                textSize: 12,
              ),
              kWidth,
              const CustomButtonWidget(
                icon: Icons.add,
                title: "My List",
                iconSize: 20,
                textSize: 12,
              ),
              kWidth,
              const CustomButtonWidget(
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