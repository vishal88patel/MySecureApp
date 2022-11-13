import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:my_secure_app/presentation/LoanCalculator/model/loan_calculation_response.dart';

import '../../../ApiServices/api_service.dart';
import '../../../App Configurations/api_endpoints.dart';
import '../../../routes/app_routes.dart';
import '../../../utils/ConstantsFiles/string_constants.dart';
import '../../../utils/HelperFiles/ui_utils.dart';
import '../../PersonalDetails/model/get_loan_type_response_model.dart';

class LoanCalculatorScreenController extends GetxController {
  var loanModel = GetLoanTypeResponseModel().obs;
  var loanList = [].obs;
  var loanTenuteList = [
    LoanModel(
        name: "06 Month", createdAt: "", deletedAt: "", id: 6, updatedAt: ""),
    LoanModel(
        name: "12 Month", createdAt: "", deletedAt: "", id: 12, updatedAt: ""),
    LoanModel(
        name: "18 Month", createdAt: "", deletedAt: "", id: 18, updatedAt: ""),
    LoanModel(
        name: "24 Month", createdAt: "", deletedAt: "", id: 24, updatedAt: ""),
    LoanModel(
        name: "30 Month", createdAt: "", deletedAt: "", id: 30, updatedAt: ""),
    LoanModel(
        name: "36 Month", createdAt: "", deletedAt: "", id: 36, updatedAt: ""),
  ].obs;
  var selectedLoanId = "".obs;
  var selectedLoanTenureId = 0.obs;
  var maximumAvailableLoan = 0.obs;
  var interestRate = "".obs;
  var selectedLoanTenure = "".obs;
  var selectedLoan = "Please select loan".obs;

  var selectedLoanAmount = "".obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onInit() {
    getLoanTypeApi();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void onTapOnLoanTile(id, name) {
    selectedLoanId.value = id.toString();
    selectedLoan.value = name.toString();
  }

  Future<void> getLoanTypeApi() async {
    ApiService()
        .callGetApi(
            body: FormData({}),
            headerWithToken: false,
            url: ApiEndPoints.LOAN_TYPE,
            showLoader: true)
        .then((value) {
      print(value);
      if (value['status']) {
        loanModel.value = GetLoanTypeResponseModel.fromJson(value);
        loanList.value = loanModel.value.data ?? [];
        getLoanDetailApi();
      } else {
        UIUtils.showSnakBar(
            bodyText: value['message'], headerText: StringConstants.ERROR);
      }
    });
  }

  Future<void> getLoanDetailApi() async {
    ApiService()
        .callGetApi(
            body: FormData({}),
            headerWithToken: true,
            url: ApiEndPoints.LOAN_DETAIL,
            showLoader: false)
        .then((value) {
      print(value);
      if (value['status']) {
        maximumAvailableLoan.value = int.parse(value['data']['loanBalance']);
        interestRate.value = value['data']['loanIntrest'].toString();
      } else {
        UIUtils.showSnakBar(
            bodyText: value['message'], headerText: StringConstants.ERROR);
      }
    });
  }

  void onTapOnLoanTenure(int id, String name) {
    selectedLoanTenureId.value = id;
    selectedLoanTenure.value = name;
  }

  void onClickOfProcessToLoan() {
    if (selectedLoan.value == "Please select loan") {
      UIUtils.showSnakBar(
          bodyText: "Please select loan", headerText: StringConstants.ERROR);
    } else if (selectedLoanAmount.isEmpty) {
      UIUtils.showSnakBar(
          bodyText: "Please Select Amount", headerText: StringConstants.ERROR);
    } else if (selectedLoanTenure.isEmpty) {
      UIUtils.showSnakBar(
          bodyText: "Please Select Loan Tenure",
          headerText: StringConstants.ERROR);
    } else {
      getLoanCalculationApi();
      // Get.toNamed(AppRoutes.loanStepScreen);
    }
  }

  Future<void> getLoanCalculationApi() async {
    ApiService()
        .callPostApi(
            body: await getRegisterBody(
                amount: selectedLoanAmount.value,
                loan_type: selectedLoan.value,
                month: selectedLoanTenureId.value.toString(),
                type: "1"),
            headerWithToken: true,
            url: ApiEndPoints.GET_LOAN_CALCULATION)
        .then((value) {
      print(value);
      if (value['status']) {
        LoanCalculationResponseModel loanCalModel =
            LoanCalculationResponseModel.fromJson(value);
        Get.toNamed(AppRoutes.loanStepScreen,
            arguments: {
          "loanCalModel": loanCalModel,
          "loanAmount": selectedLoanAmount.value,
        });
      } else {
        UIUtils.showSnakBar(
            bodyText: value['message'], headerText: StringConstants.ERROR);
      }
    });
  }

  Future<FormData> getRegisterBody({
    required String amount,
    required String month,
    required String type,
    required String loan_type,
  }) async {
    final form = FormData({
      "amount": amount,
      "month": month,
      "type": type,
      "loan_type": loan_type,
    });
    return form;
  }
}
