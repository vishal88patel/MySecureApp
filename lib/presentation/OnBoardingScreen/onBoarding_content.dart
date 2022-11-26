import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_secure_app/utils/HelperFiles/math_utils.dart';

import '../../App Configurations/color_constants.dart';
import '../../theme/app_style.dart';

class OnBoardingContent extends StatelessWidget {
  const OnBoardingContent({
    this.text,
    this.image,
  }) : super();
  final String? text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children:[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image!,
              height: MediaQuery.of(context).size.height/2.5,
              width: MediaQuery.of(context).size.width/1.25,
            ),
          ],
        ),
      ],
    );
  }
}