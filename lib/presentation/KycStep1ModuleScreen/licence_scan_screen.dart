import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:secure_cash_app/presentation/KycStep1ModuleScreen/controller/kyc_step1_screen_controller.dart';
import 'package:secure_cash_app/routes/app_routes.dart';
import 'package:secure_cash_app/utils/HelperFiles/ui_utils.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../App Configurations/color_constants.dart';
import '../../Custom Widgets/app_ElevatedButton .dart';
import '../../theme/app_style.dart';
import '../../utils/ConstantsFiles/string_constants.dart';
import '../../utils/HelperFiles/math_utils.dart';
import 'selfie_screen.dart';

class LicenceScanScreen extends StatefulWidget {
  const LicenceScanScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LicenceScanScreenState();
}

class _LicenceScanScreenState extends State<LicenceScanScreen> {
  Barcode? result;
  int counter = 0;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'BarCode');
  var kycStep1Controller = Get.find<KycStep1ScreenController>();
  var fname = "";
  var lname = "";
  var dobData = "";
  var doex = "";

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: WillPopScope(
        onWillPop: () => showBackDialog(),
        child: Container(
          child: Center(
            child: CircularProgressIndicator(
                color: ColorConstant.primaryDarkGreen),
          ),
        ),
      ),
    );
  }

  Future<bool> showBackDialog() async {
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
                      Container(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: Text(
                            "Are you sure,\n you want to cancel this process?",
                            textAlign: TextAlign.center,
                            style: AppStyle.DmSansFont.copyWith(
                                fontSize: 18, color: ColorConstant.darkBlue),
                          )),
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: AppElevatedButton(
                              buttonName: 'NO',
                              radius: 5,
                              buttonColor: ColorConstant.primaryDarkGreen,
                              onPressed: () {
                                Get.back();
                              },
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Expanded(
                            child: AppElevatedButton(
                              buttonName: 'YES',
                              buttonColor: ColorConstant.primaryDarkGreen,
                              radius: 5,
                              onPressed: () {
                                Get.back();
                                Get.back();
                                Get.back();
                                Get.back();
                              },
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