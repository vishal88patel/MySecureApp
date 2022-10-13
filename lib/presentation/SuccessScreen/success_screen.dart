import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:my_secure_app/Custom%20Widgets/app_ElevatedButton%20.dart';
import 'package:my_secure_app/Custom%20Widgets/main_custom_background.dart';
import 'package:my_secure_app/theme/app_style.dart';
import 'package:my_secure_app/utils/HelperFiles/math_utils.dart';

import '../../App Configurations/color_constants.dart';
import 'controller/success_screen_controller.dart';

class SuccessScreen extends StatelessWidget {
  var successController = Get.find<SuccessScreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstant.primaryBlack,
        body: SafeArea(
          child: MainCutomBackGround(
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(
                  () => successController.bankImage.value.isNotEmpty
                      ? Container(
                          height: 100,
                          width: 100,
                          child: successController.bankImage.value
                                      .toString()
                                      .substring(successController
                                              .bankImage.value
                                              .toString()
                                              .length -
                                          3)
                                      .toLowerCase() ==
                                  "svg"
                              ? SvgPicture.network(
                                  successController.bankImage.value.toString(),
                            height: 100,width: 100,
                                )
                              : Image.network(
                                  successController.bankImage.value.toString()))
                      : Container(),
                ),
                Text(
                  "Success",
                  style: AppStyle.textStyleSFPROBold.copyWith(
                      color: ColorConstant.primaryWhite,
                      fontWeight: FontWeight.w700,
                      fontSize: getFontSize(24)),
                ),
                SizedBox(
                  height: getVerticalSize(12),
                ),
                Obx(
                  () => successController.bankName.value.isNotEmpty
                      ? Text(
                          "Your Bank ${successController.bankName.value} Has Been Link",
                          style: AppStyle.textStyleSFPRORegular.copyWith(
                              color: ColorConstant.primaryWhite,
                              fontWeight: FontWeight.w400,
                              fontSize: getFontSize(18)),
                        )
                      : Text(
                          "Your Bank Has Been Link",
                          style: AppStyle.textStyleSFPRORegular.copyWith(
                              color: ColorConstant.primaryWhite,
                              fontWeight: FontWeight.w400,
                              fontSize: getFontSize(18)),
                        ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25.0, vertical: 8),
                  child: AppElevatedButton(
                      buttonName: 'View Details',
                      onPressed: () {
                        // Get.offAllNamed(AppRoutes.dashBoardScreen);
                        successController.onclickofButton();
                      }),
                ),
              ],
            )),
          ),
        ));
  }
}
