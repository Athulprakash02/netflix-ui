import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/home/widgets/custom_button.dart';
import 'package:netflix/presentation/new_and_hot/screen_new_and_hot.dart';
import 'package:netflix/presentation/widgets/video_widget.dart';

class CommingSoonWidget extends StatelessWidget {
  CommingSoonWidget({
    super.key,
    required this.movies,
    required this.index,
  });
  List movies;
  int index;

  @override
  Widget build(BuildContext context) {
    String formattedMonth =
        DateFormat.MMM().format(DateTime.parse(movies[index].releaseDate));
    String formattedDay =
        DateFormat.d().format(DateTime.parse(movies[index].releaseDate));
    Size size = MediaQuery.of(context).size;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 50,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                formattedMonth,
                style: const TextStyle(fontSize: 17),
              ),
              Text(
                formattedDay,
                style: const TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: KWhiteColor),
              )
            ],
          ),
        ),
        SizedBox(
          width: size.width - 50,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VideoWidget(posterPath: movies[index].backdropPath),
              kHeight,
              Row(
                children: [
                  SizedBox(
                      height: 50,
                      width: size.width / 2,
                      child: Text(
                        movies[index].title,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                  const Spacer(),
                  const Row(
                    children: [
                      CustomButtonWidget(
                        icon: Icons.notifications_none_outlined,
                        title: "Remind Me",
                        iconSize: 20,
                        textSize: 12,
                      ),
                      kWidth,
                      CustomButtonWidget(
                        icon: Icons.info_outline,
                        title: "Info",
                        iconSize: 20,
                        textSize: 12,
                      ),
                      kWidth,
                      kWidth,
                    ],
                  ),
                ],
              ),
              // kHeight,
              // const Text(
              //   "Comming on Friday",
              //   style: TextStyle(
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
              // kHeight,
              //  Text(
              //   movies[index].title,
              //   style: TextStyle(
              //     fontSize: 20,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
              kHeight,
              SizedBox(
                width: size.width - 50,
                child: Text(
                  movies[index].overview,
                  style: const TextStyle(
                    color: KGreyColor,
                  ),
                ),
              ),
              kHeight,
            ],
          ),
        ),
      ],
    );
  }
}
