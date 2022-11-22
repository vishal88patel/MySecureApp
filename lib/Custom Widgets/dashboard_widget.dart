import 'package:flutter/material.dart';
import 'package:my_secure_app/theme/app_style.dart';
import 'package:my_secure_app/utils/HelperFiles/math_utils.dart';

import '../App Configurations/color_constants.dart';

class DashboardWidget extends StatelessWidget {
  final String image;
  final String icon;
  final String title;
  final Function onTap;
  final Widget? child;

  const DashboardWidget({
    Key? key,
    required this.image,
    required this.icon,
    required this.title,
    required this.onTap,
     this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(right:getHorizontalSize(40)),
      child: InkWell(
        onTap: (){
          onTap.call();
        },
        child: Stack(
          children: [
            Image.asset(
              image.toString(),
              height: getVerticalSize(240),
            ),
            Positioned(
              top: getVerticalSize(70),
              bottom: 0,
              left: getHorizontalSize(60),
              child: Column(
                children: [
                  Image.asset(
                    icon.toString(),color: ColorConstant.darkBlue,
                    height: getVerticalSize(34.8),
                    width: getHorizontalSize(34.8),
                  ),
                  SizedBox(
                    height: getVerticalSize(10),
                  ),
                  Text(
                    title.toString(),
                    style: AppStyle.textStylePoppinsRegular.copyWith(
                        color: ColorConstant.blue62,
                        fontWeight: FontWeight.w700,
                        fontSize: getFontSize(14)),

                  ),
                  SizedBox(
                    height: getVerticalSize(10),
                  ),
                  Container(
                    child:child ,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
