import 'package:fbroadcast/fbroadcast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:ott_photo_play/common/color_extension.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List watchArr = [
    "assets/img/mov_1.png",
    "assets/img/mov_2.png",
    "assets/img/mov_3.png",
    "assets/img/mov_4.png",
    "assets/img/mov_1.png",
    "assets/img/mov_2.png",
    "assets/img/mov_3.png",
    "assets/img/mov_4.png",
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                SizedBox(
                  width: media.width,
                  height: media.width * 1.35,
                  child: ClipRect(
                    child: Image.asset(
                      TColor.tModeDark
                          ? "assets/img/home_image_dark.png"
                          : "assets/img/home_image_light.png",
                      width: media.width,
                      height: media.width,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            Text(
              "4.0",
              style: TextStyle(
                color: TColor.text,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Movie",
                  style: TextStyle(
                      color: TColor.text,
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  " | ",
                  style: TextStyle(
                      color: TColor.text,
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  "Adventure",
                  style: TextStyle(
                      color: TColor.text,
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  " | ",
                  style: TextStyle(
                      color: TColor.text,
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  "Comedy",
                  style: TextStyle(
                      color: TColor.text,
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  " | ",
                  style: TextStyle(
                      color: TColor.text,
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  "Family",
                  style: TextStyle(
                      color: TColor.text,
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Text(
                  "Watching",
                  style: TextStyle(
                      color: TColor.text,
                      fontSize: 15,
                      fontWeight: FontWeight.w700),
                ),
              ]),
            ),
            SizedBox(
              height: media.width * 0.46,
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  scrollDirection: Axis.horizontal,
                  itemCount: watchArr.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 6),
                      color: TColor.card,
                      child: ClipRect(
                        child: Image.asset(
                          watchArr[index].toString(),
                          width: media.width * 0.33,
                          height: media.width * 0.45,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  }),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Text(
                  "New & Upcoming",
                  style: TextStyle(
                      color: TColor.text,
                      fontSize: 15,
                      fontWeight: FontWeight.w700),
                ),
              ]),
            ),
            SizedBox(
              height: media.width * 0.46,
              child: ListView.builder(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  scrollDirection: Axis.horizontal,
                  itemCount: watchArr.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 6),
                      color: TColor.card,
                      child: ClipRect(
                        child: Image.asset(
                          watchArr[index].toString(),
                          width: media.width * 0.33,
                          height: media.width * 0.45,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  }),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Text(
                  "Action",
                  style: TextStyle(
                      color: TColor.text,
                      fontSize: 15,
                      fontWeight: FontWeight.w700),
                ),
              ]),
            ),
            SizedBox(
              height: media.width * 0.46,
              child: ListView.builder(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  scrollDirection: Axis.horizontal,
                  itemCount: watchArr.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 6),
                      color: TColor.card,
                      child: ClipRect(
                        child: Image.asset(
                          watchArr[index].toString(),
                          width: media.width * 0.33,
                          height: media.width * 0.45,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
