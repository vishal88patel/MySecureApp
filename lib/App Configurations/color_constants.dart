import 'dart:io';

import 'package:flutter/material.dart';

class ColorConstant {
  static Color primaryWhite = const Color(0xFFffffff);
  static Color primaryBlack= const Color(0xFF0D0D0D);
  static Color primaryAppTextF1= const Color(0xFFEAE8F1).withOpacity(0.36);
  static Color blue26= const Color(0xFF181A26);
  static Color skyE8= const Color(0xFF27EBE8);
  static Color grey77= const Color(0xFF777777);
  static Color blueFF= const Color(0xFF0088FF).withOpacity(0.20);
  // static Color primaryBlack = Color(0xFF070707);
  // static Color primaryGrey = Color(0xFF9E9E9E);
  // static Color lowerBG = Color(0xFFFFF7EA);
  // static Color dailyHoroscopeDetailPageIconBackgroundColor = lowerBG;
  // static Color cartPageProductCardBackgroundColor = lowerBG;
  // static Color signupPageHintTextColor = Color(0xFF999999);
  // static Color borderColor = Color(0xFFDDDDDD);
  static Color appProgressBarColor = const Color(0xFFE0001F);
  // static Color buttonColorYellow = Color(0xFFE28E00);
  // static Color primaryYellowColor = Color(0xFFE28E00);
  // static Color borderYellowColor = Color(0xFFD49132);
  // static Color starRatingGreenColor = Color(0xFFB7DD29);
  // static Color termsandConditionTextColor = Color(0xFF37474F);
  // static Color textBlackColor = Color(0xFF37474F);
  // static Color textBlackColorForTitle = Color(0xFF373A3C);
  // static Color techSupportBtnBackgroundColor = textBlackColor;
  // static Color cardUnselectedBorderColor = Color(0xFFDDDDDD);
  // static Color dividerColor = cardUnselectedBorderColor;
  // static Color cardselectedBorderColor = primaryYellowColor;
  // static Color readmoreContentTextColor = Color(0xFF373A3C);
  // static Color checkOutPageUnselectedCardColor = Color(0xFF00000029);
  // static Color authScreenBackgroundSignsColor = Color(0xFFC6C6C6);
  // static Color dailyHoroscopeDetailsTextColor = Color(0xFF373A3C);
  // static Color animationIconColor = Color(0xFFE0001F);
  // static Color homePageYelloBackground = Color(0xFFFFF7EA);
  // static Color astroStoreTileNameBackground = Color(0xFFFFF7EA);
  //
  // static Color homepageAstrolistdetailColor = Color(0xFFA3A3A3);
  // static Color chatCallbtnGreenColor = Color(0xFF5FA216);
  // static Color availableStatusButtonColor = Color(0xFF5FA216);
  // static Color busyStatusButtonColor = Color(0xFFEC1E27);
  // static Color offlineStatusButtonColor = Color(0xFF999999);
  // static Color shimmerBaseColor = Color(0xFFE0E0E0);
  // static Color shimmerHighlightColor = Color(0xFFF5F5F5);
  // static Color shadowColor = Color(0xFF00000D);
  // static Color ratingStartsColor = Color(0xFFB7DD29);
  // static Color ratingTextColor = Color(0xFF744253);
  // static Color callBackgroundBlackColor = Color(0xFF434343);

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
