import 'package:flutter/material.dart';
import '../App Configurations/fonts.dart';
import '../utils/HelperFiles/math_utils.dart';

class AppStyle {
  static TextStyle textStyleSFPRORegular = textStyleSFPRO.copyWith(fontSize: getFontSize(14), fontWeight: FontWeight.normal);
  static TextStyle textStylePoppinsRegular = textStylePoppins.copyWith(fontSize: getFontSize(14), fontWeight: FontWeight.normal);
  static TextStyle textStyleSFPROBold = textStyleSFPRO.copyWith(fontWeight: FontWeight.bold);
  static TextStyle textStylePoppinsBold = textStylePoppins.copyWith(fontWeight: FontWeight.bold);

  static TextStyle textStyleSFPRO = TextStyle(
    fontFamily: FontFamily.SFPRO,
  );
  static TextStyle textStylePoppins = TextStyle(
    fontFamily: FontFamily.poppins,
  );
}
