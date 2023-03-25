import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:secure_cash_app/theme/app_style.dart';
import 'package:secure_cash_app/utils/HelperFiles/math_utils.dart';
import '../../App Configurations/color_constants.dart';
import '../../Custom Widgets/app_ElevatedButton .dart';
import '../../Custom Widgets/common_image_view.dart';
import '../../routes/app_routes.dart';
import '../KycStep1ModuleScreen/controller/kyc_loader_screen_controller.dart';
import '../KycStep1ModuleScreen/selfie_screen.dart';
import 'controller/kyc_success2_screen_controller.dart';

class KycSuccess2Screen extends StatelessWidget {
  var kycSuccessController = Get.find<KycSuccess2ScreenController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: ColorConstant.buttonGreen.withOpacity(0.3),
            child: Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: size.width,
                  child: SingleChildScrollView(
                    child: Container(
                      height: getVerticalSize(
                        650.00,
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Align(
                            alignment: Alignment.topCenter,
                            child: CommonImageView(
                              svgPath: "asset/icons/img_subtract.svg",
                              height: getVerticalSize(
                                650.00,
                              ),
                              width: getHorizontalSize(
                                370.00,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      left: 64,
                                      right: 64,
                                      top:20
                                    ),
                                    child:Image.asset(
                                      "asset/icons/img_success_check.png",
                                      height: 100,
                                      width: 100,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      top: 32,
                                    ),
                                    child:Obx(()=> Text(
                                        kycSuccessController.type==1?"Successful!":"Pending",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.DmSansFont.copyWith(
                                            color: ColorConstant.naturalBlack,
                                            fontSize: getFontSize(28),
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding:
                                    EdgeInsets.only(left: 28, right: 28, top: 10),
                                    child:Obx(()=> Text(
                                        kycSuccessController.type==1?"Your Identity Verification Level - 1 is completed.":kycSuccessController.type==2?"Your Identity Verification Level - 1 is pending.":kycSuccessController.type==3?"Your Identity Verification Level - 2 is pending.":"Thank You",
                                        textAlign: TextAlign.center,
                                        style: AppStyle.DmSansFont.copyWith(
                                            color: ColorConstant.naturalGrey4,
                                            fontSize: getFontSize(20),
                                            fontWeight: FontWeight.normal),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 14,),
                                Align(
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 38.0, right: 38,top:32),
                                    child: DottedLine(
                                        dashColor: ColorConstant.greyTextColor),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      top: 14,
                                    ),
                                    child:Obx(()=> Text(
                                        kycSuccessController.type==1?"Congratulation!":"Thank You",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.DmSansFont.copyWith(
                                            color: ColorConstant.naturalBlack,
                                            fontSize: getFontSize(28),
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding:
                                    EdgeInsets.only(left: 40, right: 40, top: 6),
                                    child:Obx(()=>Text(
                                        kycSuccessController.type==1?"You have unlock Identity Verification Level - 2":"Your Identity Verification is under process",
                                        textAlign: TextAlign.center,
                                        style: AppStyle.DmSansFont.copyWith(
                                            color: ColorConstant.naturalGrey4,
                                            fontSize: getFontSize(20),
                                            fontWeight: FontWeight.normal),
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding:
                                    EdgeInsets.only(left: 40, right: 40, top: 14),
                                    child:Obx(()=> Text(
                                        kycSuccessController.type==1?"Unlock Level - 2":" ",
                                        textAlign: TextAlign.center,
                                        style: AppStyle.DmSansFont.copyWith(
                                            color: ColorConstant.naturalBlack,
                                            fontSize: getFontSize(20),
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 40.0,right: 40,top: 12),
                                  child: Obx(()=>
                                     AppElevatedButton(
                                      buttonName: kycSuccessController.type==1?"Yes":"Okay",
                                      textColor: Colors.white,
                                      buttonColor: ColorConstant.primaryLightGreen,
                                      radius: 16,
                                      onPressed: () {
                                        if(kycSuccessController.type==1){
                                          Get.to(()=>SelfieScreen(
                                            image: 5,
                                          ));
                                        }else{
                                          Get.offAllNamed(AppRoutes.dashBoardScreen,arguments: {"bottomTabCount":0});
                                        }
                                      },
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      left: 64,
                                      top: 18,
                                      right: 64,
                                    ),
                                    child:Obx(()=> InkWell(
                                        onTap: (){
                                          if(kycSuccessController.type==1){
                                            Get.offAllNamed(AppRoutes.dashBoardScreen,arguments: {"bottomTabCount":0});
                                          }else{
                                          }
                                        },
                                        child: Text(
                                          kycSuccessController.type==1?"Later":" ",
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.DmSansFont.copyWith(
                                              color: ColorConstant.primaryDarkGreen,
                                              fontSize: getFontSize(18),
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset('asset/animations/partyyy.json', height: 300,width: MediaQuery.of(context).size.width),
            ],
          ),
        ],
      ),
    );
  }
}

