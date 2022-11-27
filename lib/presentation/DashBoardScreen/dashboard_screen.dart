import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../App Configurations/color_constants.dart';
import '../HomeScreen/home_screen.dart';
import 'controller/dashboard_screen_controller.dart';

class DashBoardScreen extends StatelessWidget {
  var dashBoardController = Get.find<DashBoardScreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Obx(
        () => WillPopScope(
          onWillPop: () => dashBoardController.showLogOutDialouge(),
          child: IndexedStack(
            index: dashBoardController.selectedIndex.value,
            children: [
              HomeScreen(),
              HomeScreen(),
              HomeScreen(),
              HomeScreen(),
              // TransactionScreen(),
              // LinkBankListScreen(),
              // ApplyLoanInfoScreen(),
              // ProfileScreen()
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorConstant.primaryOrange,
        child: Center(
          child: SvgPicture.asset("asset/icons/ic_scan.svg"),
        ),
        onPressed: () {  },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.redAccent,
        shape: CircularNotchedRectangle(),
        notchMargin: 7,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Obx(
                () => InkWell(
                  onTap: () {
                    dashBoardController.onTapOfBottomnavigation(0);
                  },
                  child: dashBoardController.selectedIndex.value == 0
                      ? SvgPicture.asset(
                          "asset/icons/ic_home_selected.svg",
                          color: ColorConstant.primaryDarkGreen,
                          height: 26,
                        )
                      : SvgPicture.asset(
                          "asset/icons/ic_home.svg",
                          color: ColorConstant.primaryDarkGreen,
                          height: 26,
                        ),
                ),
              ),
              Obx(
                () => InkWell(
                  onTap: () {
                    dashBoardController.onTapOfBottomnavigation(1);
                  },
                  child: dashBoardController.selectedIndex.value == 1
                      ? SvgPicture.asset(
                          "asset/icons/ic_wallet_selected.svg",
                          color: ColorConstant.primaryDarkGreen,
                          height: 26,
                        )
                      : SvgPicture.asset(
                          "asset/icons/ic_wallet.svg",
                          color: ColorConstant.primaryDarkGreen,
                          height: 26,
                        ),
                ),
              ),
              Obx(
                () => InkWell(
                  onTap: () {
                    dashBoardController.onTapOfBottomnavigation(2);
                  },
                  child: dashBoardController.selectedIndex.value == 2
                      ? SvgPicture.asset(
                          "asset/icons/ic_notification_selected.svg",
                          color: ColorConstant.primaryDarkGreen,
                          height: 26,
                        )
                      : SvgPicture.asset(
                          "asset/icons/ic_notification.svg",
                          color: ColorConstant.primaryDarkGreen,
                          height: 26,
                        ),
                ),
              ),
              Obx(
                () => InkWell(
                  onTap: () {
                    dashBoardController.onTapOfBottomnavigation(3);
                  },
                  child: dashBoardController.selectedIndex.value == 3
                      ? SvgPicture.asset(
                          "asset/icons/ic_profile_selected.svg",
                          color: ColorConstant.primaryDarkGreen,
                          height: 26,
                        )
                      : SvgPicture.asset(
                          "asset/icons/ic_profile.svg",
                          color: ColorConstant.primaryDarkGreen,
                          height: 26,
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
