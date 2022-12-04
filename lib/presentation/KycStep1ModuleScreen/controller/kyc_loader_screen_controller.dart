import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../ApiServices/network_info.dart';
import '../../../App Configurations/color_constants.dart';
import '../../../Custom Widgets/app_ElevatedButton .dart';
import '../../../routes/app_routes.dart';
import '../../../theme/app_style.dart';
import '../../../utils/HelperFiles/math_utils.dart';
import 'kyc_step1_screen_controller.dart';

class KycLoaderController extends GetxController {
  var kycStep1Controller = Get.find<KycStep1ScreenController>();
  var arguments = Get.arguments;
  var apiType = 0.obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onInit() {
    getArguments();
    if (apiType.value == 1) {
      kycStep1Controller.onClickOfSubmitIdButton();
    } else if (apiType.value == 2) {
      kycStep1Controller.onClickOfSubmitPassButton();
    } else if (apiType.value == 3) {
      kycStep1Controller.onClickOfSubmitStep2Button();
    }

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getArguments() {
    if (arguments != null) {
      apiType.value = arguments['API_TYPE'];
    }
  }

  Future<dynamic> showKycDialouge() async {
    return Get.dialog(
      Padding(
        padding: const EdgeInsets.all(18.0),
        child: Center(
          child: Material(
            color: Colors.transparent,
            child: Wrap(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: ColorConstant.primaryWhite,
                      borderRadius: const BorderRadius.all(Radius.circular(8))),
                  margin: const EdgeInsets.only(bottom: 20),
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 15, bottom: 20),
                  constraints: const BoxConstraints(minWidth: 200),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "KYC",
                            style:
                            AppStyle.DmSansFont.copyWith(fontSize: 22),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: Text(
                            "Please Complete KYC Level 2",
                            textAlign: TextAlign.start,
                            style: AppStyle.DmSansFont
                                .copyWith(fontSize: 18),
                          )),
                      const SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 50,width:  getHorizontalSize(150),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: AppElevatedButton(buttonName: 'May be later',
                                buttonColor: ColorConstant.primaryDarkGreen,
                                onPressed: () {
                                  Get.back();
                                  Get.offAllNamed(AppRoutes.dashBoardScreen,
                                      arguments: {"bottomTabCount": 0});
                                },),
                            ),
                          ),

                          SizedBox(
                            width: 8,
                          ),
                          Container(
                            height: 50,width: getHorizontalSize(150),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: AppElevatedButton(buttonName: 'Okay',
                                buttonColor: ColorConstant.primaryDarkGreen,
                                onPressed: () {
                                  Get.back();
                                },),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      barrierDismissible: true,
    );
  }
}
