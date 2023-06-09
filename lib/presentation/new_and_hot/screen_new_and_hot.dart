import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/domain/model/newandhot/coming_soon/api_call.dart';
import 'package:netflix/domain/model/newandhot/coming_soon/comingsoon.dart';
import 'package:netflix/domain/model/newandhot/everyonewatching/api_call.dart';
import 'package:netflix/domain/model/newandhot/everyonewatching/everyone_watching.dart';
import 'package:netflix/presentation/new_and_hot/widgets/comming_soon_widget.dart';
import 'package:netflix/presentation/new_and_hot/widgets/everynes_watching_widget.dart';

const newAndHotTemplateImage =
    "https://www.themoviedb.org/t/p/w355_and_h200_multi_faces/r7zUXadc1saFFSWz8lbUx7q9bkG.jpg";
const movieTitleImage =
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSv_04UVGA5GxM88FkFV8uN_jl_KoWACKtXR8ZmvoW-hME-uQc0zB-_doLrNlWqx-nuuA&usqp=CAU";

class ScreenNewAndHot extends StatefulWidget {
  const ScreenNewAndHot({super.key});

  @override
  State<ScreenNewAndHot> createState() => _ScreenNewAndHotState();
}

class _ScreenNewAndHotState extends State<ScreenNewAndHot> {
  List<ComingSoonList> comingSoonMovies = [];
  List<EveryonesWatching> everyoneWatchingList = [];

  @override
  void initState() {
    // TODO: implement initState
    _fetchComingSoon();
    _fetchEveryoneWatching();
    super.initState();
  }

  _fetchComingSoon() async {
    comingSoonMovies = await TMDBServiceComingSoon.getComingSoon();
    setState(() {});
  }

  _fetchEveryoneWatching() async {
    everyoneWatchingList = await TMDBServiceEveryoneWatching.getEveryonesWatching();
    setState(() {
      
    });

  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: AppBar(
            title: const Text(
              'New & Hot',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
            ),
            actions: [
              const Icon(
                Icons.cast,
                color: Colors.white,
                size: 30,
              ),
              kWidth,
              Container(
                width: 30,
                // height: 1,
                color: Colors.blue,
              ),
              kWidth,
            ],
            bottom: TabBar(
                isScrollable: true,
                labelColor: KBlackColor,
                unselectedLabelColor: KWhiteColor,
                labelStyle:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                indicator: BoxDecoration(
                  color: KWhiteColor,
                  borderRadius: kRadius30,
                ),
                tabs: const [
                  Tab(
                    text: "🍿 Comming Soon",
                  ),
                  Tab(
                    text: "👀 Everyone's Watching",
                  )
                ]),
          ),
        ),
        body: TabBarView(children: [
          _buildCommingSoon(context),
          _buildEveryonesWatching(),
        ]),
      ),
    );
  }

  _buildTAbBarView(String name) {
    return Center(
      child: Text(name),
    );
  }

  Widget _buildEveryonesWatching() {
    return ListView.builder(
      itemBuilder: (context, index) =>  EveryonesWatchingWidget(movies: everyoneWatchingList, index: index),
      itemCount: everyoneWatchingList.length,
    );
  }

  Widget _buildCommingSoon(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) =>
            CommingSoonWidget(movies: comingSoonMovies, index: index),
        itemCount: comingSoonMovies.length,
      ),
    );
  }
}
