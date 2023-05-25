import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/search/widgets/title.dart';
import 'package:netflix/presentation/widgets/sized_box_widget.dart';

const imageUrl =
    'https://www.themoviedb.org/t/p/w355_and_h200_multi_faces/m8JTwHFwX7I7JY5fPe4SjqejWag.jpg';

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         const searchTextTitle(title: "Top Searches"),
        kHeight,
        Expanded(
          child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (ctx, index) => const TopSearchItemTile(),
              separatorBuilder: (ctx, index) => szdBox(20, 0),
              itemCount: 10),
        )
      ],
    );
  }
}



class TopSearchItemTile extends StatelessWidget {
  const TopSearchItemTile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: screenWidth * 0.35,
          height: 70,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(imageUrl), fit: BoxFit.cover),
          ),
        ),
        szdBox(0, 10),
        const Expanded(
          child: Text(
            'Movie Name',
            style: TextStyle(
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
