import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:secure_cash_app/presentation/RequestMoneyScreen/controller/request_money_screen_controller.dart';
import 'package:secure_cash_app/utils/HelperFiles/math_utils.dart';

import '../../App Configurations/color_constants.dart';
import '../../Custom Widgets/app_ElevatedButton .dart';
import '../../Custom Widgets/appbar_image_1.dart';
import '../../Custom Widgets/common_image_view.dart';
import '../../routes/app_routes.dart';
import '../../theme/app_style.dart';

class RequestSuccessScreen extends StatelessWidget {
  var requestController = Get.find<RequestMoneyScreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.darkGrey,
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: 200,
              ),

              Container(
                width: size.width,
                child: SingleChildScrollView(
                  child: Container(
                    height: getVerticalSize(
                      500.00,
                    ),
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: CommonImageView(
                            svgPath: "asset/icons/img_success_bg.svg",
                            height: getVerticalSize(
                              500.00,
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
                                  ),
                                  child: CommonImageView(
                                    svgPath: "asset/icons/img_checkmark.svg",
                                    height: getSize(
                                      100.00,
                                    ),
                                    width: getSize(
                                      100.00,
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    left: 64,
                                    top: 16,
                                    right: 64,
                                  ),
                                  child: Text(
                                    "Request Confirm",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.DmSansFont.copyWith(
                                        color: ColorConstant.primaryBlack,
                                        fontSize: getFontSize(28),
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(left: 28, right: 28, top: 10),
                                  child:
                                     Obx(()=>
                                       Text(
                                        "\$"+requestController.amountCtrl.text+" has been requested to "+requestController.name.value,
                                        textAlign: TextAlign.center,
                                        style: AppStyle.DmSansFont.copyWith(
                                            color: ColorConstant.greyTextColor,
                                            fontSize: getFontSize(20),
                                            fontWeight: FontWeight.bold),
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
                              SizedBox(height: 14,),
                              Padding(
                                padding: const EdgeInsets.only(left: 40.0,right: 40,top: 12),
                                child: AppElevatedButton(
                                  buttonName: "Home",
                                  textColor: Colors.white,
                                  buttonColor: ColorConstant.primaryLightGreen,
                                  radius: 16,
                                  onPressed: () {
                                    Get.offAllNamed(AppRoutes.dashBoardScreen,
                                        arguments: {"bottomTabCount": 0});
                                  },
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
