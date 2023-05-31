import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/home/widgets/custom_button.dart';

class CommingSoonWidget extends StatelessWidget {
  const CommingSoonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          width: 50,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'FEB',
                style: TextStyle(fontSize: 17),
              ),
              Text(
                '15',
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: KWhiteColor),
              )
            ],
          ),
        ),
        SizedBox(
          width: size.width - 50,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 200,
                    child: Image.network(
                      "https://www.themoviedb.org/t/p/w355_and_h200_multi_faces/r7zUXadc1saFFSWz8lbUx7q9bkG.jpg",
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
              ),
              kHeight,
              Row(
                children: [
                  SizedBox(
                    height: 50,
                    child: Image.network(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSv_04UVGA5GxM88FkFV8uN_jl_KoWACKtXR8ZmvoW-hME-uQc0zB-_doLrNlWqx-nuuA&usqp=CAU"),
                  ),
                  const Spacer(),
                  const Row(
                    children: [
                      CustomButtonWidget(
                        icon: Icons.notifications_none_outlined,
                        title: "Remind Me",
                        iconSize: 20,
                        textSize: 12,
                      ),
                      kWidth,
                      CustomButtonWidget(
                        icon: Icons.info_outline,
                        title: "Info",
                        iconSize: 20,
                        textSize: 12,
                      ),
                      kWidth,
                      kWidth,
                    ],
                  ),
                ],
              ),
              kHeight,
              Text(
                "Comming on Friday",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              kHeight,
              Text(
                "The Walking Dead",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              kHeight,
              SizedBox(
                width: size.width - 50,
                child: Text(
                  "Sheriff's deputy Rick Grimes awakens from a coma to find a post-apocalyptic world dominated by flesh-eating zombies. He sets out to find his family and encounters many other survivors along the way.",
                  style: TextStyle(
                    color: KGreyColor,
                  ),
                ),
              ),
              kHeight,
            ],
          ),
        ),
      ],
    );
  }
}