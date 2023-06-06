import 'package:flutter/material.dart';
import 'package:ott_photo_play/view/login/register_view.dart';

import '../../common/color_extension.dart';
import '../../common_widget/round_button.dart';
import '../../common_widget/round_text_field.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
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
                    color: TColor.subtext,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    "BACK",
                    style: TextStyle(
                        color: TColor.subtext,
                        fontSize: 14,
                        fontWeight: FontWeight.w700),
                  )
                ],
              ),
            ),
          ),
        ),
        backgroundColor: TColor.bg,
        floatingActionButton: FloatingActionButton(
          backgroundColor: TColor.primary1,
          onPressed: () {
            TColor.tModeDark = !TColor.tModeDark;
            if (mounted) {
              setState(() {});
            }
          },
          child: Icon(
            TColor.tModeDark ? Icons.light_mode : Icons.dark_mode,
            color: TColor.text,
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: media.width * 0.1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: media.width,
                  height: media.width * 0.5,
                  alignment: const Alignment(0, 0.5),
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    
                    child: Image.asset(
                      "assets/img/app_logo.png",
                      width: media.width * 0.30,
                      height: media.width * 0.30,
                    ),
                  ),
                ),
                Text(
                  "FORGOT PASSWORD?",
                  style: TextStyle(
                      color: TColor.text,
                      fontSize: 13,
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Enter the email address you used to\ncreate your account and we will email\nyou a link to reset your password",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: TColor.subtext, fontSize: 15),
                ),
                const SizedBox(
                  height: 30,
                ),
                RoundTextField(
                  title: "EMAIL",
                  hintText: "email here",
                  keyboardType: TextInputType.emailAddress,
                  controller: txtEmail,
                ),
                const SizedBox(
                  height: 20,
                ),
                RoundButton(
                  title: "SEND EMAIL",
                  onPressed: () {},
                ),
                const SizedBox(
                  height: 25,
                ),
              ],
            ),
          ),
        ));
  }
}
