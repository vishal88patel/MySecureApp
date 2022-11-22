import 'package:flutter/material.dart';
import 'package:my_secure_app/theme/app_style.dart';
import 'package:my_secure_app/utils/HelperFiles/math_utils.dart';

import '../App Configurations/color_constants.dart';

class AccountDetailListWidget extends StatelessWidget {
  final String name;
  final String image;
  final String time;
  final String price;
  final String? transactionStatus;

  const AccountDetailListWidget({Key? key,
    required this.name,
    required this.image,
    required this.time,
    this.transactionStatus,
    required this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: ColorConstant.blue26, borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: getHorizontalSize(12), vertical: getVerticalSize(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  // height: getVerticalSize(40),
                  // width: getHorizontalSize(40),
                  decoration: BoxDecoration(
                      color: ColorConstant.blue26,
                      border: Border.all(color: ColorConstant.blueFF),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: getHorizontalSize(10),
                          vertical: getVerticalSize(10)),
                      child: Image.asset(
                        image.toString(),
                        height: getVerticalSize(24),
                        width: getHorizontalSize(18),
                      )),
                ),
                SizedBox(
                  width: getHorizontalSize(10),
                ),
                Container(
                  width: size.width / 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(name.toString(),
                          style: AppStyle.textStylePoppinsRegular.copyWith(
                              color: ColorConstant.primaryWhite,
                              fontWeight: FontWeight.w700,
                              fontSize: getFontSize(13))),
                      SizedBox(
                        height: getVerticalSize(5),
                      ),
                      Text(time.toString(),
                          style: AppStyle.textStylePoppinsRegular.copyWith(
                              color: ColorConstant.primaryWhite,
                              fontWeight: FontWeight.w400,
                              fontSize: getFontSize(11))),
                    ],
                  ),
                ),
                SizedBox(width: 12,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(transactionStatus.toString(),
                        style: AppStyle.textStylePoppinsRegular.copyWith(
                            color: transactionStatus == "credit" ? Colors.green:Colors.red,
                            fontWeight: FontWeight.w700,
                            fontSize: getFontSize(13))),

                  ],
                ),
              ],
            ),
            Text(price.toString(),
                style: AppStyle.textStylePoppinsRegular.copyWith(
                    color: ColorConstant.primaryWhite,
                    fontWeight: FontWeight.w500,
                    fontSize: getFontSize(13))),
          ],
        ),
      ),
    );
  }
}
