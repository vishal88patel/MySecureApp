import 'package:flutter/material.dart';
import 'package:my_secure_app/App%20Configurations/color_constants.dart';
import 'package:my_secure_app/theme/app_style.dart';
import 'package:my_secure_app/utils/HelperFiles/math_utils.dart';

class RecentExpenses extends StatelessWidget {
  const RecentExpenses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: getHorizontalSize(20)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
            Row(
              children: [
                ClipRRect(borderRadius: BorderRadius.circular(16),
                 child: Image.asset('asset/icons/mg_image.png',
                  height: getVerticalSize(70),width: getVerticalSize(70),)),
                SizedBox(width: getHorizontalSize(20),),
                Column(crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Starbucks Coffee',
                      style: AppStyle.textStyleDMSANS.copyWith(
                          color: ColorConstant.naturalBlack,
                          fontWeight: FontWeight.w700,
                          fontSize: getFontSize(20)),
                    ),
                    SizedBox(height: getVerticalSize(8),),
                    Row(
                      children: [
                        Text('Dec 2, 2020',
                          style: AppStyle.textStyleDMSANS.copyWith(
                              color: ColorConstant.grey8F,
                              fontWeight: FontWeight.w400,
                              fontSize: getFontSize(16)),
                        ),
                        Text('•',
                          style: AppStyle.textStyleDMSANS.copyWith(
                              color: ColorConstant.grey8F,
                              fontWeight: FontWeight.w400,
                              fontSize: getFontSize(16)),
                        ),
                        Text('3:09 PM',
                          style: AppStyle.textStyleDMSANS.copyWith(
                              color: ColorConstant.grey8F,
                              fontWeight: FontWeight.w400,
                              fontSize: getFontSize(16)),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),

            Text('-\$156.00',
              style: AppStyle.textStyleDMSANS.copyWith(
                  color: ColorConstant.naturalBlack,
                  fontWeight: FontWeight.w700,
                  fontSize: getFontSize(20)),
            ),
          ]),
          SizedBox(height: getVerticalSize(10),),
          const Divider()
        ],
      ),
    );
  }
}


