import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:my_secure_app/App%20Configurations/image_constants.dart';
import 'package:my_secure_app/presentation/LinkBankListScreen/link_bank_list_screen.dart';
import 'package:my_secure_app/presentation/LoanCalculator/loan_calculator_screen.dart';
import 'package:my_secure_app/theme/app_style.dart';
import '../../App Configurations/color_constants.dart';
import '../../utils/HelperFiles/math_utils.dart';
import '../BankListScreen/bank_list_screen.dart';
import '../HomeScreen/home_screen.dart';
import '../ProfileScreen/profile_screen.dart';
import '../TransactionScreen/transaction_screen.dart';
import 'controller/dashboard_screen_controller.dart';

class DashBoardScreen extends StatelessWidget {
  var dashBoardController = Get.find<DashBoarScreenController>();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Obx(
        ()=> IndexedStack(
          index: dashBoardController.selectedIndex.value,
          children: [
            HomeScreen(),
            TransactionScreen(),
            LinkBankListScreen(),
            LoanCalculatorScreen(),
            ProfileScreen()
          ],
        ),
      ),
      bottomNavigationBar: Obx(
          ()=> Container(
            height: 85,
            child: BottomNavigationBar(
              selectedLabelStyle: TextStyle(fontSize: 12, color: Colors.red),
              unselectedLabelStyle: AppStyle.textStyleSFPRO,
              unselectedItemColor: ColorConstant.primaryWhite,
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.transparent,
              currentIndex: dashBoardController.selectedIndex.value,
              onTap: (value) {
                dashBoardController.onTapOfBottomnavigation(value);
                // print(value);
                // _index = value;
                // setState(() {
                //   widget.savePrevIndex = widget._currentIndex;
                //   widget._currentIndex = value;
                // });
              },
              items: [
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'asset/icons/ic_home_unselected.svg',
                  ),
                  activeIcon: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Container(
                        height: 55,
                        child: SvgPicture.asset(
                            "asset/icons/selected_icon_bakground.svg"),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 4),
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorConstant.primaryWhite,
                        ),
                        child: SvgPicture.asset(
                          'asset/icons/ic_home_selected.svg',

                        ),
                      ),
                    ],
                  ),
                  label: dashBoardController.selectedIndex.value==0?"":"Home",
                ),

                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'asset/icons/ic_wallet_unselected.svg',

                  ),
                  activeIcon: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Container(
                        height: 55,
                        child: SvgPicture.asset(
                            "asset/icons/selected_icon_bakground.svg"),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 4),
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorConstant.primaryWhite,
                        ),
                        child: SvgPicture.asset(
                          'asset/icons/ic_wallet_selected.svg',

                        ),
                      ),
                    ],
                  ),
                  label: dashBoardController.selectedIndex.value==1?"":"Wallet",
                ),

                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'asset/icons/ic_bank_unselected.svg',

                  ),
                  activeIcon: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Container(
                        height: 55,
                        child: SvgPicture.asset(
                            "asset/icons/selected_icon_bakground.svg"),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 4),
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorConstant.primaryWhite,
                        ),
                        child: SvgPicture.asset(
                          'asset/icons/ic_bank_selected.svg',

                        ),
                      ),
                    ],
                  ),
                  label: dashBoardController.selectedIndex.value==2?"":"Bank",
                ),

                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'asset/icons/ic_loan_unselected.svg',

                  ),
                  activeIcon: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Container(
                        height: 55,
                        child: SvgPicture.asset(
                            "asset/icons/selected_icon_bakground.svg"),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 4),
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorConstant.primaryWhite,
                        ),
                        child: SvgPicture.asset(
                          'asset/icons/ic_loan_selected.svg',

                        ),
                      ),
                    ],
                  ),
                  label: dashBoardController.selectedIndex.value==3?"":"Loan",
                ),

                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'asset/icons/ic_setting_unselected.svg',

                  ),
                  activeIcon: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Container(
                        height: 55,
                        child: SvgPicture.asset(
                            "asset/icons/selected_icon_bakground.svg"),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 4),
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorConstant.primaryWhite,
                        ),
                        child: SvgPicture.asset(
                          'asset/icons/ic_setting_selected.svg',
                        ),
                      ),
                    ],
                  ),
                  label: dashBoardController.selectedIndex.value==4?"":"Setting",
                ),
              ]),
          ),
      ),
    );
  }
}
