import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:my_secure_app/utils/HelperFiles/math_utils.dart';

import '../../App Configurations/color_constants.dart';
import '../HomeScreen/home_screen.dart';
import '../NotificationScreen/notification_screen.dart';
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
              NotificationScreen(),
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
        color: Colors.white,
        shape: CircularNotchedRectangle(),
        notchMargin: 7,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left:getHorizontalSize(30)),
                child: Obx(
                  () => GestureDetector(
                    onTap: () {
                      dashBoardController.onTapOfBottomnavigation(0);
                    },
                    child: dashBoardController.selectedIndex.value == 0
                        ? SvgPicture.asset(
                            "asset/icons/ic_home_selected.svg",
                            height: getVerticalSize(32),
                          )
                        : SvgPicture.asset(
                            "asset/icons/ic_home.svg",
                            color: ColorConstant.primaryDarkGreen,
                            height: getVerticalSize(26),
                          ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right:getHorizontalSize(100)),
                child: Obx(
                  () => GestureDetector(
                    onTap: () {
                      dashBoardController.onTapOfBottomnavigation(1);
                    },
                    child: dashBoardController.selectedIndex.value == 1
                        ? SvgPicture.asset(
                            "asset/icons/ic_statistic_selected.svg",
                            color: ColorConstant.primaryDarkGreen,
                            height: getVerticalSize(32),
                          )
                        : SvgPicture.asset(
                            "asset/icons/ic_statistic.svg",
                            color: ColorConstant.primaryDarkGreen,
                            height: getVerticalSize(26),
                          ),
                  ),
                ),
              ),
              Obx(
                () => GestureDetector(
                  onTap: () {
                    dashBoardController.onTapOfBottomnavigation(2);
                  },
                  child: dashBoardController.selectedIndex.value == 2
                      ? SvgPicture.asset(
                          "asset/icons/ic_notification_selected.svg",
                          color: ColorConstant.primaryDarkGreen,
                          height: getVerticalSize(32),
                        )
                      : SvgPicture.asset(
                          "asset/icons/ic_notification.svg",
                          color: ColorConstant.primaryDarkGreen,
                          height: getVerticalSize(26),
                        ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right:getHorizontalSize(30)),
                child: Obx(
                  () => GestureDetector(
                    onTap: () {
                      dashBoardController.onTapOfBottomnavigation(3);
                    },
                    child: dashBoardController.selectedIndex.value == 3
                        ? SvgPicture.asset(
                            "asset/icons/ic_profile_selected.svg",
                            color: ColorConstant.primaryDarkGreen,
                            height: getVerticalSize(32),
                          )
                        : SvgPicture.asset(
                            "asset/icons/ic_profile.svg",
                            color: ColorConstant.primaryDarkGreen,
                            height: getVerticalSize(26),
                          ),
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
