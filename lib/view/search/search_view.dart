import 'package:fbroadcast/fbroadcast.dart';
import 'package:flutter/material.dart';

import '../../common/color_extension.dart';
import '../../common_widget/round_text_field.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  TextEditingController txtSearch = TextEditingController();
  List searchArr = [
    {
      "name": "TV SHOWS",
      "list": ["assets/img/search_1.png"]
    },
    {
      "name": "MOVIES",
      "list": [
        "assets/img/search_2.png",
            "assets/img/search_3.png"
      ]
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: RoundTextField(
                  title: "",
                  controller: txtSearch,
                  hintText: "Search here...",
                  left: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Image.asset(
                      "assets/img/tab_search-2.png",
                      width: 20,
                      height: 20,
                      color: TColor.bgText,
                    ),
                  )),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 15),
              itemCount: searchArr.length,
              itemBuilder: ((context, index) {
                var sObj = searchArr[index] as Map? ?? {};
                var sArr = sObj["list"] as List? ?? [];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          children: [
                            Text(
                              sObj["name"].toString(),
                              style: TextStyle(
                                  color: TColor.text,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Expanded(
                              child: Container(
                                height: 1,
                                color: TColor.subtext,
                              ),
                            )
                          ],
                        ),
                      ),
SizedBox(
                    height: (media.width * 0.4) ,
                    child:
                       ListView.builder(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          scrollDirection: Axis.horizontal,
                          itemCount: sArr.length,
                          itemBuilder: (context, index) {
                           

                            return InkWell(
                              onTap: () {
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) =>
                                //             const CastDetailsView()));
                              },
                              child: 
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 6),
                                    color: TColor.castBG,
                                    width: media.width * 0.25,
                                    height: media.width * 0.32,
                                    child:ClipRect(
                                            child: Image.asset(
                                              sArr[index].toString(),
                                              width: media.width * 0.25,
                                              height: media.width * 0.32,
                                              fit: BoxFit.cover,
                                            ),
                                          )
                                        ,
                                  ),
                                  
                               
                            );
                          }),),
                    ],
                  ),
                );
              }),
            ),
          )
        ],
      ),
    );
  }
}
