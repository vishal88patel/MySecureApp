import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:secureapp/App%20Configurations/color_constants.dart';
import 'package:secureapp/Custom%20Widgets/app_ElevatedButton%20.dart';
import 'package:secureapp/Custom%20Widgets/app_textField.dart';
import 'package:secureapp/presentation/ScanScreen/scan_success_screen.dart';
import 'package:secureapp/routes/app_routes.dart';
import 'package:secureapp/theme/app_style.dart';
import 'package:secureapp/utils/HelperFiles/math_utils.dart';

import 'controller/scan_screen_controller.dart';

class ScanPasswordScreen extends StatelessWidget {
  var scanController = Get.put(ScanScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstant.backgroundColor,
        body: SingleChildScrollView(
            child: Container(
                height: size.height,
                child: Stack(
                  children: [
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: getHorizontalSize(20)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: getVerticalSize(52),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: (){
                                  Get.back();
                                },
                                child: Container(
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),
                                      border: Border.all(color: ColorConstant.backBorder)),
                                  padding: EdgeInsets.all(10),
                                  child: Icon(Icons.arrow_back_ios_new_outlined,size: getVerticalSize(18),),
                                ),
                              ),
                              Text(
                                "Confirm Password",
                                style: AppStyle.DmSansFont.copyWith(
                                    color: ColorConstant.naturalBlack,
                                    fontWeight: FontWeight.w700,
                                    fontSize: getFontSize(24)),
                              ),
                              Container(
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),
                                    border: Border.all(color: Colors.transparent)),
                                padding: EdgeInsets.all(10),
                                child: Icon(Icons.arrow_back_ios_new_outlined,color: Colors.transparent,),
                              ),                      ],
                          ),
                          SizedBox(
                            height: getVerticalSize(28),
                          ),
                          Text(
                            "Please input your password before continuing payment",
                            style: AppStyle.DmSansFont.copyWith(
                                color: ColorConstant.naturalGrey,
                                fontWeight: FontWeight.w400,
                                fontSize: getFontSize(22)),
                          ),
                          SizedBox(
                            height: getVerticalSize(54),
                          ),
                          Obx(
                                () => AppTextField(
                              hintText: 'Password ',
                              controller:
                              scanController.passController,
                              maxLength: 4,
                              isObsecure:
                              scanController.passIsObsecure.value,
                              suffixIcon: IconButton(
                                icon: Icon(scanController
                                    .passIsObsecure.value
                                    ? Icons.visibility_off
                                    : Icons.visibility
                                  // Icons.visibility_off,
                                ),
                                color: ColorConstant.naturalGrey3,
                                iconSize: getSize(24),
                                onPressed: () {
                                  scanController.onTapOfPassObsecure(
                                      scanController.passIsObsecure.value);
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            height: getVerticalSize(6),
                          ),
                          Text(
                            "Must be 4 characters.",
                            style: AppStyle.DmSansFont.copyWith(
                                color: ColorConstant.naturalGrey,
                                fontWeight: FontWeight.w400,
                                fontSize: getFontSize(18)),
                          ),
                          Spacer(),
                          AppElevatedButton(
                            buttonName: "Confirm Password",
                            textColor: Colors.white,
                            buttonColor: ColorConstant.primaryLightGreen,
                            radius: 16,
                            onPressed: () {
                              scanController.callTransactionApi();

                            },
                          ),
                          SizedBox(
                            height: getVerticalSize(36),
                          ),
                        ],
                      ),
                    ),
                  ],
                ))));



  }
}
