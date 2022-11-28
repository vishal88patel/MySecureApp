import 'dart:io';

import 'package:flutter/material.dart';

class ColorConstant {
  static Color  primaryWhite = const Color(0xFFffffff);
  static Color  backgroundColor = const Color(0xFFF0F0F0);
  static Color primaryBlack= const Color(0xFF0D0D0D);
  static Color primaryAppTextF1= const Color(0xFFEAE8F1).withOpacity(0.36);
  static Color blue26= const Color(0xFF181A26);
  static Color skyE8= const Color(0xFF27EBE8);
  static Color grey8F= const Color(0xFF8F92A1);
  static Color lightSky= const Color(0xE8769D94);
  static Color grey77= const Color(0xFF777777);
  static Color buttonGreen= const Color(0xFF4CD080);
  static Color lightText= const Color(0xFF8A8A8A);
  static Color divider= const Color(0xFFE6E6E6);
  static Color lightButton= const Color(0xFFC5C5C5);
  static Color lightGreen= const Color(0xFF26BE63);
  static Color darkGreen= const Color(0xFF4D986D);
  static Color underLine= const Color(0xFF2C2A31);
  static Color darkBlue= const Color(0xFF1A1C29);
  static Color underLineGrey= const Color(0xFFF2F2F2);
  static Color blue62= const Color(0xFF092362);
  static Color shimmerBaseColor = Colors.grey;
  static Color shimmerHighlightColor = Color(0xFFF5F5F5);
  static Color blueFF= const Color(0xFF0088FF).withOpacity(0.20);
  static Color appProgressBarColor = const Color(0xFFE0001F);
  static Color redish = const Color(0xFFA45F5F);
  static Color primaryDarkGreen = const Color(0xFF105D38);
  static Color backBorder = const Color(0xFF030319).withOpacity(0.1);
  static Color primaryOrange = const Color(0xFFFFAE58);
  static Color secondaryDarkGreen = const Color(0xFF709E88);
  static Color thirdDarkGreen = const Color(0xFF286d4c);
  static Color primaryLightGreen = const Color(0xFF4CD080);
  static Color naturalBlack = const Color(0xFF030319);
  static Color naturalGrey = const Color(0xFF8F92A1);
  static Color naturalGrey2 = const Color(0xFFF2F2F2);
  static Color naturalGrey3 = const Color(0xFFBDBDBD);
  static Color brandYellow = const Color(0xFFFFAE58);
  static Color skyF6 = const Color(0xFFF6FAFD);
  static Color greyBD = const Color(0xFFBDBDBD);


  // new ui screen color


  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
