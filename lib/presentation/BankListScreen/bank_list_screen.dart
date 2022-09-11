import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_secure_app/App%20Configurations/color_constants.dart';
import 'package:my_secure_app/Custom%20Widgets/app_ElevatedButton%20.dart';
import 'package:my_secure_app/Custom%20Widgets/app_textField.dart';
import 'package:my_secure_app/Custom%20Widgets/app_textFormField_fill.dart';
import 'package:my_secure_app/Custom%20Widgets/bank_list_widget.dart';
import 'package:my_secure_app/Custom%20Widgets/main_custom_background.dart';
import 'package:my_secure_app/routes/app_routes.dart';
import 'package:my_secure_app/theme/app_style.dart';
import 'package:my_secure_app/utils/HelperFiles/math_utils.dart';

import 'controller/bank_list_screen_controller.dart';

class BankListScreen extends StatelessWidget {
  var bankListController = Get.put(BankListScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        MainCutomBackGround(
            child: Padding(
          padding: EdgeInsets.only(
              left: getHorizontalSize(20.0),
              right: getHorizontalSize(20.0),
              top: getVerticalSize(26)),
          child: SafeArea(
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                            onTap: () {
                              Get.toNamed(AppRoutes.bankDetailScreen);
                            },
                            child: Icon(
                              Icons.arrow_back,
                              color: ColorConstant.primaryWhite,
                            )),
                        InkWell(
                          onTap: () {
                            Get.toNamed(AppRoutes.accountDetailListScreen);
                          },
                          child: Image.asset(
                            'asset/icons/notification_icon.png',
                            height: getVerticalSize(20),
                            width: getHorizontalSize(16),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: getVerticalSize(25),
                    ),
                    SizedBox(
                        height: getVerticalSize(38),
                        child: AppTextFormFieldFill(
                          hintText: 'y',
                          prefixIcon: Icon(
                            Icons.search,
                            color: ColorConstant.primaryAppTextF1,
                          ),
                        )),
                    SizedBox(
                      height: getVerticalSize(25),
                    ),
                    Expanded(
                      child: ListView.builder(
                          itemCount: 15,
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: getVerticalSize(6.5)),
                              child: InkWell(
                                  onTap: () {
                                    Get.toNamed(AppRoutes.progressScreen);
                                  },
                                  child: BankListWidget(
                                      name: 'Your Bank Name ',
                                      image: 'asset/bank_image.png')),
                            );
                          }),
                    )
                  ],
                ),
              ],
            ),
          ),
        )),
      ],
    ));
  }
}
