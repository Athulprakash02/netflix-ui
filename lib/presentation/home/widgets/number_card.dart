import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/widgets/sized_box_widget.dart';

class NumberCard extends StatelessWidget {
  const NumberCard({super.key, required this.index, this.posterPath});
  final int index;
  final posterPath;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            szdBox(180, 40),
            Container(
              width: 130,
              height: 180,
              decoration: BoxDecoration(
                  borderRadius: kRadius10,
                  image:  DecorationImage(
                      image: NetworkImage(
                          'https://www.themoviedb.org/t/p/w500' + posterPath),
                      fit: BoxFit.cover)),
            ),
          ],
        ),
        Positioned(
          bottom: -20,
          left: 4,
          child: BorderedText(
            strokeWidth: 8.0,
            strokeColor: Colors.white,
            child: Text(
              "${index + 1}",
              style: TextStyle(
                fontSize: 120,
                fontWeight: FontWeight.bold,
                color: KBlackColor,
                decoration: TextDecoration.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
