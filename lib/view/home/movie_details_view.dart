import 'package:fbroadcast/fbroadcast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:ott_photo_play/common/color_extension.dart';

import '../../common_widget/round_button.dart';

class MovieDetailsView extends StatefulWidget {
  const MovieDetailsView({super.key});

  @override
  State<MovieDetailsView> createState() => _MovieDetailsViewState();
}

class _MovieDetailsViewState extends State<MovieDetailsView> {
  List castArr = [
    {
      "name": "Isabela Moner",
      "image": "",
    },
    {
      "name": "Michael Peña",
      "image": "assets/img/Michael Pena.png",
    },
    {
      "name": "Eva Longoria",
      "image": "assets/img/Eva Longoria.png",
    },
    {
      "name": "Eugenio Derbez",
      "image": "",
    },
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FBroadcast.instance().register("change_mode", (value, callback) {
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: TColor.bg,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      SizedBox(
                        width: media.width,
                        height: media.width * 0.8,
                        child: ClipRect(
                          child: Image.asset(
                            "assets/img/mov_detail.png",
                            width: media.width,
                            height: media.width,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        width: media.width,
                        height: media.width * 0.8,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [
                              TColor.bgDark,
                              TColor.bgDark.withOpacity(0),
                              TColor.bg.withOpacity(0),
                              TColor.bg
                            ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter)),
                      ),
                      Container(
                        width: media.width,
                        height: media.width * 0.8,
                        alignment: Alignment.center,
                        child: InkWell(
                          onTap: () {},
                          child: Image.asset("assets/img/play-button.png",
                              width: 55, height: 55),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Dora and the lost city of gold",
                              style: TextStyle(
                                  color: TColor.bgText,
                                  fontSize: 19,
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Movie",
                                  style: TextStyle(
                                      color: TColor.bgText,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  " | ",
                                  style: TextStyle(
                                      color: TColor.bgText,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  "Adventure",
                                  style: TextStyle(
                                      color: TColor.bgText,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  " | ",
                                  style: TextStyle(
                                      color: TColor.bgText,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  "Comedy",
                                  style: TextStyle(
                                      color: TColor.bgText,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  " | ",
                                  style: TextStyle(
                                      color: TColor.bgText,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  "Family",
                                  style: TextStyle(
                                      color: TColor.bgText,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Text(
                    "4.0",
                    style: TextStyle(
                      color: TColor.bgText,
                      fontSize: 33,
                    ),
                  ),
                  IgnorePointer(
                    ignoring: true,
                    child: RatingBar(
                      initialRating: 2,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: 18,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                      ratingWidget: RatingWidget(
                        full: Image.asset("assets/img/star_fill.png"),
                        half: Image.asset("assets/img/star.png"),
                        empty: Image.asset("assets/img/star.png"),
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Text(
                      "Having spent most of her life exploring the jungle, nothing could prepare Dora for her most dangerous adventure yet — high school. ",
                      style: TextStyle(
                        color: TColor.text,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: 150,
                    child: RoundButton(
                      title: "WATCH NOW",
                      height: 40,
                      onPressed: () {
                        //  Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) =>
                        //             const MainTabView()));
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Cast",
                            style: TextStyle(
                                color: TColor.text,
                                fontSize: 15,
                                fontWeight: FontWeight.w700),
                          ),
                        ]),
                  ),
                  SizedBox(
                    height: (media.width * 0.34) + 40,
                    child: ListView.builder(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        scrollDirection: Axis.horizontal,
                        itemCount: castArr.length,
                        itemBuilder: (context, index) {
                          var cObj = castArr[index] as Map? ?? {};
                          var image = cObj["image"].toString();
          
                          return Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.symmetric(horizontal: 6),
                                color: TColor.castBG,
                                width: media.width * 0.25,
                                height: media.width * 0.32,
                                child: image != ""
                                    ? ClipRect(
                                        child: Image.asset(
                                          image,
                                          width: media.width * 0.25,
                                          height: media.width * 0.32,
                                          fit: BoxFit.contain,
                                        ),
                                      )
                                    : null,
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                cObj["name"].toString(),
                                style: TextStyle(
                                  color: TColor.text,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          );
                        }),
                  ),
                ],
              ),
            ),
          
          SafeArea(
            child: Column(
              children: [
                AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  leadingWidth: 100,
                  leading: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            "assets/img/back_btn.png",
                            width: 13,
                            height: 13,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          const Text(
                            "BACK",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: TColor.primary1,
        onPressed: () {
          TColor.tModeDark = !TColor.tModeDark;
          FBroadcast.instance().broadcast("change_mode");
          if (mounted) {
            setState(() {});
          }
        },
        child: Icon(
          TColor.tModeDark ? Icons.light_mode : Icons.dark_mode,
          color: TColor.text,
        ),
      ),
    );
  }
}
