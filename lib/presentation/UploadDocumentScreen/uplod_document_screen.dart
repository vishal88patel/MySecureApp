import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_secure_app/App%20Configurations/color_constants.dart';
import 'package:my_secure_app/Custom%20Widgets/app_ElevatedButton%20.dart';
import 'package:my_secure_app/Custom%20Widgets/app_textField.dart';
import 'package:my_secure_app/Custom%20Widgets/main_custom_background.dart';
import 'package:my_secure_app/Custom%20Widgets/profile_widget.dart';
import 'package:my_secure_app/routes/app_routes.dart';
import 'package:my_secure_app/theme/app_style.dart';
import 'package:my_secure_app/utils/HelperFiles/math_utils.dart';

import 'controller/uplod_document_screen_controller.dart';

class UploadDocumentScreen extends StatelessWidget {
  var profileController = Get.find<UploadDocumentScreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: MainCutomBackGround(
            child: Padding(padding: EdgeInsets.symmetric(
                horizontal: getHorizontalSize(20.0),vertical:getVerticalSize( 26)),
              child: SafeArea(
                child: Stack(
                  children: [
                    Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.arrow_back, color: ColorConstant.primaryWhite,),
                        SizedBox(height: getVerticalSize(27),),
                        Center(
                          child: ClipRRect(borderRadius: BorderRadius.circular(100),
                            child: Container(
                              // height: getVerticalSize(30.8),width: getHorizontalSize(30.8),
                              color: ColorConstant.skyE8,
                              child: Padding(
                                padding: const EdgeInsets.all(1.8),
                                child: ClipRRect(borderRadius: BorderRadius.circular(100),
                                  child: Image.asset('asset/account_backgraund_image.png',fit: BoxFit.cover,
                                    height: getVerticalSize(73),width: getHorizontalSize(73),),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: getVerticalSize(15),),
                        Center(
                          child: Text("Hello Smith",
                            style: AppStyle.textStylePoppinsRegular
                                .copyWith(color: ColorConstant.primaryWhite,
                                fontWeight: FontWeight.w600,fontSize: getFontSize(24)),),
                        ),
                        SizedBox(height: getVerticalSize(54),),
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: getHorizontalSize(20)),
                          child: DottedBorder(
                              color: ColorConstant.primaryWhite,
                              strokeWidth: 1,
                              borderType: BorderType.Rect,
                              
                              radius: Radius.circular(100),
                              child: Container(
                                height: getVerticalSize(115),
                                width: size.width,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset('asset/licences_image.png',height: getVerticalSize(30),
                                      width: getHorizontalSize(30),),
                                    SizedBox(                                height: getVerticalSize(10),
                                    ),
                                    Text("Upload your Driving Licence",
                                      style: AppStyle.textStylePoppinsRegular
                                          .copyWith(color: ColorConstant.primaryWhite,
                                          fontWeight: FontWeight.w500,fontSize: getFontSize(18)),),
                                  ],
                                ),
                              ) ),
                        ),
                        SizedBox(height: getVerticalSize(20),),
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: getHorizontalSize(20)),
                          child: DottedBorder(
                              color: ColorConstant.primaryWhite,
                              strokeWidth: 1,
                              borderType: BorderType.Rect,

                              radius: Radius.circular(100),
                              child: Container(
                                height: getVerticalSize(115),
                                width: size.width,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset('asset/add_photo_image.png',height: getVerticalSize(30),
                                      width: getHorizontalSize(30),),
                                    SizedBox(                                height: getVerticalSize(10),
                                    ),
                                    Text("Upload your Photo ",
                                      style: AppStyle.textStylePoppinsRegular
                                          .copyWith(color: ColorConstant.primaryWhite,
                                          fontWeight: FontWeight.w500,fontSize: getFontSize(18)),),
                                  ],
                                ),
                              ) ),
                        ),
                        SizedBox(height: getVerticalSize(20),),
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: getHorizontalSize(20)),
                          child: DottedBorder(
                              color: ColorConstant.primaryWhite,
                              strokeWidth: 1,
                              borderType: BorderType.Rect,

                              radius: Radius.circular(100),
                              child: Container(
                                height: getVerticalSize(115),
                                width: size.width,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset('asset/doller_image.png',height: getVerticalSize(30),
                                      width: getHorizontalSize(30),),
                                    SizedBox(                                height: getVerticalSize(10),
                                    ),
                                    Text("Upload your Proof of income",
                                      style: AppStyle.textStylePoppinsRegular
                                          .copyWith(color: ColorConstant.primaryWhite,
                                          fontWeight: FontWeight.w500,fontSize: getFontSize(18)),),
                                  ],
                                ),
                              ) ),
                        ),


                        Spacer(),
                        AppElevatedButton(buttonName: 'Signout', onPressed: () {
                          Get.toNamed(AppRoutes.transactionScreen);

                        },),
                        SizedBox(height: getVerticalSize(36),),
                        Center(child: Container(height: getVerticalSize(4),
                          width: getHorizontalSize(106),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: ColorConstant.primaryAppTextF1),))

                      ],
                    ),
                  ],
                ),
              ),
            ) ));
  }
}
