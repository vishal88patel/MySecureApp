import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:secure_cash_app/theme/app_style.dart';
import 'package:secure_cash_app/utils/HelperFiles/math_utils.dart';

import '../App Configurations/color_constants.dart';

class BlackAppBar extends StatelessWidget {
  final String title;
  final String icon2;
  final bool icon1show;
  final void Function() onPressedIcon1;


  const BlackAppBar({Key? key,
    required this.title,
   required this.icon2, required this.onPressedIcon1,
     required this.icon1show,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: getVerticalSize(26),
        ),
        Padding(
          padding: EdgeInsets.only(left: getHorizontalSize(22),right: getHorizontalSize(22)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              icon1show?InkWell(
                onTap: () {
                  onPressedIcon1==null?Get.back():onPressedIcon1;
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius:
                      BorderRadius.circular(12),
                      border: Border.all(
                          color:
                          ColorConstant.backBorder)),
                  padding: EdgeInsets.all(6),
                  child: Icon(
                    Icons.arrow_back_ios_new_outlined,size: 22,),
                ),
              ):Container(height: getVerticalSize(42),width: getHorizontalSize(42),),
              Text(
                title.toString(),
                style: AppStyle.textStyleDMSANS.copyWith(
                    color: ColorConstant.naturalBlack,
                    fontWeight: FontWeight.w700,
                    fontSize: getFontSize(20)),
              ),
              Container(height: getVerticalSize(42),width: getHorizontalSize(42),),
            ],
          ),
        ),
      ],
    );
  }
}
