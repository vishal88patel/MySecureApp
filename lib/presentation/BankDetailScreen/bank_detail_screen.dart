import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
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

import '../PinScreen/controller/pin_screen_controller.dart';

class BankDetailScreen extends StatelessWidget {
  var bankDetailController = Get.find<BankDetailScreenController>();
  var pinScreenController = Get.find<PinScreenController>();
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
                            SizedBox(height: getVerticalSize(44),),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: ColorConstant.blue26,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(24)),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Obx(
                                              () => ClipRRect(
                                            borderRadius: BorderRadius.circular(50),
                                            child: Image.network(
                                              pinScreenController.profile_pic.value,
                                              height: getVerticalSize(60),
                                              width: getVerticalSize(60),
                                              loadingBuilder: (BuildContext context,
                                                  Widget child,
                                                  ImageChunkEvent? loadingProgress) {
                                                if (loadingProgress == null) return child;
                                                return Center(
                                                  child: CircularProgressIndicator(
                                                    value: loadingProgress
                                                        .expectedTotalBytes !=
                                                        null
                                                        ? loadingProgress
                                                        .cumulativeBytesLoaded /
                                                        loadingProgress
                                                            .expectedTotalBytes!
                                                        : null,
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 14.0),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Obx(
                                                    () => Text(pinScreenController.name.value,
                                                    style: AppStyle.textStylePoppinsRegular
                                                        .copyWith(
                                                        color: ColorConstant.primaryWhite,
                                                        fontWeight: FontWeight.w600,
                                                        fontSize: getFontSize(18))),
                                              ),
                                              Obx(
                                                    () => Text(pinScreenController.email.value,
                                                    style: AppStyle.textStylePoppinsRegular
                                                        .copyWith(
                                                        color: ColorConstant.lightText,
                                                        fontWeight: FontWeight.w400,
                                                        fontSize: getFontSize(18))),
                                              ),
                                            ],
                                          ),
                                        )
                                      ]),
                                ),
                              ),
                            ),
                            SizedBox(height: getVerticalSize(50),),
                            Center(
                              child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Obx(()=>
                                      Text('\$ ${pinScreenController.amount.value}'.toString(),
                                          style: AppStyle.textStylePoppinsRegular
                                              .copyWith(color: ColorConstant.skyE8,
                                              fontWeight: FontWeight.w500,fontSize: getFontSize(60))),
                                  ),
                                  Lottie.asset('asset/animations/98621-success-status.json',
                                     height: getVerticalSize(200)),


                                   Text('My SecureApp transaction for',
                                      style: AppStyle.textStylePoppinsRegular
                                          .copyWith(color: ColorConstant.primaryWhite,
                                          fontWeight: FontWeight.w400,fontSize: getFontSize(22)),textAlign: TextAlign.center,),
                                  Text(
                                      '\$ ${pinScreenController.amount.value} '
                                    ,
                                    style: AppStyle.textStylePoppinsRegular
                                        .copyWith(color: ColorConstant.skyE8,
                                        fontWeight: FontWeight.bold,fontSize: getFontSize(30)),textAlign: TextAlign.center,),
                                  Text(

                                      'initiated successfully ',
                                    style: AppStyle.textStylePoppinsRegular
                                        .copyWith(color: ColorConstant.primaryWhite,
                                        fontWeight: FontWeight.w400,fontSize: getFontSize(22)),textAlign: TextAlign.center,),
                                ],
                              ),
                            ),
                            SizedBox(height: getVerticalSize(67),),
                            Spacer(),
                            InkWell(
                              onTap:() {
                                Get.offAllNamed(AppRoutes.dashBoardScreen,arguments: {"bottomTabCount":1});
                              },
                              child: Container(
                                height: MediaQuery.of(context).size.height/16,
                                decoration: BoxDecoration(
                                  color: ColorConstant.blue26,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10)
                                  ),

                                ),
                                child: Center(
                                  child: Text("Done",style: AppStyle.textStyleSFPRO.copyWith(
                                      color: ColorConstant.primaryWhite,
                                      fontWeight: FontWeight.w500,
                                      fontSize: getFontSize(18)),),
                                ),
                              ),
                            ),
                            SizedBox(height: getVerticalSize(32),),
                            /*Padding(
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
                            ),*/


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
