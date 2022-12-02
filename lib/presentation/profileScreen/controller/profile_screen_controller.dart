

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../ApiServices/api_service.dart';
import '../../../App Configurations/api_endpoints.dart';
import '../../../App Configurations/color_constants.dart';
import '../../../Custom Widgets/app_ElevatedButton .dart';
import '../../../routes/app_routes.dart';
import '../../../theme/app_style.dart';
import '../../../utils/ConstantsFiles/string_constants.dart';
import '../../../utils/HelperFiles/math_utils.dart';
import '../../../utils/HelperFiles/pref_utils.dart';
import '../../../utils/HelperFiles/ui_utils.dart';

class ProfileScreenController extends GetxController {


  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<dynamic> showLogOutDialouge() async {
    return Get.dialog(
      Padding(
        padding: const EdgeInsets.all(18.0),
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
                            "Logout",
                            style:
                            AppStyle.DmSansFont.copyWith(fontSize: 22),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: Text(
                            "Are you sure,you want to Logout?",
                            textAlign: TextAlign.start,
                            style: AppStyle.DmSansFont
                                .copyWith(fontSize: 18),
                          )),
                      const SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 50,width:  getHorizontalSize(150),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: AppElevatedButton(buttonName: 'NO',
                                buttonColor: ColorConstant.primaryDarkGreen,
                                onPressed: () {
                                  Get.back();
                                },),
                            ),
                          ),

                          SizedBox(
                            width: 8,
                          ),
                          Container(
                            height: 50,width: getHorizontalSize(150),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: AppElevatedButton(buttonName: 'YES',
                                buttonColor: ColorConstant.primaryDarkGreen,
                                onPressed: () {
                                  Get.back();
                                  callLogOutApi();
                                },),
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
  Future<void> callLogOutApi() async {
    ApiService()
        .callPostApi(
        body: await getLogOutBody(),
        url: ApiEndPoints.LOGOUT)
        .then((value) {
      print(value);
      if (value['status']) {
        PrefUtils.clear();
        UIUtils.showSnakBar(
            bodyText: value['message'], headerText: StringConstants.SUCCESS);
        PrefUtils.clear();
        Get.offAllNamed(AppRoutes.loginScreen);
      } else {
        UIUtils.showSnakBar(
            bodyText: value['message'], headerText: StringConstants.ERROR);
      }
    });
  }

  Future<FormData> getLogOutBody() async {
    final form = FormData({});
    return form;
  }

}
