import 'dart:io';

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
import '../../HistoryScreen/Model/getWallet.dart';
import '../../LoginScreen/models/login_response_model.dart';
import '../../NotificationScreen/controller/notification_screen_controller.dart';

class DashBoardScreenController extends GetxController {
  var selectedIndex = 0.obs;
  var arguments = Get.arguments;
  var walletModel=GetWallet().obs;
  var UserBalance="".obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onInit() {
    getArguments();
    getUserDetails();
    callGetWalletApi(pageNo: 1);
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
  Future<void> getUserDetails() async {
    ApiService()
        .callGetApi(
        body: FormData({}),
        headerWithToken: true,
        showLoader: false,
        url: ApiEndPoints.GET_PROFILE)
        .then((value) {
      print(value);
      if (value['status'] ?? false) {
        LoginResponseModel loginResponseModel =
        LoginResponseModel.fromJson(value);
        PrefUtils.putObject(StringConstants.LOGIN_RESPONSE, loginResponseModel);

      } else {
        UIUtils.showSnakBar(
            bodyText: value['message'], headerText: StringConstants.ERROR);
      }
    });
  }


  void onTapOfBottomnavigation(int value) {
    selectedIndex.value=value;

  }
  DateTime? currentBackPressTime;


  void getArguments() {
    Get.put(NotificationScreenController());
    if (arguments != null) {
      selectedIndex.value = arguments['bottomTabCount'] ?? 0;
    }
  }
  Future<bool> showLogOutDialouge() async {
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Exit App",
                            style:
                            AppStyle.DmSansFont.copyWith(fontSize: 22,color: ColorConstant.primaryDarkGreen,fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: Text(
                            "Are you sure,\n you want to exit?",
                            textAlign: TextAlign.center,
                            style: AppStyle.DmSansFont
                                .copyWith(fontSize: 18,color: ColorConstant.primaryDarkGreen),

                          )),
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: AppElevatedButton(buttonName: 'NO',
                              radius: 5,
                              buttonColor: ColorConstant.primaryDarkGreen,
                              onPressed: () {

                                Get.back();
                              },),
                          ),

                          SizedBox(
                            width: 8,
                          ),
                          Expanded(
                            child: AppElevatedButton(buttonName: 'YES',
                              buttonColor: ColorConstant.primaryDarkGreen,
                              radius: 5,
                              onPressed: () {
                                exit(0);
                              },),
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

  Future<void> callGetWalletApi({required int pageNo}) async {
    ApiService()
        .callGetApi(
        body: await getWalletApiBody(),
        headerWithToken: true,
        showLoader:false,
        url: ApiEndPoints.GET_WALLET+"?page=$pageNo")
        .then((value) {
      print(value);
      if (value!=null&&value['status']) {
        walletModel.value = GetWallet.fromJson(value);

        UserBalance.value= walletModel.value.data!.walletBalance!;

      } else {
        UIUtils.hideProgressDialog();
        // UIUtils.showSnakBar(
        //     bodyText: value['message']??'', headerText: StringConstants.ERROR);
      }
    });
  }

  Future<FormData> getWalletApiBody() async {
    final form = FormData({});
    return form;
  }

}
