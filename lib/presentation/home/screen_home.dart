import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/domain/model/home/popular_movies/api_call_popular.dart';
import 'package:netflix/domain/model/home/popular_movies/popular_list.dart';
import 'package:netflix/domain/model/home/trending_movies/api_call_trending.dart';
import 'package:netflix/domain/model/home/trending_movies/trending_list.dart';
import 'package:netflix/presentation/home/widgets/background_card_widget.dart';
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
  List tvShows = [];
  List movies = [];

  @override
  void initState() {
    // TODO: implement initState

    _getPopular();
    _getTrending();
    super.initState();
  }

  _getPopular() async {
    // trendingMoviesList = await TMDBServiceTrending.getTrendingMovies();
    popularMoviesList = await TMDBServicePopular.getPopularMovies();
  }

  _getTrending() async{
     trendingMoviesList = await TMDBServiceTrending.getTrendingMovies();
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
                  const BackgroundCard(),
                  MainTitleCard(
                      title: "Trending Movies", movieList: popularMoviesList),
                  kHeight,
                   MainTitleCard(title: "Top Rated Movies", movieList: trendingMoviesList),
                  kHeight,
                  //  NumberTitleCard(movieList: tvShows),
                  // kHeight,
                  //  MainTitleCard(
                  //   title: "Movies you watch", movieList: movies,
                  // ),
                  // kHeight,
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
