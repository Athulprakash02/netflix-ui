import 'package:flutter/material.dart';
import 'package:netflix/presentation/downloads/screen_downloads.dart';
import 'package:netflix/presentation/home/screen_home.dart';
import 'package:netflix/presentation/main_page/widgets/bottom_nav.dart';
import 'package:netflix/presentation/new_and_hot/screen_new_and_hot.dart';
import 'package:netflix/presentation/search/screen_search.dart';

class MainScreen extends StatelessWidget {
   MainScreen({super.key});

  final _pages = [
    ScreenHome(),
    ScreenNewAndHot(),
    
    ScreenSearch(),
    ScreenDownloads(),

  ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      
      body: SafeArea(
        child: ValueListenableBuilder(valueListenable: indexChangeNotifier, builder: (context, index, _) {
          return _pages[index];
        },),
      ),
      bottomNavigationBar: BottomNavigationWidget(),
    );
  }
}
