import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:secure_cash_app/presentation/EnterLegalNameDetails/enter_middle_name_screen.dart';
import 'package:secure_cash_app/routes/app_routes.dart';

import '../../../ApiServices/api_service.dart';
import '../../../App Configurations/api_endpoints.dart';
import '../../../utils/ConstantsFiles/string_constants.dart';
import '../../../utils/HelperFiles/ui_utils.dart';
import '../../PersonalDetails/model/get_loan_type_response_model.dart';
import '../../loader_screen.dart';
import '../model/cashtag_model.dart';

class EnterLegalNameScreenController extends GetxController {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController middleNameController = TextEditingController();
  TextEditingController secureTagController = TextEditingController();
  TextEditingController dollarController = TextEditingController(text: "\$");
  var loanTenuteList = [
  ].obs;
  var selectedLoanTenureId = 1000.obs;
  var selectedLoanTenure = "".obs;

  void onTapOnLoanTenure(int id, String name) {
    secureTagController.text=name;
    selectedLoanTenureId.value = id;
    selectedLoanTenure.value = name;

    loanTenuteList.refresh();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onInit() {

    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  onTapOfNextButton() {
    if (firstNameController.text.isEmpty) {
      UIUtils.showSnakBar(
          bodyText: "Please enter first name",
          headerText: StringConstants.ERROR);
    } else if (middleNameController.text.isEmpty) {
      UIUtils.showSnakBar(
          bodyText: "Please enter middle name",
          headerText: StringConstants.ERROR);
    }else if (lastNameController.text.isEmpty) {
      UIUtils.showSnakBar(
          bodyText: "Please enter last name",
          headerText: StringConstants.ERROR);
    } else {
      // Get.toNamed(AppRoutes.enterAddressScreen);

      // Get.to(EnterMiddleNameDetailScreen(),
      //   transition: Transition.rightToLeft,
      //   duration:   Duration(milliseconds: 500),);
    }
  }


  Future<void> checkCashTagValidation() async {
    ApiService()
        .callPostApi(
        body: await getBody("\$"+secureTagController.text),
        headerWithToken: false,
        url: ApiEndPoints.CHECK_CASHTAG_VALIDATION)
        .then((value) {
      print(value);
      if (value['status']) {
        Get.to(()=>
            LoaderScreen(AppRoutes.enterAddressScreen),
            transition: Transition.rightToLeft);
      } else {
        UIUtils.showSnakBar(
            bodyText: value['message'], headerText: StringConstants.ERROR);
      }
    });
  }

  Future<FormData> getBody(String text) async {
    final form = FormData({"cashtag": text});
    print(form.toString());
    return form;
  }
  Future<FormData> getBodyForCashTag(String text1,String text2) async {
    final form = FormData({
      "string1": text1,
      "string2": text2,
    });
    print(form.toString());
    return form;
  }

  Future<void> getCashTagSuggestio() async {
    ApiService()
        .callPostApi(
        body: await getBodyForCashTag(firstNameController.text,lastNameController.text),
        headerWithToken: false,
        url: ApiEndPoints.GET_CASHTAG_SUGGESTION)
        .then((value) {
      print(value);
      if (value['status']) {
        CashTagModel model=CashTagModel.fromJson(value);
            for(int i=0;i<model.data!.length;i++){
              loanTenuteList.value.add(LoanModel(
                  name: model.data![i], createdAt: "", deletedAt: "", id: i, updatedAt: ""),);
            }
        loanTenuteList.refresh();

        // Get.to(()=>
        //     LoaderScreen(AppRoutes.enterAddressScreen),
        //     transition: Transition.rightToLeft);
      } else {
        UIUtils.showSnakBar(
            bodyText: value['message'], headerText: StringConstants.ERROR);
      }
    });
  }
}
