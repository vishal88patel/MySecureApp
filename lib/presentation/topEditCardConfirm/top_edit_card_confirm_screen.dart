import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:my_secure_app/App%20Configurations/image_constants.dart';
import 'package:my_secure_app/Custom%20Widgets/app_AppBar%20.dart';
import 'package:my_secure_app/Custom%20Widgets/app_ElevatedButton%20.dart';
import 'package:my_secure_app/Custom%20Widgets/app_textField.dart';
import 'package:my_secure_app/presentation/widget/select_mode_widget.dart';
import 'package:my_secure_app/routes/app_routes.dart';
import 'package:my_secure_app/theme/app_style.dart';

import '../../App Configurations/color_constants.dart';
import '../../utils/ConstantsFiles/string_constants.dart';
import '../../utils/HelperFiles/math_utils.dart';
import '../../utils/HelperFiles/pref_utils.dart';
import '../topAddCard1/controller/top_add_card1_screen_controller.dart';
import 'controller/top_edit_card_confirm_screen_controller.dart';

class TopEditCardConfirmScreen extends StatelessWidget {
  var topAddCardConfirmScreenController = Get.find<TopEditCardConfirmController>();

  @override
  Widget build(BuildContext context) {
    // PrefUtils.setString(StringConstants.IS_KYC_DONE,"1");
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
                height: size.height,
                child: Stack(
                  children: [
                    Image.asset('asset/icons/background_image.png',
                        fit: BoxFit.cover,width: double.infinity),
                    SafeArea(
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Column( crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              AppAppBar(
                                title: "Confirm Your Card",
                                icon1: "asset/icons/ic_back.svg",
                                icon2: "asset/icons/ic_notification.svg",
                                onPressedIcon1: () {
                                  Get.back();
                                },
                                onPressedIcon2: () {
                                  Get.toNamed(AppRoutes.notificationScreen);
                                },
                              ),

                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: getHorizontalSize(20)),
                                child: Text(
                                  "Scan completed, now verify your data",
                                  style: AppStyle.textStyleDMSANS.copyWith(
                                      color: ColorConstant.naturalGrey,
                                      fontWeight:FontWeight.w400,
                                      fontSize:getFontSize(22)),
                                ),
                              ),


                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: getVerticalSize(200)),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: ColorConstant.primaryWhite,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(32),
                                    topRight: Radius.circular(32),
                                  )
                              ),child: Column(
                              children: [
                                SizedBox(height: getVerticalSize(20),),
                                Container(
                                  height: getVerticalSize(7),
                                  width: getHorizontalSize(60),
                                  decoration: BoxDecoration(
                                      color: ColorConstant.greyBD,
                                      borderRadius: BorderRadius.circular(50)
                                  ),
                                ),
                                SizedBox(height: getVerticalSize(20),),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: getHorizontalSize(20)),
                                  child: Card(
                                    margin: const EdgeInsets.symmetric(horizontal: 0),
                                    color: ColorConstant.naturalGrey2,
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(16)
                                    ),
                                    child: Column(
                                      children: [
                                        Container(
                                          child: Padding(
                                            padding:  EdgeInsets.only(left: getHorizontalSize(20),
                                                right: getHorizontalSize(20),top: getVerticalSize(20)),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Text(
                                                      "",
                                                      style: AppStyle.textStyleDMSANS.copyWith(
                                                          color: ColorConstant.primaryWhite,
                                                          fontWeight: FontWeight.w500,
                                                          fontSize: getFontSize(18)),
                                                    ),
                                                    SvgPicture.asset(
                                                      "asset/icons/ic_card_ring.svg",
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ],
                                                ),

                                                SizedBox(height: getHorizontalSize(30),),
                                                Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                      "asset/icons/ic_chip_grey.svg",
                                                      fit: BoxFit.fill,
                                                    ),
                                                    SizedBox(width: getHorizontalSize(12),),
                                                    Text(
                                                      topAddCardConfirmScreenController.cardNumberController.text,
                                                      style: AppStyle.textStyleDMSANS.copyWith(
                                                          color: ColorConstant.grey8F,
                                                          fontWeight: FontWeight.w500,
                                                          fontSize: getFontSize(20)),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: getVerticalSize(40),),
                                                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Text(
                                                      topAddCardConfirmScreenController.nameController.text,
                                                      style: AppStyle.textStyleDMSANS.copyWith(
                                                          color: ColorConstant.grey8F,
                                                          fontWeight: FontWeight.w500,
                                                          fontSize: getFontSize(20)),
                                                    ),
                                                    Text(
                                                      topAddCardConfirmScreenController.expDateController.text,
                                                      style: AppStyle.textStyleDMSANS.copyWith(
                                                          color: ColorConstant.grey8F,
                                                          fontWeight: FontWeight.w500,
                                                          fontSize: getFontSize(20)),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: getVerticalSize(40),),

                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: getVerticalSize(20),),
                                Padding(
                                  padding: EdgeInsets.only(right: getHorizontalSize(20)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      InkWell(
                                        onTap: (){
                                          FocusManager.instance.primaryFocus
                                              ?.unfocus();
                                          if(topAddCardConfirmScreenController.readOnly.value==true){
                                            topAddCardConfirmScreenController.readOnly.value=false;
                                          }else{
                                            topAddCardConfirmScreenController.readOnly.value=true;
                                          }
                                        },
                                        child: Obx(()=>
                                              Container(
                                                height: getHorizontalSize(40),
                                                decoration: BoxDecoration(
                                                  color: ColorConstant.primaryLightGreen,
                                                  borderRadius: BorderRadius.circular(12),
                                                ),
                                                child: Padding(
                                                  padding:  EdgeInsets.only(left: getHorizontalSize(10),right: getHorizontalSize(10)),
                                                  child:topAddCardConfirmScreenController.readOnly.value?Row(
                                                    children: [
                                                      Icon(Icons.edit,size: 14,color: Colors.white,),
                                                      SizedBox(width: getHorizontalSize(6),),
                                                      Text(
                                                        "Edit",
                                                        style: AppStyle.textStyleDMSANS.copyWith(
                                                            color: ColorConstant.primaryWhite,
                                                            fontWeight: FontWeight.w500,
                                                            fontSize: getFontSize(18)),
                                                      ),
                                                    ],
                                                  ):Icon(Icons.close,size: 20,color: Colors.white,),
                                                ),
                                              ),
                                          ),
                                      ),
                                    ],
                                  ),
                                ),
                                Obx(()=>
                                   Padding(
                                    padding:  EdgeInsets.symmetric(horizontal: getHorizontalSize(20)),
                                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        AppTextField(fontSize: 18,
                                          controller: topAddCardConfirmScreenController.nameController,
                                          readOnly: topAddCardConfirmScreenController.readOnly.value,
                                          hintText: 'Cardholder Name',),
                                        SizedBox(height: getVerticalSize(20),),
                                        AppTextField(fontSize: 18,
                                          controller: topAddCardConfirmScreenController.cardNumberController,
                                          readOnly: topAddCardConfirmScreenController.readOnly.value,
                                          hintText: 'Card Number',),
                                        SizedBox(height: getVerticalSize(20),),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: AppTextField(fontSize: 18,
                                                controller: topAddCardConfirmScreenController.expDateController,
                                                readOnly: topAddCardConfirmScreenController.readOnly.value,
                                                hintText: 'Expiry Date',),
                                            ),
                                            SizedBox(width: getHorizontalSize(10),),
                                            Expanded(
                                              child: AppTextField(fontSize: 18,
                                                controller: topAddCardConfirmScreenController.cvvController,
                                                readOnly: topAddCardConfirmScreenController.readOnly.value,
                                                hintText: '3-digit CVV',),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: getVerticalSize(60),),
                                        AppElevatedButton(
                                            buttonName: 'Confirm',
                                            textColor: ColorConstant.primaryWhite,
                                            onPressed: () {
                                              Get.toNamed(AppRoutes.cardLoaderScreen);
                                             // Get.toNamed(AppRoutes.topAddCardConfirmScreen);
                                              // Get.to(
                                              //   LoaderScreen("",AppRoutes.creatPasswordScreen),
                                              //   transition: Transition.rightToLeft,
                                              //   duration: Duration(milliseconds: 400),
                                              // );
                                            }),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ))));
  }
}
