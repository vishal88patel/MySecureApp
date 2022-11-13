import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:my_secure_app/App%20Configurations/color_constants.dart';
import 'package:my_secure_app/Custom%20Widgets/app_ElevatedButton%20.dart';
import 'package:my_secure_app/Custom%20Widgets/app_textField.dart';
import 'package:my_secure_app/Custom%20Widgets/app_textFormField_fill.dart';
import 'package:my_secure_app/Custom%20Widgets/main_custom_background.dart';
import 'package:my_secure_app/presentation/CardDetailScreen/controller/card_detail_screen_controller.dart';
import 'package:my_secure_app/presentation/PersonalDetails/controller/personal_detail_screen_controller.dart';
import 'package:my_secure_app/routes/app_routes.dart';
import 'package:my_secure_app/theme/app_style.dart';
import 'package:my_secure_app/utils/HelperFiles/math_utils.dart';

import '../CameraView2.dart';

class CardDetailScreen extends StatelessWidget {
  var cardDetailController = Get.find<CardScreenController>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: size.height,
            child: MainCutomBackGround(
                child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getHorizontalSize(25.0),
                  vertical: getVerticalSize(26)),
              child: SafeArea(
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.arrow_back,
                              color: ColorConstant.primaryWhite,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: getVerticalSize(25),
                        ),
                        Text(
                          "Add card details to link an account",
                          style: AppStyle.textStylePoppinsRegular.copyWith(
                              color: ColorConstant.primaryWhite,
                              fontWeight: FontWeight.w600,
                              fontSize: getFontSize(26)),
                        ),
                        SizedBox(
                          height: getVerticalSize(26),
                        ),
                        AppTextField(
                          hintText: 'Card holder name*',
                          controller: cardDetailController.nameController,
                        ),
                        SizedBox(
                          height: getVerticalSize(20),
                        ),
                        AppTextField(
                          keyBordType: TextInputType.number,
                          hintText: 'Card number*',
                          controller: cardDetailController.cardNumberController,
                        ),
                        SizedBox(
                          height: getVerticalSize(20),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: AppTextField(
                                keyBordType: TextInputType.text,
                                hintText: 'Exp month & year*',
                                controller: cardDetailController.expDateController,
                              ),
                                width:MediaQuery.of(context).size.width/2.5
                            ),
                            SizedBox(
                              width: getHorizontalSize(15),
                            ),
                            Container(
                              width:MediaQuery.of(context).size.width/2.5,
                              child: AppTextField(
                                keyBordType: TextInputType.number,
                                hintText: 'CVV*',
                                controller: cardDetailController.cvvController,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: getVerticalSize(18),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.lock,
                              size: 20,
                              color: ColorConstant.primaryAppTextF1,
                            ),
                            SizedBox(
                              width: getVerticalSize(6),
                            ),
                            Text('Secured with 256-bit encryption',
                                style: AppStyle.textStylePoppinsRegular.copyWith(
                                    color: ColorConstant.primaryAppTextF1,
                                    fontWeight: FontWeight.w400,
                                    fontSize: getFontSize(16))),
                          ],
                        ),
                        SizedBox(
                          height: getVerticalSize(28),
                        ),
                        Text(
                          "Scan card",
                          style: AppStyle.textStylePoppinsRegular.copyWith(
                              color: ColorConstant.primaryWhite,
                              fontWeight: FontWeight.w600,
                              fontSize: getFontSize(26)),
                        ),
                        SizedBox(
                          height: getVerticalSize(26),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                InkWell(
                                  onTap: (){
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const CameraScreen2(image: 1,)),
                                    );
                                  },
                                  child: Obx(()=>
                                      DottedBorder(
                                          color:ColorConstant.primaryWhite,
                                          strokeWidth: 1,
                                          borderType: BorderType.Rect,
                                          radius: Radius.circular(100),
                                          child: cardDetailController
                                              .netImage1.value.isNotEmpty
                                              ? Container(
                                            height: getVerticalSize(100),
                                            width: size.width / 2.7,
                                            child: Image.file(
                                              File(cardDetailController
                                                  .netImage1.value),
                                              fit: BoxFit.cover,
                                            ),
                                          )
                                              : Container(
                                            height: getVerticalSize(100),
                                            width: size.width / 2.7,
                                            child: Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              children: [
                                                Image.asset(
                                                  'asset/camera.png',
                                                  color:
                                                  Colors.white.withOpacity(0.5),
                                                  height: getVerticalSize(50),
                                                  width: getHorizontalSize(50),
                                                ),
                                              ],
                                            ),
                                          )),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: getVerticalSize(10)),
                                  child: Text(
                                    "Front",
                                    style: AppStyle.textStylePoppinsRegular.copyWith(
                                        color: ColorConstant.primaryWhite,
                                        fontWeight: FontWeight.w500,
                                        fontSize: getFontSize(20)),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                InkWell(
                                  onTap: (){
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const CameraScreen2(image: 2,)),
                                    );
                                  },
                                  child: Obx(()=>
                                      DottedBorder(
                                          color: ColorConstant.primaryWhite,
                                          strokeWidth: 1,
                                          borderType: BorderType.Rect,
                                          radius: Radius.circular(100),
                                          child: cardDetailController
                                              .netImage2.value.isNotEmpty
                                              ? Container(
                                            height: getVerticalSize(100),
                                            width: size.width / 2.7,
                                            child: Image.file(
                                              File(cardDetailController
                                                  .netImage2.value),
                                              fit: BoxFit.cover,
                                            ),
                                          )
                                              : Container(
                                            height: getVerticalSize(100),
                                            width: size.width / 2.7,
                                            child: Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              children: [
                                                Image.asset(
                                                  'asset/camera.png',
                                                  color:
                                                  Colors.white.withOpacity(0.5),
                                                  height: getVerticalSize(50),
                                                  width: getHorizontalSize(50),
                                                ),
                                              ],
                                            ),
                                          )),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: getVerticalSize(10)),
                                  child: Text(
                                    "Back",
                                    style: AppStyle.textStylePoppinsRegular.copyWith(
                                        color: ColorConstant.primaryWhite,
                                        fontWeight: FontWeight.w500,
                                        fontSize: getFontSize(20)),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Spacer(),
                        AppElevatedButton(
                          buttonName: 'Next',
                          onPressed: () {
                            cardDetailController.onClickOfAddCardButton();
                          },
                        ),
                        SizedBox(
                          height: getVerticalSize(36),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )),
          ),
        ));
  }
}
