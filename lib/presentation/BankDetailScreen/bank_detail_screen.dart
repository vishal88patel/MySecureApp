import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_secure_app/App%20Configurations/color_constants.dart';
import 'package:my_secure_app/Custom%20Widgets/app_ElevatedButton%20.dart';
import 'package:my_secure_app/Custom%20Widgets/app_textField.dart';
import 'package:my_secure_app/Custom%20Widgets/app_textFormField_fill.dart';
import 'package:my_secure_app/Custom%20Widgets/main_custom_background.dart';
import 'package:my_secure_app/presentation/BankDetailScreen/controller/bank_detail_screen_controller.dart';
import 'package:my_secure_app/presentation/CardDetailScreen/controller/card_detail_screen_controller.dart';
import 'package:my_secure_app/presentation/PersonalDetails/controller/personal_detail_screen_controller.dart';
import 'package:my_secure_app/routes/app_routes.dart';
import 'package:my_secure_app/theme/app_style.dart';
import 'package:my_secure_app/utils/HelperFiles/math_utils.dart';

class BankDetailScreen extends StatelessWidget {
  var bankDetailController = Get.find<BankDetailScreenController>();
List<String> payment=[ 'Personal Loan','Payday Loan','Auto Loan',
                                 'Mortage Loan','Emergency Loan',];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            MainCutomBackGround(
                child: Padding(padding: EdgeInsets.symmetric(
                    horizontal: getHorizontalSize(25.0),vertical:getVerticalSize( 26)),
                  child: SafeArea(
                    child: Stack(
                      children: [
                        Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row( mainAxisAlignment : MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(Icons.arrow_back, color: ColorConstant.primaryWhite,),
                                InkWell(
                                  // onTap: (){ Get.toNamed(AppRoutes.cardDetailScreen);
                                  // },
                                  child: Image.asset('asset/icons/notification_icon.png',
                                    height: getVerticalSize(20),width: getHorizontalSize(16),),
                                )],
                            ),
                            SizedBox(height: getVerticalSize(44),),
                            Row( mainAxisAlignment : MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image.asset('asset/bank_image.png',
                                      height: getVerticalSize(21),width: getHorizontalSize(21),),
                                    SizedBox(width: getHorizontalSize(11),),
                                    Text("ABC Bank ",style: AppStyle.textStylePoppinsRegular
                                        .copyWith(color: ColorConstant.primaryWhite,
                                        fontWeight: FontWeight.w700,fontSize: getFontSize(20)),),
                                  ],
                                ),                                InkWell(
                                  // onTap: (){ Get.toNamed(AppRoutes.cardDetailScreen);
                                  // },
                                  child: Stack(clipBehavior: Clip.none,
                                    children: [
                                      ClipRRect(borderRadius: BorderRadius.circular(100),
                                        child: Container(
                                          // height: getVerticalSize(30.8),width: getHorizontalSize(30.8),
                                          color: ColorConstant.primaryWhite,
                                          child: Padding(
                                            padding: const EdgeInsets.all(0.5),
                                            child: ClipRRect(borderRadius: BorderRadius.circular(100),
                                              child: Image.asset('asset/card_image.png',fit: BoxFit.cover,
                                                height: getVerticalSize(30.8),width: getHorizontalSize(30.8),),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(left: -3,top: 15,
                                        child: Container(
                                          height: getVerticalSize(8),width: getHorizontalSize(8),
                                          decoration: BoxDecoration(
                                              color: Colors.green,
                                              borderRadius: BorderRadius.circular(100)),),
                                      )
                                    ],
                                  ),
                                )],
                            ),

                            SizedBox(height: getVerticalSize(85),),
                            Center(
                              child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text('\$10.00'.toString(),
                                      style: AppStyle.textStylePoppinsRegular
                                          .copyWith(color: ColorConstant.skyE8,
                                          fontWeight: FontWeight.w500,fontSize: getFontSize(60))),
                                  Text('cash Balance',
                                      style: AppStyle.textStylePoppinsRegular
                                          .copyWith(color: ColorConstant.primaryAppTextF1,
                                          fontWeight: FontWeight.w400,fontSize: getFontSize(18))),

                                ],
                              ),
                            ),
                            SizedBox(height: getVerticalSize(67),),

                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: getHorizontalSize(35)),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('014 251 339'.toString(),
                                                style: AppStyle.textStylePoppinsRegular
                                                    .copyWith(color: ColorConstant.primaryWhite,
                                                    fontWeight: FontWeight.w500,fontSize: getFontSize(22))),

                                            Text('Routing number',
                                                style: AppStyle.textStylePoppinsRegular
                                                    .copyWith(color: ColorConstant.primaryAppTextF1,
                                                    fontWeight: FontWeight.w400,fontSize: getFontSize(14))),
                                            SizedBox(height: getVerticalSize(40.5),),

                                            SizedBox(
                                              height: getVerticalSize(45),
                                              child: AppElevatedButton(buttonName: 'Add Cash',
                                                  textColor: ColorConstant.grey77,
                                                fontWeight: FontWeight.w400,

                                                onPressed: () {
                                                Get.toNamed(AppRoutes.accountDetailListScreen);
                                              },),
                                            ),

                                            ],
                                        ),
                                      ),
                                      SizedBox(width: getHorizontalSize(70),),
                                      Expanded(
                                        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('88 **** ****'.toString(),
                                                style: AppStyle.textStylePoppinsRegular
                                                    .copyWith(color: ColorConstant.primaryWhite,
                                                    fontWeight: FontWeight.w500,fontSize: getFontSize(22))),

                                            Text('Account number',
                                                style: AppStyle.textStylePoppinsRegular
                                                    .copyWith(color: ColorConstant.primaryAppTextF1,
                                                    fontWeight: FontWeight.w400,fontSize: getFontSize(14))),
                                            SizedBox(height: getVerticalSize(40.5),),

                                            SizedBox(
                                              height: getVerticalSize(45),
                                              child: AppElevatedButton(buttonName: 'Cash Out ',
                                               textColor: ColorConstant.grey77,
                                                fontWeight: FontWeight.w400,
                                                onPressed: () {
                                                Get.toNamed(AppRoutes.accountDetailListScreen);
                                              },),
                                            ),

                                             ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),


                          ],
                        ),
                      ],
                    ),
                  ),
                ) ),
          ],
        ));
  }
}
