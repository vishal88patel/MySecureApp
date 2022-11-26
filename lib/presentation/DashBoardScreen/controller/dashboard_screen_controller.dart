import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../App Configurations/color_constants.dart';
import '../../../Custom Widgets/app_ElevatedButton .dart';
import '../../../routes/app_routes.dart';
import '../../../theme/app_style.dart';
import '../../../utils/ConstantsFiles/string_constants.dart';
import '../../../utils/HelperFiles/math_utils.dart';
import '../../../utils/HelperFiles/pref_utils.dart';
import '../../LoginScreen/models/login_response_model.dart';

class DashBoardScreenController extends GetxController {
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
                            AppStyle.DmSansFont.copyWith(fontSize: 22,color: ColorConstant.darkBlue),
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
                            style: AppStyle.DmSansFont
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

}
