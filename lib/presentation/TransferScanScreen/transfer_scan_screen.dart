import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:secure_cash_app/Custom%20Widgets/app_AppBar%20.dart';
import 'package:secure_cash_app/Custom%20Widgets/app_ElevatedButton%20.dart';
import 'package:secure_cash_app/presentation/TransferScanScreen/controller/transfer_scan_screen_controller.dart';
import 'package:secure_cash_app/presentation/TransferScreen/controller/transfer_screen_controller.dart';
import 'package:secure_cash_app/routes/app_routes.dart';
import 'package:secure_cash_app/theme/app_style.dart';
import 'package:secure_cash_app/utils/HelperFiles/math_utils.dart';

import '../../App Configurations/color_constants.dart';
import '../ScanScreen/controller/scan_screen_controller.dart';

class TransferScanScreen extends StatelessWidget {
  var transferScanScreenController = Get.find<TransferScanScreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: getHorizontalSize(20)),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: getVerticalSize(10),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius.circular(12),
                            border: Border.all(
                                color:
                                ColorConstant.backBorder)),
                        padding: EdgeInsets.all(6),
                        child: Icon(
                          Icons.arrow_back_ios_new_outlined,size: 22,),
                      ),
                    ),
                    Text(
                      "Scan",
                      style: AppStyle.DmSansFont.copyWith(
                          color: ColorConstant.primaryBlack,
                          fontWeight: FontWeight.w700,
                          fontSize: getFontSize(20)),
                    ),
                    Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.transparent)),
                      padding: EdgeInsets.all(10),
                      child: Icon(Icons.arrow_back_ios_new_outlined,color: Colors.transparent,),
                    ),                      ],
                ),
                SizedBox(
                  height: getVerticalSize(40),
                ),
                Text(
                  "Scan Code",
                  style: AppStyle.DmSansFont.copyWith(
                      color: ColorConstant.primaryBlack,
                      fontWeight: FontWeight.w700,
                      fontSize: getFontSize(20)),
                ),
                SizedBox(
                  height: getVerticalSize(40),
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: getHorizontalSize(30)),
                  child: Image.asset('asset/icons/t_scan_image.png'),
                ),
                SizedBox(
                  height: getVerticalSize(40),
                ),
                Center(
                  child: Text(
                    "Align the QR code within the frame to scan \nand confirm to proceed to payment.",
                    style: AppStyle.DmSansFont.copyWith(
                        color: ColorConstant.primaryBlack,
                        fontWeight: FontWeight.w500,
                        fontSize: getFontSize(20)),textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: getVerticalSize(40),
                ),
                Spacer(),
                AppElevatedButton(buttonName: 'Proceed',
                  radius: 10,
                  buttonColor: ColorConstant.primaryLightGreen,
                  onPressed: () {

                    Get.offAllNamed(AppRoutes.dashBoardScreen,arguments: {"bottomTabCount":2});
                  },),
                SizedBox(
                  height: getVerticalSize(40),
                ),

              ],
            ),
          ),
        ));
  }
}
