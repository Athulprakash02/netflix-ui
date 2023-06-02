import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';

class MainCardWidget extends StatefulWidget {
  final String posterPath;
  const MainCardWidget({
    super.key,
    required this.posterPath,
  });

  @override
  State<MainCardWidget> createState() => _MainCardWidgetState();
}

class _MainCardWidgetState extends State<MainCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 180,
      decoration: BoxDecoration(
          borderRadius: kRadius10,
          image:
               DecorationImage(image: NetworkImage('https://www.themoviedb.org/t/p/w500'+widget.posterPath), fit: BoxFit.cover)),
    );
  }
}
