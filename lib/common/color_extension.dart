
import 'package:flutter/material.dart';

class TColor {
  static bool tModeDark = false;
  static Color get primary1 => const Color(0xffFFBB3B);
  static Color get primary2 => const Color(0xffFFA90A);
  static List<Color> get primaryG => [ primary1 , primary2 ];


  static Color get bgDark => const Color(0xff000000);
  static Color get bgLight => const Color(0xffF5F5F5);
  static Color get bg => tModeDark ?  bgDark : bgLight;

  static Color get cardDark => const Color(0xff212121);
  static Color get cardLight => const Color(0xffFFFFFF);
  static Color get card => tModeDark ? cardDark : cardLight;

  static Color get textDark => const Color(0xffFFFFFF);
  static Color get textLight => const Color(0xff5A5A5A);
  static Color get text => tModeDark ? textDark : textLight;

  static Color get btnText => tModeDark ? bgDark : cardLight;

  static Color get textOpacity => (text).withOpacity(0.6);

  static Color get subtextDark => const Color(0xffA2A2A2);
  static Color get subtextLight => const Color(0xffA2A2A2);
  static Color get subtext => tModeDark ? subtextDark : subtextLight;
}