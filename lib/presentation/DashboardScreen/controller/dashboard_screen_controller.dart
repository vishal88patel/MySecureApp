import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:my_secure_app/App%20Configurations/color_constants.dart';
import 'package:my_secure_app/Custom%20Widgets/app_ElevatedButton%20.dart';
import 'package:my_secure_app/theme/app_style.dart';
import 'package:my_secure_app/utils/ConstantsFiles/string_constants.dart';
import 'package:my_secure_app/utils/HelperFiles/math_utils.dart';
import 'package:my_secure_app/utils/HelperFiles/ui_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../ApiServices/network_info.dart';
import '../../../routes/app_routes.dart';



class DashBoarScreenController extends GetxController {
  var selectedIndex = 0.obs;
  var arguments = Get.arguments;
  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onInit() {
    getArguments();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void onTapOfBottomnavigation(int value) {
    selectedIndex.value=value;

  }
  DateTime? currentBackPressTime;


  void getArguments() {
    if (arguments != null) {
      selectedIndex.value = arguments['bottomTabCount'] ?? 0;
    }
  }
  Future<bool> showLogOutDialouge() async {
    return await Get.dialog(
      Padding(
        padding: EdgeInsets.symmetric(horizontal: getHorizontalSize(40)),
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
                            "Exit App",
                            style:
                            AppStyle.textStylePoppinsRegular.copyWith(fontSize: 22,color: ColorConstant.darkBlue),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: Text(
                            "Are you sure,\n you want to exit?",
                            textAlign: TextAlign.center,
                            style: AppStyle.textStylePoppinsRegular
                                .copyWith(fontSize: 18,color: ColorConstant.darkBlue),

                          )),
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: AppElevatedButton(buttonName: 'NO',
                              radius: 5,
                              buttonColor: ColorConstant.skyE8,
                              onPressed: () {

                                Get.back();
                              },),
                          ),

                          SizedBox(
                            width: 8,
                          ),
                          Expanded(
                            child: AppElevatedButton(buttonName: 'YES',
                              buttonColor: ColorConstant.skyE8,
                              radius: 5,
                              onPressed: () {
                                exit(0);
                              },),
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
/*
  Future<bool> onWillPop() {
    showLogOutDialouge();
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      // UIUtils.showSnakBar(
      //     bodyText: 'Do you want to exit an MySecureApp', headerText: StringConstants.ERROR);
      return Future.value(false);
    }
    return Future.value(true);
  }*/


}

