import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:secure_cash_app/App%20Configurations/color_constants.dart';
import 'package:secure_cash_app/Custom%20Widgets/app_ElevatedButton%20.dart';
import 'package:secure_cash_app/Custom%20Widgets/app_textField.dart';
import 'package:secure_cash_app/presentation/ForgotPasswordScreen/controller/forgot_password_screen_controller.dart';
import 'package:secure_cash_app/routes/app_routes.dart';
import 'package:secure_cash_app/theme/app_style.dart';
import 'package:secure_cash_app/utils/HelperFiles/math_utils.dart';

import '../../ApiServices/api_service.dart';
import '../../App Configurations/api_endpoints.dart';
import '../../utils/ConstantsFiles/string_constants.dart';
import '../../utils/HelperFiles/ui_utils.dart';

class ChangePasswordScreen extends StatefulWidget {
  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {

  TextEditingController oldPassController = TextEditingController();
  TextEditingController newPassController = TextEditingController();

  bool showNext = false;
  String verificationIDRecived = '';
  var createPaasIsObsecure = true.obs;
  var confirmPassIsObsecure = true.obs;
  var isEmailPhone = true.obs;
  var isPhone = false.obs;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstant.backgroundColor,
        body: SingleChildScrollView(
          child: Container(
              height: size.height,
              color: ColorConstant.buttonGreen.withOpacity(0.3),
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: getVerticalSize(20)),
                    child: SafeArea(
                      child: Stack(
                        children: [
                          Column( crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:  EdgeInsets.symmetric(horizontal: getHorizontalSize(20)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [

                                    InkWell(
                                      onTap: () {
                                        Get.back();
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(12),
                                            border: Border.all(
                                                color:
                                                ColorConstant.backBorder)),
                                        padding: EdgeInsets.all(6),
                                        child: Icon(
                                          Icons.arrow_back_ios_new_outlined,size: 22,),
                                      ),
                                    ),
                                    Text(
                                      "Create new Password",
                                      style: AppStyle.DmSansFont.copyWith(
                                          color: ColorConstant.primaryBlack,
                                          fontWeight: FontWeight.w700,
                                          fontSize: getFontSize(20)),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),
                                          border: Border.all(color: Colors.transparent)),
                                      padding: EdgeInsets.all(10),
                                      child: Icon(Icons.arrow_back_ios_new_outlined,color: Colors.transparent,),
                                    ),                      ],
                                ),
                              ),
                              SizedBox(
                                height: getVerticalSize(120),
                              ),


                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(20),
                                        topLeft: Radius.circular(20),
                                      ),
                                      color:  ColorConstant.primaryWhite
                                  ),

                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      SizedBox(
                                        height: getVerticalSize(130),
                                      ),
                                      Padding(
                                        padding:  EdgeInsets.symmetric(horizontal: getHorizontalSize(20)),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Your new password must be different \nfrom previous used passwords.",
                                              style: AppStyle.DmSansFont.copyWith(
                                                  color: ColorConstant.grey8F,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: getFontSize(18)),
                                            ),
                                            SizedBox(
                                              height: getVerticalSize(54),
                                            ),
                                            Obx(
                                                  () => AppTextField(
                                                hintText: 'Create Password ',
                                                controller:
                                                oldPassController,
                                                isObsecure:
                                            createPaasIsObsecure.value,
                                                suffixIcon: IconButton(
                                                  icon: Icon(createPaasIsObsecure.value
                                                      ? Icons.visibility_off
                                                      : Icons.visibility
                                                    // Icons.visibility_off,
                                                  ),
                                                  color: ColorConstant.grey8F,
                                                  iconSize: getSize(20),
                                                  onPressed: () {

                                                onTapOfCreatePassObsecure(
                                                       createPaasIsObsecure.value);
                                                  },
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: getVerticalSize(30),
                                            ),
                                            Obx(
                                                  () => AppTextField(
                                                hintText: 'Confirm password',
                                                suffixIcon: IconButton(
                                                  icon: Icon(confirmPassIsObsecure.value
                                                      ? Icons.visibility_off
                                                      : Icons.visibility
                                                    // Icons.visibility,
                                                  ),
                                                  onPressed: () {
                                                   onTapOfConfirmPassObsecure(
                                                       confirmPassIsObsecure.value);
                                                  },
                                                  iconSize: getSize(20),
                                                  color: ColorConstant.grey8F,
                                                ),
                                                controller:
                                              newPassController,
                                                isObsecure: confirmPassIsObsecure.value,
                                              ),
                                            ),
                                            SizedBox(
                                              height: getVerticalSize(54),
                                            ),
                                            AppElevatedButton(
                                                buttonName: 'Submit',
                                                onPressed: () {
                                                  sendResetPasswordApi();

                                                }),

                                            SizedBox(
                                              height: getVerticalSize(36),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),

                            ],
                          ),


                          Positioned(right: 10,
                            top: getVerticalSize(60),
                            child: Center(
                                child: Image.asset('asset/icons/birthDate_image.png',
                                  height: getVerticalSize(220),)
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              )),
        ));






  }
  void onTapOfCreatePassObsecure(bool val) {
    createPaasIsObsecure.value = !val;
    setState(() {

    });
  }
  void onTapOfConfirmPassObsecure(bool val) {
    confirmPassIsObsecure.value = !val;
    setState(() {

    });
  }

  Future<void> sendResetPasswordApi() async {

    ApiService()
        .callPostApi(
      showLoader: true,
        body: await getResetPasswordData(),
        headerWithToken: true,
        url: ApiEndPoints.CHANGE_PASSWORD)
        .then((value) {
      print(value);
      if (value['status']) {
        UIUtils.showSnakBar(
            bodyText: value['message'], headerText: StringConstants.ERROR);
        Get.offAllNamed(AppRoutes.dashBoardScreen,arguments: {"bottomTabCount":0});
      } else {
        UIUtils.showSnakBar(
            bodyText: value['message'], headerText: StringConstants.ERROR);
      }
    });
  }
  Future<FormData> getResetPasswordData() async {
    final form = FormData({
      "old_password": oldPassController.text,
      "password": newPassController.text,
    });
    print(form.toString());
    return form;
  }

}