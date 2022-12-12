import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Size size = WidgetsBinding.instance.window.physicalSize /
    WidgetsBinding.instance.window.devicePixelRatio;

///This method is used to set padding/margin (for the left and Right side) & width of the screen or widget according to the Viewport width.
double getHorizontalSize(double px) {
  return px * (size.width / 428);
}

///This method is used to set padding/margin (for the top and bottom side) & height of the screen or widget according to the Viewport height.
double getVerticalSize(double px) {
  num statusBar =
      MediaQueryData.fromWindow(WidgetsBinding.instance.window).viewPadding.top;
  num screenHeight = size.height - statusBar;
  return px * (screenHeight / 926);
}

///This method is used to set text font size according to Viewport
double getFontSize(double px) {
  var height = getVerticalSize(px);
  var width = getHorizontalSize(px);
  if (height < width) {
    return height.toInt().toDouble();
  } else {
    return width.toInt().toDouble();
  }
}

///This method is used to set smallest px in image height and width
double getSize(double px) {
  var height = getVerticalSize(px);
  var width = getHorizontalSize(px);
  if (height < width) {
    return height.toInt().toDouble();
  } else {
    return width.toInt().toDouble();
  }
}
extension StringCasingExtension on String {
  String toCapitalized() => length > 0 ?'${this[0].toUpperCase()}${substring(1).toLowerCase()}':'';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ').split(' ').map((str) => str.toCapitalized()).join(' ');
}

String dateConverter(String date){
  var inputFormat = DateFormat('yyyy-MM-dd');
  var date1 = inputFormat.parse(date);
  var outputFormat = DateFormat('MM/dd/yyyy');
  var date2 = outputFormat.format(date1);
  return date2.toString();
}
String dateConverterDDMMYYYY(String date){
  var inputFormat = DateFormat('MM/dd/yyyy');
  var date1 = inputFormat.parse(date);
  var outputFormat = DateFormat('dd/MM/yyyy');
  var date2 = outputFormat.format(date1);
  return date2.toString();
}


