import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:secure_cash_app/Custom%20Widgets/app_AppBar%20.dart';
import 'package:secure_cash_app/presentation/TransferScreen/controller/transfer_screen_controller.dart';
import 'package:secure_cash_app/routes/app_routes.dart';
import 'package:secure_cash_app/theme/app_style.dart';
import 'package:secure_cash_app/utils/HelperFiles/math_utils.dart';

import '../../App Configurations/color_constants.dart';
import '../DashBoardScreen/controller/dashboard_screen_controller.dart';

class TransferScreen extends StatelessWidget {
  var transferScreenController = Get.find<TransferScreenController>();
  var dashBoardController = Get.find<DashBoardScreenController>();
  goToHome() {
    Get.offAllNamed(AppRoutes.dashBoardScreen,
        arguments: {"bottomTabCount": 0});  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () =>goToHome(),
      child: Scaffold(
          body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getHorizontalSize(20)),
          child: Column(
            children: [
              SizedBox(
                height: getVerticalSize(10),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      goToHome();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: ColorConstant.backBorder)),
                      padding: EdgeInsets.all(6),
                      child: Icon(
                        Icons.arrow_back_ios_new_outlined,
                        size: 22,
                      ),
                    ),
                  ),
                  Text(
                    "Transfer",
                    style: AppStyle.DmSansFont.copyWith(
                        color: ColorConstant.primaryBlack,
                        fontWeight: FontWeight.w700,
                        fontSize: getFontSize(20)),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.transparent)),
                    padding: EdgeInsets.all(10),
                    child: Icon(
                      Icons.arrow_back_ios_new_outlined,
                      color: Colors.transparent,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: getVerticalSize(40),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: ColorConstant.primaryLightGreen,
                ),
                padding: EdgeInsets.symmetric(
                    vertical: getVerticalSize(40),
                    horizontal: getHorizontalSize(40)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Total Balance",
                          style: AppStyle.DmSansFont.copyWith(
                              color: ColorConstant.primaryWhite,
                              fontWeight: FontWeight.w500,
                              fontSize: getFontSize(20)),
                        ),
                        SizedBox(
                          height: getVerticalSize(20),
                        ),
                        Obx(
                          () => Text(
                            NumberFormat.currency(name: '\$ ').format(int.parse(dashBoardController.UserBalance.value)),
                            style: AppStyle.DmSansFont.copyWith(
                                color: ColorConstant.primaryWhite,
                                fontWeight: FontWeight.w700,
                                fontSize: getFontSize(32)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: getVerticalSize(40),
              ),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(AppRoutes.transferScanScreen);
                      },
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: ColorConstant.grey8F,
                              )),
                          padding:
                              EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                'asset/icons/scan_icon.png',
                                height: getVerticalSize(60),
                              ),
                              SizedBox(
                                height: getVerticalSize(10),
                              ),
                              Text(
                                "Scan and \nPay",
                                style: AppStyle.DmSansFont.copyWith(
                                    color: ColorConstant.primaryBlack,
                                    fontWeight: FontWeight.w700,
                                    fontSize: getFontSize(16)),
                              ),
                              SizedBox(
                                height: getVerticalSize(20),
                              ),
                              Text(
                                "To acc to acc",
                                style: AppStyle.DmSansFont.copyWith(
                                    color: ColorConstant.grey8F,
                                    fontWeight: FontWeight.w700,
                                    fontSize: getFontSize(14)),
                              ),
                            ],
                          )),
                    ),
                  ),
                  SizedBox(
                    width: getHorizontalSize(30),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(AppRoutes.requestMoneyScreen);
                      },
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: ColorConstant.grey8F,
                              )),
                          padding:
                              EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                'asset/icons/doller_icon.png',
                                height: getVerticalSize(60),
                              ),
                              SizedBox(
                                height: getVerticalSize(10),
                              ),
                              Text(
                                "Request \nMoney ",
                                style: AppStyle.DmSansFont.copyWith(
                                    color: ColorConstant.primaryBlack,
                                    fontWeight: FontWeight.w700,
                                    fontSize: getFontSize(16)),
                              ),
                              SizedBox(
                                height: getVerticalSize(20),
                              ),
                              Text(
                                "Manage Account",
                                style: AppStyle.DmSansFont.copyWith(
                                    color: ColorConstant.grey8F,
                                    fontWeight: FontWeight.w700,
                                    fontSize: getFontSize(14)),
                              ),
                            ],
                          )),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }
}
