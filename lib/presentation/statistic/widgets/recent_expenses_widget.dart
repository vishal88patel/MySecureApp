import 'package:flutter/material.dart';
import 'package:secureapp/App%20Configurations/color_constants.dart';
import 'package:secureapp/theme/app_style.dart';
import 'package:secureapp/utils/HelperFiles/math_utils.dart';

class RecentExpenses extends StatelessWidget {
  String? title;
  String? amount;
  String? image;
  String? status;
  String? transactionStatus;
  String? date;

  RecentExpenses(
      {this.title,
      this.amount,
      this.image,
      this.status,
      this.transactionStatus,
      this.date});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: getHorizontalSize(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          image.toString(),
                          height: getVerticalSize(70),
                          width: getVerticalSize(70),
                        )),
                    SizedBox(
                      width: getHorizontalSize(20),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          title.toString(),
                          style: AppStyle.textStyleDMSANS.copyWith(
                              color: ColorConstant.naturalBlack,
                              fontWeight: FontWeight.w700,
                              fontSize: getFontSize(20)),
                        ),
                        SizedBox(
                          height: getVerticalSize(8),
                        ),
                        Row(
                          children: [
                            Text(
                              date.toString(),
                              style: AppStyle.textStyleDMSANS.copyWith(
                                  color: ColorConstant.grey8F,
                                  fontWeight: FontWeight.w400,
                                  fontSize: getFontSize(16)),
                            ),
                            // Text('•',
                            //   style: AppStyle.textStyleDMSANS.copyWith(
                            //       color: ColorConstant.grey8F,
                            //       fontWeight: FontWeight.w400,
                            //       fontSize: getFontSize(16)),
                            // ),
                            // Text('3:09 PM',
                            //   style: AppStyle.textStyleDMSANS.copyWith(
                            //       color: ColorConstant.grey8F,
                            //       fontWeight: FontWeight.w400,
                            //       fontSize: getFontSize(16)),
                            // ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                transactionStatus.toString() == "Success"
                    ? status.toString() == "credit"
                        ? Text(
                            '+ \$${amount}',
                            style: AppStyle.textStyleDMSANS.copyWith(
                                color: ColorConstant.primaryDarkGreen,
                                fontWeight: FontWeight.w700,
                                fontSize: getFontSize(20)),
                          )
                        : Text(
                            '- \$${amount}',
                            style: AppStyle.textStyleDMSANS.copyWith(
                                color: ColorConstant.appProgressBarColor,
                                fontWeight: FontWeight.w700,
                                fontSize: getFontSize(20)),
                          )
                    : Text(
                        'Failed',
                        style: AppStyle.textStyleDMSANS.copyWith(
                            color: ColorConstant.appProgressBarColor,
                            fontWeight: FontWeight.w700,
                            fontSize: getFontSize(20)),
                      ),
              ]),
          SizedBox(
            height: getVerticalSize(10),
          ),
          const Divider()
        ],
      ),
    );
  }
}
