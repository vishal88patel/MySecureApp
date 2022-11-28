import 'dart:ffi';

import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:my_secure_app/utils/HelperFiles/math_utils.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import '../../App Configurations/color_constants.dart';
import '../../Custom Widgets/app_AppBar .dart';
import '../../Custom Widgets/app_ElevatedButton .dart';
import '../../theme/app_style.dart';
import '../../utils/HelperFiles/ui_utils.dart';
import 'controller/scan_screen_controller.dart';

class ScanSummaryScreen extends StatelessWidget {
  var scanController = Get.put(ScanScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstant.primaryDarkGreen,
        body: Column(
          children: [
            SizedBox(
              height: getVerticalSize(26),
            ),
            SizedBox(
              height: getVerticalSize(26),
            ),
            Padding(
              padding: EdgeInsets.only(left: getHorizontalSize(20),right: getHorizontalSize(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Payment Receipt",
                    style: AppStyle.textStyleDMSANS.copyWith(
                        color: ColorConstant.primaryWhite,
                        fontWeight: FontWeight.w700,
                        fontSize: getFontSize(24)),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: getVerticalSize(24),
            ),
            SizedBox(height: getVerticalSize(40)),

          ],
        ));
  }
}
