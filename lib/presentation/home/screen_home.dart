import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/infrastructure/api_key.dart';
import 'package:netflix/presentation/home/widgets/background_card_widget.dart';
import 'package:netflix/presentation/home/widgets/custom_button.dart';
import 'package:netflix/presentation/home/widgets/number_title_card.dart';
import 'package:netflix/presentation/widgets/main_title_card.dart';
import 'package:tmdb_api/tmdb_api.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  @override
  void initState() {
    // TODO: implement initState
    loadMovies();
    super.initState();
  }
  List trendingMovies = [];
  List topRatedMovies = [];
  List tvShows = [];

  

  loadMovies() async{
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apiKey, readAccessToken),logConfig: ConfigLogger(
      showLogs: true,
      showErrorLogs: true
    ));
    Map trendingResult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topRatedResult= await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvShowsResults = await tmdbWithCustomLogs.v3.tv.getPopular();
    
    setState(() {
      
      trendingMovies = trendingResult['results'];
      topRatedMovies = topRatedResult['results'];
      tvShows = tvShowsResults['results'];
    });
    print(trendingMovies);
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
                   MainTitleCard(title:  "Trending Movies", trending: trendingMovies),
                  kHeight,
                  // const MainTitleCard(
                  //   title: "Trending Now",
                  // ),
                  // kHeight,
                  // const NumberTitleCard(),
                  // kHeight,
                  // const MainTitleCard(
                  //   title: "Tense Dramas",
                  // ),
                  // kHeight,
                  // const MainTitleCard(
                  //   title: "South Indian Cinema",
                  // ),
                  kHeight,
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
                              Text("Movies",style: KHomeTitleText,),
                              Text("Categories",style: KHomeTitleText,)
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
