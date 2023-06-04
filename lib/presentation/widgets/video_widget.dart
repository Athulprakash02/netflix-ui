import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
// import 'package:netflix/presentation/new_and_hot/screen_new_and_hot.dart';

class VideoWidget extends StatelessWidget {
  const VideoWidget({
    super.key, required this.posterPath,
  });
  final String posterPath;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: 200,
          child: Image.network(
           'https://image.tmdb.org/t/p/w500'+ posterPath,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          right: 5,
          bottom: 5,
          child: CircleAvatar(
            radius: 23,
            backgroundColor: Colors.black.withOpacity(0.5),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.volume_off_outlined,
                color: KWhiteColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}