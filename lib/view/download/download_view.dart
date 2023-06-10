import 'package:fbroadcast/fbroadcast.dart';
import 'package:flutter/material.dart';

import '../../common/color_extension.dart';

class DownloadView extends StatefulWidget {
  const DownloadView({super.key});

  @override
  State<DownloadView> createState() => _DownloadViewState();
}

class _DownloadViewState extends State<DownloadView> {

  List downloadArr = [{
    "name":"Narcos",
    "image":"assets/img/down_1.png",
    "size":"5.02GB",
    "episodes":"4",
    "is_movie":false,
  },
    {
      "name": "Alita Battle Angel",
      "image": "assets/img/down_2.png",
      "size": "1.45GB",
      "episodes": "",
      "is_movie": true,
    }
  ,
    {
      "name": "Gotham",
      "image": "assets/img/down_3.png",
      "size": "10.04GB",
      "episodes": "8",
      "is_movie": false,
    }
  ,
    {
      "name": "Sacred Games",
      "image": "assets/img/down_4.png",
      "size": "2.02GB",
      "episodes": "3",
      "is_movie": true,
    }
  ,
    {
      "name": "Shazam",
      "image": "assets/img/down_5.png",
      "size": "2.32GB",
      "episodes": "",
      "is_movie": true,
    }
  ,
    {
      "name": "Toy Story 4",
      "image": "assets/img/down_6.png",
      "size": "3.45GB",
      "episodes": "",
      "is_movie": true,
    }
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
     body: ListView.builder(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 50),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: downloadArr.length,
                    itemBuilder: (context, index) {
                      var dObj = downloadArr[index] as Map? ?? {};
                      var image = dObj["image"].toString();

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
                              height: media.width * 0.22,
                              child: image != ""
                                  ? ClipRect(
                                      child: Image.asset(
                                        image,
                                        width: media.width * 0.35,
                                        height: media.width * 0.22,
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
                                      dObj["name"].toString(),
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
                                    (dObj["is_movie"]  as bool? ?? false) ? dObj["size"].toString() :  "${ dObj["episodes"] ?? "" } Episodes | ${dObj["size"] ?? ""}" ,
                                    style: TextStyle(
                                        color: TColor.subtext, fontSize: 13),
                                  ),),
                                  
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
    );
  }
}
