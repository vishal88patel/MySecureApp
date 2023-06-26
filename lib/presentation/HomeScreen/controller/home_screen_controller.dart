import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

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
import '../../LoginScreen/models/login_response_model.dart';
import '../model/get_linked_bank.dart';
import '../model/home_page_response_model.dart';
import '../../NotificationScreen/Model/notification_response_model.dart';

class HomeScreenController extends GetxController {
  LoginResponseModel? loginResponseModel = LoginResponseModel();
  var homeModel = HomePageResponseModel().obs;
  var getLinkedBankModel = GrtLinkedBank().obs;
  var homePageHeadeName = "".obs;
  var profilePicture = "".obs;
  var showNotiFiBadge = false.obs;
  var isVerified = "0".obs;
  var isOtpDone = "0".obs;
  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onInit() {
    getStoredData();
    isVerified.value = PrefUtils.getString(StringConstants.IS_KYC_DONE);
    print("abcdefg$isVerified");
    isOtpDone.value = PrefUtils.getString(StringConstants.IS_OTP_DONE);
    callHomePageApi();

    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> getStoredData() async {
    loginResponseModel =
        (await PrefUtils.getLoginModelData(StringConstants.LOGIN_RESPONSE));
    homePageHeadeName.value = loginResponseModel!.data!.firstName! +
        " " +
        loginResponseModel!.data!.lastName.toString();
    profilePicture.value =
        loginResponseModel!.data!.profilePhotoPath.toString();

    if (PrefUtils.getString(StringConstants.IS_KYC_DONE) == "0") {
      showNotiFiBadge.value = true;
    } else {
      showNotiFiBadge.value = false;
    }
  }

  Future<void> callHomePageApi() async {
    ApiService()
        .callGetApi(
            body: await getHomePageApiBody(),
            headerWithToken: true,
            showLoader: false,
            url: ApiEndPoints.HOME_PAGE_API)
        .then((value) {
      print(value);
      if (value != null && value['status'] ?? false) {
        homeModel.value = HomePageResponseModel.fromJson(value);

        // callGetLinkedBankApi();
        UIUtils.hideProgressDialog();
        Future.delayed(Duration(milliseconds: 500), () {
          if (isVerified.value == "0" && PrefUtils.getBool(StringConstants.IS_FIRST_TIME)) {
            showVerifyIdentityDialouge();
          } else {

          }
        //  showWelcomeDialouge();
        });
      } else {
        UIUtils.showSnakBar(
            bodyText: "Error Fetching Offers",
            headerText: StringConstants.ERROR);
      }
    });
  }

  Future<FormData> getHomePageApiBody() async {
    final form = FormData({});
    return form;
  }

  Future<void> showWelcomeDialouge() async {
    if (PrefUtils.getBool(StringConstants.SHOW_WELCOME_DISLOUGE)) {
      Get.dialog(
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: getHorizontalSize(60.0),
              vertical: getVerticalSize(300)),
          child: Wrap(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                        color: ColorConstant.primaryWhite),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(25),
                                  topRight: Radius.circular(25)),
                              color: ColorConstant.greyF4,
                            ),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset('asset/icons/done_image.png',
                                        height: 60),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        // Lottie.asset('asset/animations/welcome.json', height: 80),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Flexible(
                              child: Obx(
                                () => Text(
                                  textAlign: TextAlign.center,
                                  "Hi " + homePageHeadeName.value,
                                  style: AppStyle.DmSansFont.copyWith(
                                      color: ColorConstant.primaryBlack,
                                      decoration: TextDecoration.none,
                                      fontWeight: FontWeight.bold,
                                      fontSize: getFontSize(24)),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Flexible(
                                child: Text(
                                  textAlign: TextAlign.center,
                                  "Welcome to Secure Cashapp. \nThanks for creating an account",
                                  style: AppStyle.DmSansFont.copyWith(
                                      color: ColorConstant.primaryBlack,
                                      decoration: TextDecoration.none,
                                      fontWeight: FontWeight.w300,
                                      fontSize: getFontSize(18)),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0),
                          child: AppElevatedButton(
                            buttonName: 'Ok',
                            radius: 5,
                            textColor: Colors.white,
                            onPressed: () {
                              Get.back();
                              showVerifyIdentityDialouge();
                              // Get.toNamed(AppRoutes.dashBoardScreen);
                            },
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        barrierDismissible: false,
      );
    } else {
      if (isVerified.value == "0" && PrefUtils.getBool(StringConstants.IS_FIRST_TIME)) {
        showVerifyIdentityDialouge();
      } else {}
    }
  }

  void showVerifyIdentityDialouge() {
    Get.dialog(
      Container(
        decoration: BoxDecoration(color: ColorConstant.primaryWhite),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25)),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (Get.isDialogOpen == true) Get.back();
                            PrefUtils.setBool(
                                StringConstants.IS_FIRST_TIME, false);
                            PrefUtils.setBool(
                                StringConstants.SHOW_WELCOME_DISLOUGE, false);
                          },
                          child: Icon(
                            Icons.close,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('asset/icons/welcome.jpg', height:340),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                  ],
                )),
            SizedBox(
              height: 20,
            ),
            // Lottie.asset('asset/animations/welcome.json', height: 80),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Text(
                    textAlign: TextAlign.center,
                    "Welcome to Secure Cashapp",
                    style: AppStyle.DmSansFont.copyWith(
                        color: ColorConstant.primaryBlack,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.bold,
                        fontSize: getFontSize(24)),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: Text(
                      textAlign: TextAlign.center,
                      "You have been approved for a \nLOAN of \$ 32,000. To get your loan amount \nplease complete your Identity Verification \nby clicking the button below.",
                      style: AppStyle.DmSansFont.copyWith(
                          color: ColorConstant.primaryBlack,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.w300,
                          fontSize: getFontSize(18)),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22.0),
              child: AppElevatedButton(
                buttonName: 'Continue with Identity Verification',
                radius: 5,
                textColor: Colors.white,
                onPressed: () {

                  Future.delayed(Duration(milliseconds: 10), () {
                    Get.back();
                    Get.toNamed(AppRoutes.kycPhoneScreen);
                    PrefUtils.setBool(
                        StringConstants.IS_FIRST_TIME, false);
                    PrefUtils.setBool(
                        StringConstants.SHOW_WELCOME_DISLOUGE, false);
                  });

                  // Get.toNamed(AppRoutes.dashBoardScreen);
                },
              ),
            ),
            SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
      barrierDismissible: false,
    );
  }
}
