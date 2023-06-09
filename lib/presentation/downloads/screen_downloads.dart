import 'dart:math';

import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/domain/model/downloads/api_call_download.dart';
import 'package:netflix/domain/model/downloads/dowloads_list.dart';

import 'package:netflix/presentation/widgets/app_bar_widget.dart';
import 'package:netflix/presentation/widgets/sized_box_widget.dart';



class ScreenDownloads extends StatefulWidget {
  const ScreenDownloads({super.key});

  @override
  State<ScreenDownloads> createState() => _ScreenDownloadsState();
}

// late APIResponse<List<DemoList>> _apiResponse;
class _ScreenDownloadsState extends State<ScreenDownloads> {
  // TMDBServiceDownloads get service => GetIt.I<TMDBServiceDownloads>();
  List<DownloadsMovieList> movieList = [];
  @override
  void initState() {
    // TODO: implement initState
    getMovies();
    super.initState();
  }

  getMovies() async {
    movieList = await TMDBServiceDownloads.getDownloadMovies();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // final Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: AppBarWidget(title: 'Downloads')),
        body: movieList.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : ListView(
                children: [
                  const _smartDownloads(),
                  Section2(movies: movieList),
                  const Section3(),
                ],
              ));
  }
}

// ignore: must_be_immutable
class Section2 extends StatelessWidget {
  Section2({
    super.key,
    required this.movies,
  });
  List movies;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        const Text(
          'Introducing Downloads for you',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: KWhiteColor, fontSize: 22, fontWeight: FontWeight.w900),
        ),
        szdBox(20, 0),
        const Text(
          "We'll download a personalised selection of\nmovies and shows for you, so there's\nalways something to watch on your\ndevice",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          width: size.width,
          height: size.width,
          // color: Colors.white,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Center(
                child: CircleAvatar(
                  backgroundColor: Colors.grey.withOpacity(0.3),
                  radius: size.width * 0.35,
                ),
              ),
              downloadsImageWidget(
                imageList: movies[0].posterPath!,
                margin: const EdgeInsets.only(left: 140, bottom: 35),
                angle: 15,
                size: Size(size.width * 0.37, size.width * 0.5),
              ),
              downloadsImageWidget(
                  imageList: movies[1].posterPath!,
                  margin: const EdgeInsets.only(right: 140, bottom: 35),
                  angle: -15,
                  size: Size(size.width * 0.37, size.width * 0.5)),
              downloadsImageWidget(
                  imageList: movies[2].posterPath!,
                  margin: const EdgeInsets.only(left: 0),
                  size: Size(size.width * 0.4, size.width * 0.58)),
            ],
          ),
        ),
      ],
    );
  }
}

class Section3 extends StatelessWidget {
  const Section3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.maxFinite,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: MaterialButton(
              color: KButtonColorBlue,
              onPressed: () {},
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'Set up',
                  style: TextStyle(
                      fontSize: 20,
                      color: KWhiteColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ),
        szdBox(12, 0),
        MaterialButton(
          color: KButtonColorWhite,
          onPressed: () {},
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'See what you can download',
              style: TextStyle(
                  fontSize: 18,
                  color: KBlackColor,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}

class _smartDownloads extends StatelessWidget {
  const _smartDownloads({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        children: [
          kWidth,
          Icon(
            Icons.settings,
            size: 30,
            color: KWhiteColor,
          ),
          kWidth,
          Text(
            'Smart Downloads',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class downloadsImageWidget extends StatelessWidget {
  const downloadsImageWidget(
      {super.key,
      this.angle = 0,
      required this.imageList,
      required this.margin,
      required this.size});

  final String imageList;
  final double angle;
  final EdgeInsets margin;
  final Size size;

  @override
  Widget build(BuildContext context) {
    // final Size size = MediaQuery.of(context).size;
    return Transform.rotate(
      angle: angle * pi / 180,
      child: Container(
        margin: margin,
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          color: KBlackColor,
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
              image:
                  NetworkImage('https://image.tmdb.org/t/p/w500' + imageList),
              fit: BoxFit.cover),
        ),
      ),
    );
  }
}
