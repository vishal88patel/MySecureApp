import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../ApiServices/api_service.dart';
import '../../../App Configurations/api_endpoints.dart';
import '../../../utils/ConstantsFiles/string_constants.dart';
import '../../../utils/HelperFiles/ui_utils.dart';
import '../model/get_loan_type_response_model.dart';



class PersonalScreenController extends GetxController {
  var loanTypeModel=GetLoanTypeResponseModel().obs;

  var loanList = [

  ].obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onInit() {
    getLoanTypeApi();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
  Future<void> getLoanTypeApi() async {
    ApiService()
        .callGetApi(
        body: await getLoanTypeBody(),
        headerWithToken: true,
        url: ApiEndPoints.LOAN_TYPE)
        .then((value) {
      print(value);
      if (value['status']) {
        loanTypeModel.value=GetLoanTypeResponseModel.fromJson(value);
      } else {
        UIUtils.showSnakBar(
            bodyText: value['message'], headerText: StringConstants.ERROR);
      }
    });
  }

  Future<FormData> getLoanTypeBody() async {
    final form = FormData({});
    return form;
  }

}
