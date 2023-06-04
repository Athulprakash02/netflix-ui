import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/search/widgets/title.dart';
import 'package:netflix/presentation/widgets/sized_box_widget.dart';

const imageUrl =
    'https://www.themoviedb.org/t/p/w355_and_h200_multi_faces/m8JTwHFwX7I7JY5fPe4SjqejWag.jpg';

class SearchIdleWidget extends StatelessWidget {
 final List results;
  const SearchIdleWidget({super.key, required this.results});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         const searchTextTitle(title: "Top Searches"),
        kHeight,
        Expanded(
          child: results.isEmpty ? const Center(child: CircularProgressIndicator()) : ListView.separated(
              shrinkWrap: true,
              itemBuilder: (ctx, index) =>  TopSearchItemTile(image: results[index].backdropPath,title: results[index].title),
              separatorBuilder: (ctx, index) => szdBox(20, 0),
              itemCount: 9),
        )
      ],
    );
  }
}



class TopSearchItemTile extends StatelessWidget {
  final String image;
  final String title;
  const TopSearchItemTile({super.key, required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: screenWidth * 0.35,
          height: 70,
          decoration:  BoxDecoration(
            image: DecorationImage(
                image: NetworkImage('https://www.themoviedb.org/t/p/w500'+image), fit: BoxFit.cover),
          ),
        ),
        szdBox(0, 10),
         Expanded(
          child: Text(
            title,
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: KWhiteColor),
          ),
        ),
        const CircleAvatar(
          backgroundColor: KWhiteColor,
          radius: 23,
          child: CircleAvatar(
            backgroundColor: KBlackColor,
            radius: 21,
            child: Icon(CupertinoIcons.play_arrow_solid,size: 23,),
          ),
        )
      ],
    );
  }
}
