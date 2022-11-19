import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:my_secure_app/App%20Configurations/color_constants.dart';
import 'package:my_secure_app/utils/HelperFiles/math_utils.dart';

import '../../../ApiServices/api_service.dart';
import '../../../App Configurations/api_endpoints.dart';
import '../../../theme/app_style.dart';
import '../../../utils/ConstantsFiles/string_constants.dart';
import '../../../utils/HelperFiles/ui_utils.dart';
import '../../HomeScreen/model/get_linked_bank.dart';

class MyLinkedBankListScreenController extends GetxController {
  var getLinkedBankModel = GrtLinkedBank().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onInit() {
    callGetLinkedBankApi();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> callGetLinkedBankApi() async {
    ApiService()
        .callGetApi(
            body: await getBankApiBody(),
            headerWithToken: true,
            showLoader: true,
            url: ApiEndPoints.HOME_PAGE_GET_LINKED_BANK)
        .then((value) {
      print(value);
      if (value['status'] ?? false) {
        getLinkedBankModel.value = GrtLinkedBank.fromJson(value);
      } else {
        UIUtils.showSnakBar(
            bodyText: value['message'], headerText: StringConstants.ERROR);
      }
    });
  }

  Future<FormData> getBankApiBody() async {
    final form = FormData({});
    return form;
  }

  void showBankInfoBottomsheet() {
    Get.bottomSheet(
        Container(
          height: size.height,
          color: ColorConstant.blue26,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 12,),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Container(
                  padding: EdgeInsets.all(9),
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.green,
                  ),
                  child: SvgPicture.asset(
                    "asset/icons/ic_bank.svg",color: ColorConstant.primaryWhite,
                    height: 20,
                    width: 20,
                  ),
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
                child: Text(
                  "Link Your Bank Account",
                  style: AppStyle.textStylePoppinsRegular.copyWith(
                      color: ColorConstant.primaryWhite,
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
                      "",
                      style: AppStyle.textStyleSFPRORegular.copyWith(
                          color: ColorConstant.primaryWhite,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.w300,
                          fontSize: getFontSize(18)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ));
  }
}
