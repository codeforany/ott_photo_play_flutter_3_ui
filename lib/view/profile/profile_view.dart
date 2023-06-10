import 'dart:io';

import 'package:fbroadcast/fbroadcast.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../common/color_extension.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final ImagePicker picker = ImagePicker();
  XFile? image;

  List menuArr = [
    {
      "image": "assets/img/pr_user.png",
      "name": "Account",
    },
    {
      "image": "assets/img/pr_notification.png",
      "name": "Notification",
    },
    {
      "image": "assets/img/pr_settings.png",
      "name": "Setting",
    },
    {
      "image": "assets/img/pr_help.png",
      "name": "Help",
    },
    {
      "image": "assets/img/pr_logout.png",
      "name": "Logout",
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

               const  SizedBox(height: 20,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () async {
                        image =
                            await picker.pickImage(source: ImageSource.gallery);

                        setState(() {});
                      },
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: TColor.primaryG,
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter),
                            borderRadius:
                                BorderRadius.circular(media.width * 0.20),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 6,
                                  offset: Offset(0, 4))
                            ]),
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              color: TColor.bg,
                              borderRadius:
                                  BorderRadius.circular(media.width * 0.15),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 6,
                                    offset: Offset(0, 4))
                              ]),
                          child: image != null
                              ? ClipRRect(
                                  borderRadius:
                                      BorderRadius.circular(media.width * 0.15),
                                  child: Image.file(
                                    File(image!.path),
                                    width: media.width * 0.28,
                                    height: media.width * 0.28,
                                    fit: BoxFit.cover,
                                  ))
                              : ClipRRect(
                                  borderRadius:
                                      BorderRadius.circular(media.width * 0.15),
                                  child: Image.asset(
                                    "assets/img/user_placeholder.png",
                                    width: media.width * 0.28,
                                    height: media.width * 0.28,
                                  ),
                                ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Text(
                      "Code For Any",
                      style: TextStyle(
                          color: TColor.bgText,
                          fontSize: 27,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "Premium",
                      style: TextStyle(
                        color: TColor.primary2,
                        fontSize: 15,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      var mObj = menuArr[index] as Map? ?? {};
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              mObj["image"].toString(),
                              width: 20,
                              height: 20,
                              color: TColor.text,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Text(
                              mObj["name"].toString(),
                              style: TextStyle(
                                color: TColor.text,
                                fontSize: 15,
                              ),
                            )
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => Divider(
                          height: 1,
                          color: TColor.subtext.withOpacity(0.2),
                        ),
                    itemCount: menuArr.length)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
