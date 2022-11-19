import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../ApiServices/api_service.dart';
import '../../../App Configurations/api_endpoints.dart';
import '../../../App Configurations/color_constants.dart';
import '../../../Custom Widgets/app_ElevatedButton .dart';
import '../../../theme/app_style.dart';
import '../../../utils/ConstantsFiles/string_constants.dart';
import '../../../utils/HelperFiles/math_utils.dart';
import '../../../utils/HelperFiles/pref_utils.dart';
import '../../../utils/HelperFiles/ui_utils.dart';
import '../../LoginScreen/models/login_response_model.dart';
import '../model/get_linked_bank.dart';
import '../model/home_page_response_model.dart';

class HomeScreenController extends GetxController {
  LoginResponseModel? loginResponseModel = LoginResponseModel();
  var homeModel = HomePageResponseModel().obs;
  var getLinkedBankModel = GrtLinkedBank().obs;
  var homePageHeadeName = "".obs;
  var profilePicture = "".obs;
  var showNotiFiBadge = false.obs;

  @override
  void onReady() {
    // WidgetsBinding.instance
    //     .addPostFrameCallback((_) => showWelcomeDialouge());
    super.onReady();
  }

  @override
  void onInit() {
    getStoredData();
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
      if (value['status'] ?? false) {
        homeModel.value = HomePageResponseModel.fromJson(value);
        callGetLinkedBankApi();
      } else {
        UIUtils.showSnakBar(
            bodyText: value['message'], headerText: StringConstants.ERROR);
      }
    });
  }

  Future<void> callGetLinkedBankApi() async {
    ApiService()
        .callGetApi(
            body: await getHomePageApiBody(),
            headerWithToken: true,
            showLoader: false,
            url: ApiEndPoints.HOME_PAGE_GET_LINKED_BANK)
        .then((value) {
      print(value);
      if (value['status'] ?? false) {
        getLinkedBankModel.value = GrtLinkedBank.fromJson(value);
        showWelcomeDialouge();
      } else {
        UIUtils.showSnakBar(
            bodyText: value['message'], headerText: StringConstants.ERROR);
      }
    });
  }

  Future<FormData> getHomePageApiBody() async {
    final form = FormData({});
    return form;
  }

  Future<void> showWelcomeDialouge() async {
    if (PrefUtils.getBool(StringConstants.SHOW_WELCOME_DISLOUGE) ?? false) {
    } else {
      Get.dialog(
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: getVerticalSize(180)),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [ColorConstant.skyE8, ColorConstant.lightSky]),
              border: Border.all(
                  // color: kHintColor,
                  ),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    color: ColorConstant.primaryBlack),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (Get.isDialogOpen == true) Get.back();
                          },
                          child: Icon(
                            Icons.close,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                      ],
                    ),
                    Lottie.asset('asset/animations/welcome.json', height: 80),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          child: Obx(
                            () => Text(
                              textAlign: TextAlign.center,
                              "Hi " + homePageHeadeName.value,
                              style: AppStyle.textStyleSFPRORegular.copyWith(
                                  color: ColorConstant.primaryWhite,
                                  decoration: TextDecoration.none,
                                  fontWeight: FontWeight.bold,
                                  fontSize: getFontSize(24)),
                            ),
                          ),
                        ),
                      ],
                    ),
                   SizedBox(height: getVerticalSize(22),),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Flexible(
                            child:Text(
                                textAlign: TextAlign.center,
                                    "Welcome to MySecure App. Thanks For the Creating an Account!!!",
                                style: AppStyle.textStyleSFPRORegular.copyWith(
                                    color: ColorConstant.primaryWhite,
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
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 22.0),
                      child: AppElevatedButton(
                        buttonName: 'Ok',
                        radius: 5,
                        textColor: Color(0xFF08CDA1),
                        onPressed: () {
                          Get.back();
                          // Get.toNamed(AppRoutes.dashBoardScreen);
                        },
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ),
        ),
        barrierDismissible: false,
      ).then((value) {
        Future.delayed(Duration(milliseconds: 500), () {
          showVerifyIdentityDialouge();
        });
      });
    }
  }

  void showVerifyIdentityDialouge() {
    Get.dialog(
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: getVerticalSize(150)),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [ColorConstant.skyE8, ColorConstant.lightSky]),
            border: Border.all(
              // color: kHintColor,
            ),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  color: ColorConstant.primaryBlack),
              child:Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (Get.isDialogOpen == true) Get.back();
                        },
                        child: Icon(
                          Icons.close,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                    ],
                  ),
                  Lottie.asset('asset/animations/privacy.json', height: 100,width: 100),
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
                    child: Text(
                      "Verify your idenditity",
                      style: AppStyle.textStylePoppinsRegular.copyWith(
                          color: ColorConstant.primaryBlack,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.none,
                          fontSize: getFontSize(24)),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        child: Text(
                          textAlign: TextAlign.center,
                          "Enable blockchain withdrawals and deposits to external wallets.",
                          style: AppStyle.textStyleSFPRORegular.copyWith(
                              color: ColorConstant.primaryWhite,
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.w300,
                              fontSize: getFontSize(18)),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 22.0),
                    child: AppElevatedButton(
                      buttonName: 'Get Started',
                      radius: 5,
                      textColor: Color(0xFF08CDA1),
                      onPressed: () {
                        Get.back();
                        // Get.toNamed(AppRoutes.dashBoardScreen);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),

      barrierDismissible: false,
    );
  }
}
