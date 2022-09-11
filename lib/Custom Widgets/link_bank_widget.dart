import 'package:flutter/material.dart';
import 'package:my_secure_app/theme/app_style.dart';
import 'package:my_secure_app/utils/HelperFiles/math_utils.dart';

import '../App Configurations/color_constants.dart';

class LinkBankWidget extends StatelessWidget {
  final String image;
  final String image1;

  final String icon;
  final String title;

  const LinkBankWidget({Key? key,
    required this.image,
    required this.icon,
    required this.title, required this.image1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        Image.asset(image.toString(),height: getVerticalSize(210),),
        Positioned(
          top:getVerticalSize(60) ,
          bottom: 0,
          left: getHorizontalSize(40),
          child:  Row(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(image1.toString(),
                height: getVerticalSize(110),),
SizedBox(width: getHorizontalSize(30),),
              Column(
                children: [
                  Text(title.toString(),style: AppStyle.textStylePoppinsRegular
                      .copyWith(color: ColorConstant.blue62,
                      fontWeight: FontWeight.w700,fontSize: getFontSize(16)),textAlign: TextAlign.center,),
                  SizedBox(height: getVerticalSize(10),),

                  Image.asset(icon.toString(),
                    height: getVerticalSize(34.8),width: getHorizontalSize(34.8),),

                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
