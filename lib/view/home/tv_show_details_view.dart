import 'package:fbroadcast/fbroadcast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:ott_photo_play/common/color_extension.dart';

import '../../common_widget/round_button.dart';
import 'cast_details_view.dart';

class TvShowDetailsView extends StatefulWidget {
  const TvShowDetailsView({super.key});

  @override
  State<TvShowDetailsView> createState() => _TvShowDetailsViewState();
}

class _TvShowDetailsViewState extends State<TvShowDetailsView> {
  List epArr = [
    {
      "name": "1. The Kingpin Strategy",
      "image": "assets/img/ep_thum_1.png",
      "duration": "54 min"
    },
    {
      "name": "2. The Cali KBG",
      "image": "assets/img/ep_thum_2.png",
      "duration": "55 min"
    },
    {
      "name": "3. The Kingpin Strategy",
      "image": "assets/img/ep_thum_1.png",
      "duration": "50 min"
    },
    {
      "name": "4. The Cali KBG",
      "image": "assets/img/ep_thum_2.png",
      "duration": "54 min"
    },
    {
      "name": "5. The Kingpin Strategy",
      "image": "assets/img/ep_thum_1.png",
      "duration": "54 min"
    },
    {
      "name": "6. The Cali KBG",
      "image": "assets/img/ep_thum_2.png",
      "duration": "55 min"
    },
    {
      "name": "7. The Kingpin Strategy",
      "image": "assets/img/ep_thum_1.png",
      "duration": "50 min"
    },
    {
      "name": "8. The Cali KBG",
      "image": "assets/img/ep_thum_2.png",
      "duration": "54 min"
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
                          "assets/img/tv_show.png",
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
                            "Narcos",
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
                                "Drama",
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
                                "Biographical",
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
                                "Crime Film",
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
                                "Crime Fiction",
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
                  "9.0",
                  style: TextStyle(
                    color: TColor.bgText,
                    fontSize: 33,
                  ),
                ),
                IgnorePointer(
                  ignoring: true,
                  child: RatingBar(
                    initialRating: 4,
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
                    "Netflix chronicles the rise of the cocaine trade in Colombia and the gripping real-life stories of drug kingpins of the late ‘80s in this raw, gritty original series.",
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
                          "Episodes",
                          style: TextStyle(
                              color: TColor.text,
                              fontSize: 15,
                              fontWeight: FontWeight.w700),
                        ),
                      ]),
                ),
                ListView.builder(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: epArr.length,
                    itemBuilder: (context, index) {
                      var cObj = epArr[index] as Map? ?? {};
                      var image = cObj["image"].toString();

                      return InkWell(
                        onTap: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) =>
                          //             const CastDetailsView()));
                        },
                        child: Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.symmetric(
                                 vertical: 8 ),
                              color: TColor.castBG,
                              width: media.width * 0.35,
                              height: media.width * 0.25,
                              child: image != ""
                                  ? ClipRect(
                                      child: Image.asset(
                                        image,
                                        width: media.width * 0.35,
                                        height: media.width * 0.25,
                                        fit: BoxFit.cover,
                                      ),
                                    )
                                  : null,
                            ),
                            
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      cObj["name"].toString(),
                                      maxLines: 1,
                                      style: TextStyle(
                                          color: TColor.text,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child:Text(
                                    cObj["duration"].toString(),
                                    style: TextStyle(
                                        color: TColor.subtext, fontSize: 13),
                                  ),),
                                  TextButton.icon(
                                      onPressed: () {},
                                      icon: Image.asset(
                                        "assets/img/tab_download.png",
                                        width: 13,
                                        height: 13,
                                        color: TColor.primary2,
                                      ),
                                      label: Text(
                                        "Download",
                                        style: TextStyle(
                                            color: TColor.primary2,
                                            fontSize: 12, fontWeight: FontWeight.w500),
                                      )  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
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
