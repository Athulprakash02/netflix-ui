import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/domain/model/home/main_background_movie/api_call_main_bg.dart';
import 'package:netflix/domain/model/home/main_background_movie/main_bg_movie.dart';
import 'package:netflix/domain/model/home/popular_movies/api_call_popular.dart';
import 'package:netflix/domain/model/home/popular_movies/popular_list.dart';
import 'package:netflix/domain/model/home/top10_tvshows/api_call_top10.dart';
import 'package:netflix/domain/model/home/top10_tvshows/top_rated_list.dart';
import 'package:netflix/domain/model/home/trending_movies/api_call_trending.dart';
import 'package:netflix/domain/model/home/trending_movies/trending_list.dart';
import 'package:netflix/domain/model/home/upcoming/api_call_upcoming.dart';
import 'package:netflix/domain/model/home/upcoming/upcoming_list.dart';
import 'package:netflix/presentation/home/widgets/background_card_widget.dart';
import 'package:netflix/presentation/home/widgets/number_title_card.dart';
import 'package:netflix/presentation/widgets/main_title_card.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);
// TMDBService get service => GetIt.I<TMDBService>();

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  List<PopularList> popularMoviesList = [];
  List<TrendingList> trendingMoviesList = [];
  List<TopRatedList> top10TvShows = [];
  List<UpcomingMoviesList> upcomingMovies = [];
  List<MainBackgroundMovie> mainBGMovie = [];

  @override
  void initState() {
    // TODO: implement initState
    _getMainBGMovie();
    _getPopular();
    _getTrending();
    _getTopRated();
    _getUpcoming();

    super.initState();
  }

  _getPopular() async {
    // trendingMoviesList = await TMDBServiceTrending.getTrendingMovies();
    popularMoviesList = await TMDBServicePopular.getPopularMovies();
    setState(() {});
  }

  _getTrending() async {
    trendingMoviesList = await TMDBServiceTrending.getTrendingMovies();
    setState(() {});
  }

  _getTopRated() async {
    top10TvShows = await TMDBServiceTopRated.getTopRatedMovies();
    setState(() {});
  }

  _getUpcoming() async {
    print('entered');
    upcomingMovies = await TMDBServiceUpcoming.getUpcomingMovies();
    setState(() {});
  }

  _getMainBGMovie() async {
    print('entered');
    mainBGMovie = await TMDBServiceMainBGMovie.getMainBGMovie();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ValueListenableBuilder(
      valueListenable: scrollNotifier,
      builder: (context, index, _) {
        return NotificationListener<UserScrollNotification>(
          onNotification: (notification) {
            final ScrollDirection direction = notification.direction;
            print(direction);
            if (direction == ScrollDirection.reverse) {
              scrollNotifier.value = false;
            } else if (direction == ScrollDirection.forward) {
              scrollNotifier.value = true;
            }
            return true;
          },
          child: Stack(
            children: [
              ListView(
                children: [
                  BackgroundCard(mainImage: mainBGMovie[0].posterPath),
                  MainTitleCard(
                    title: "Popular Movies",
                    movieList: popularMoviesList,
                  ),
                  kHeight,
                  MainTitleCard(
                    title: "Trending Movies",
                    movieList: trendingMoviesList,
                  ),
                  kHeight,
                  NumberTitleCard(
                    movieList: top10TvShows,
                  ),
                  kHeight,
                  MainTitleCard(
                    title: "Upcoming Movies",
                    movieList: upcomingMovies,
                  ),
                  kHeight,
                  // // const MainTitleCard(
                  // //   title: "South Indian Cinema",
                  // // ),
                  // kHeight,
                ],
              ),
              scrollNotifier.value == true
                  ? AnimatedContainer(
                      duration: const Duration(seconds: 3),
                      width: double.infinity,
                      height: 90,
                      color: Colors.black.withOpacity(0.1),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Image.network(
                                "https://www.freepnglogos.com/uploads/netflix-logo-circle-png-5.png",
                                width: 60,
                                height: 60,
                              ),
                              const Spacer(),
                              const Icon(
                                Icons.cast,
                                color: Colors.white,
                                size: 30,
                              ),
                              kWidth,
                              Container(
                                color: Colors.blue,
                                height: 30,
                                width: 30,
                              ),
                              kWidth,
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'Tv Shows',
                                style: KHomeTitleText,
                              ),
                              Text(
                                "Movies",
                                style: KHomeTitleText,
                              ),
                              Text(
                                "Categories",
                                style: KHomeTitleText,
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  : kHeight,
            ],
          ),
        );
      },
    ));
  }
}
