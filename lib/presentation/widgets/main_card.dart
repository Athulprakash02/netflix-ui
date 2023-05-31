import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';

class MainCardWidget extends StatelessWidget {
  const MainCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 180,
      decoration:  BoxDecoration(
        borderRadius: kRadius10,
          image: const DecorationImage(
              image: NetworkImage(
                  'https://www.themoviedb.org/t/p/w220_and_h330_face/7MUQMSncjUSYeNx0ZAgFCxhlPhv.jpg'),fit: BoxFit.cover)),
    );
  }
}