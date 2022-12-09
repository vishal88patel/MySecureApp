import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:secure_cash_app/theme/app_style.dart';
import 'package:secure_cash_app/utils/HelperFiles/math_utils.dart';

import '../App Configurations/color_constants.dart';

class AppAppBar extends StatelessWidget {
  final String title;
  final String icon1;
  final String icon2;
  final double? top;
  final double? bottom;
  final Color? titleColor;
  final void Function() onPressedIcon1;
  final void Function() onPressedIcon2;


  const AppAppBar({Key? key,
    required this.title,
    required this.icon1, required this.icon2, required this.onPressedIcon1,
    required this.onPressedIcon2,  this.titleColor, this.top, this.bottom}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: getVerticalSize(top??26),
        ),
        Padding(
          padding: EdgeInsets.only(left: getHorizontalSize(22),right: getHorizontalSize(22)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: onPressedIcon1,
                child: SvgPicture.asset(
                  icon1.toString(),
                  fit: BoxFit.fill,
                  height: getVerticalSize(42),
                ),
              ),
              Text(
                title.toString(),
                style: AppStyle.textStyleDMSANS.copyWith(
                    color: titleColor??ColorConstant.primaryWhite,
                    fontWeight: FontWeight.w700,
                    fontSize: getFontSize(24)),
              ),
              InkWell(
                onTap: onPressedIcon2,
                child: SvgPicture.asset(
                  icon2.toString(),
                  fit: BoxFit.fill,
                  height: getVerticalSize(40),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: getVerticalSize(bottom??28),
        ),
      ],
    );
  }
}
