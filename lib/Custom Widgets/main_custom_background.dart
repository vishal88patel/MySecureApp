import 'package:flutter/material.dart';

import '../App Configurations/color_constants.dart';

class MainCutomBackGround extends StatelessWidget {
  const MainCutomBackGround({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(color: ColorConstant.primaryBlack),
        Positioned(
            top: 0,
            right: 0,
            child: Image.asset("asset/main_background_images/Polygon 1.png")),
        Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset("asset/main_background_images/Polygon 2.png")),
      ],
    );
  }
}
