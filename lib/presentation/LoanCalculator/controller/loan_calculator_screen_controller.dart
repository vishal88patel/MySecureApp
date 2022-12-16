import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:secure_cash_app/App%20Configurations/color_constants.dart';
import 'package:secure_cash_app/Custom%20Widgets/app_ElevatedButton%20.dart';
import 'package:secure_cash_app/presentation/LoanCalculator/model/loan_calculation_response.dart';
import 'package:secure_cash_app/theme/app_style.dart';

import '../../../ApiServices/api_service.dart';
import '../../../App Configurations/api_endpoints.dart';
import '../../../routes/app_routes.dart';
import '../../../utils/ConstantsFiles/string_constants.dart';
import '../../../utils/HelperFiles/math_utils.dart';
import '../../../utils/HelperFiles/pref_utils.dart';
import '../../../utils/HelperFiles/regex_utils.dart';
import '../../../utils/HelperFiles/ui_utils.dart';
import '../../LoginScreen/models/login_response_model.dart';
import '../../PersonalDetails/model/get_loan_type_response_model.dart';
import '../Amount_radial_screen.dart';
import '../amount_dialog.dart';
import '../select_loan_type_screen.dart';

class LoanCalculatorScreenController extends GetxController {
  var loanModel = GetLoanTypeResponseModel().obs;
  LoginResponseModel? loginResponseModel = LoginResponseModel();
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
  var isKycDone = false.obs;
  var isedit = false.obs;


  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController ssnController = TextEditingController();
  TextEditingController address01Controller = TextEditingController();
  TextEditingController address02Controller = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController zipCodeController = TextEditingController();
  var stateList = [].obs;
  var selectedState = "Select State".obs;
  String? selectedStateFordropdown;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onInit() {
    getStoredDataa();
    getStoredData();
    Future.delayed(Duration(milliseconds: 50), () {
      getStateList();
    });
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    super.onInit();
  }

  Future<void> getStoredData() async {
    if (PrefUtils.getString(StringConstants.IS_KYC_DONE) != "0" && PrefUtils.getString(StringConstants.IS_KYC_DONE) != "1") {
      isKycDone.value = true;
      Future.delayed(Duration(milliseconds: 50), () {
        getLoanTypeApi();
      });
    } else {
      isKycDone.value = false;
    }
  }

  editText(){
    isedit.value= !isedit.value;
  }

  Future<void> getStoredDataa() async {
    loginResponseModel =
    (await PrefUtils.getLoginModelData(StringConstants.LOGIN_RESPONSE));

    firstNameController.text = loginResponseModel!.data!.firstName.isNull
        ? ""
        : loginResponseModel!.data!.firstName!;
    lastNameController.text = loginResponseModel!.data!.lastName.isNull
        ? ""
        : loginResponseModel!.data!.lastName!;
    emailController.text = loginResponseModel!.data!.email.isNull
        ? ""
        : loginResponseModel!.data!.email!;
    phoneController.text = loginResponseModel!.data!.mobile.isNull
        ? ""
        : loginResponseModel!.data!.mobile!;

    ssnController.text = loginResponseModel!.data!.ssn.isNull
        ? ""
        : loginResponseModel!.data!.ssn!;

    dobController.text = loginResponseModel!.data!.dateOfBirth.isNull
        ? ""
        : dateConverter(loginResponseModel!.data!.dateOfBirth!.toString());

    address01Controller.text = loginResponseModel!.data!.address1.isNull
        ? ""
        : loginResponseModel!.data!.address1!;
    address02Controller.text = loginResponseModel!.data!.address2.isNull
        ? ""
        : loginResponseModel!.data!.address2!;
    cityController.text = loginResponseModel!.data!.city.isNull
        ? ""
        : loginResponseModel!.data!.city!;
    zipCodeController.text = loginResponseModel!.data!.zipCode.isNull
        ? ""
        : loginResponseModel!.data!.zipCode!;
    selectedState.value=loginResponseModel!.data!.state.isNull
        ? ""
        : loginResponseModel!.data!.state!;
    setSelectedState(loginResponseModel!.data!.state!);
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

        loanTenuteList.refresh();
  }

  void onClickOfProcessToLoan() {
    if (selectedLoan.value == "Please select loan") {
      UIUtils.showSnakBar(
          bodyText: "Please select loan", headerText: StringConstants.ERROR);
    }else {
      Get.to(AmountRadialScreen());
    }
  }

  void onClickOfProcessToLoanFinalStep() {
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
      if(double.parse(selectedLoanAmount.value).toInt()> 50000){
        selectedLoan.value="Business Loan";
      };
      getLoanCalculationApi();
      // Get.toNamed(AppRoutes.loanStepScreen);
      // Get.to(AmountRadialScreen());
    }
  }

  Future<void> getLoanCalculationApi() async {
    ApiService()
        .callPostApi(
            body: await getRegisterBody(
                amount: double.parse(selectedLoanAmount.value).toInt().toString(),
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
        Get.toNamed(AppRoutes.loanStepScreen, arguments: {
          "loanCalModel": loanCalModel,
          "loanAmount": selectedLoanAmount.value,
          "loan_type": selectedLoan.value,
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

  void onClickOfFname() {
    if (firstNameController.text.isEmpty) {
      UIUtils.showSnakBar(
          bodyText: "Please Enter First Name",
          headerText: StringConstants.ERROR);
    } else {
      Get.toNamed(AppRoutes.loanLnameScreen);

    }
  }

  void onClickOfLname() {
    if (lastNameController.text.isEmpty) {
      UIUtils.showSnakBar(
          bodyText: "Please Enter Last Name",
          headerText: StringConstants.ERROR);
    } else {
      Get.toNamed(AppRoutes.loanEmailScreen);
    }
  }

  void onClickOfEmail() {
    if (firstNameController.text.isEmpty) {
      UIUtils.showSnakBar(
          bodyText: "Please Enter First Name",
          headerText: StringConstants.ERROR);
    }else if (lastNameController.text.isEmpty) {
      UIUtils.showSnakBar(
          bodyText: "Please Enter Last Name",
          headerText: StringConstants.ERROR);
    }
    else if (emailController.text.isEmpty) {
      UIUtils.showSnakBar(
        headerText: StringConstants.ERROR,
        bodyText: "Please Enter Email",
      );
    } else if (RegexPatterns.emailRegex.hasMatch(emailController.text) ==
        false) {
      UIUtils.showSnakBar(
        headerText: StringConstants.ERROR,
        bodyText: "Please enter Valid Email",
      );
    }/* else if (phoneController.text.isEmpty) {
      UIUtils.showSnakBar(
        headerText: StringConstants.ERROR,
        bodyText: "Please Enter Phone Number",
      );
    } else if (phoneController.text.length != 11) {
      UIUtils.showSnakBar(
          bodyText: "Phone Number Should be 11 digit Number",
          headerText: StringConstants.ERROR);
    }*/ else {
      Get.toNamed(AppRoutes.loanDobScreen);
    }
  }

  void onClickOfDob() {
    if (dobController.text.isEmpty) {
      UIUtils.showSnakBar(
          bodyText: "Please Enter Date Of Birth",
          headerText: StringConstants.ERROR);
    } else if (!isAdult(dobController.text)) {
      UIUtils.showSnakBar(
          bodyText: "Under 18 year old are not eligible for loan",
          headerText: StringConstants.ERROR);
    } else {
      Get.toNamed(AppRoutes.loanSsnScreen);
    }
  }

  void onClickOfSsn() {
    if (ssnController.text.isEmpty) {
      UIUtils.showSnakBar(
          bodyText: "Please enter SSN", headerText: StringConstants.ERROR);
    } else if (ssnController.text.length != 9) {
      UIUtils.showSnakBar(
          bodyText: "SSN Should be 9 digit number",
          headerText: StringConstants.ERROR);
    } else {
      Get.toNamed(AppRoutes.loanAddressScreen);
    }
  }

  void onClickOfAddress() {
    if (address01Controller.text.isEmpty) {
      UIUtils.showSnakBar(
          bodyText: "Please enter first address",
          headerText: StringConstants.ERROR);
    } else if (address02Controller.text.isEmpty) {
      UIUtils.showSnakBar(
          bodyText: "Please enter second address",
          headerText: StringConstants.ERROR);
    } else if (cityController.text.isEmpty) {
      UIUtils.showSnakBar(
          bodyText: "Please enter city", headerText: StringConstants.ERROR);
    } else if (selectedState.value == "Select State") {
      UIUtils.showSnakBar(
          bodyText: "Please enter state", headerText: StringConstants.ERROR);
    } else if (zipCodeController.text.isEmpty) {
      UIUtils.showSnakBar(
          bodyText: "Please enter zipcode", headerText: StringConstants.ERROR);
    } else if (zipCodeController.text.length != 5) {
      UIUtils.showSnakBar(
          bodyText: "Please 5 digit zip code",
          headerText: StringConstants.ERROR);
    } else {
      Get.dialog(
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: getHorizontalSize(40)),
          child: Center(
            child: Material(
              color: Colors.transparent,
              child: Wrap(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: ColorConstant
                            .primaryWhite,
                        borderRadius:
                        const BorderRadius.all(
                            Radius.circular(15))),
                    margin: const EdgeInsets.only(
                        bottom: 20),
                    padding: const EdgeInsets.only(
                      bottom: 20,
                    ),
                    constraints: const BoxConstraints(
                        minWidth: 180),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color:
                              Color(0xFFF4F4F6),
                              borderRadius:
                              const BorderRadius
                                  .all(
                                  Radius.circular(
                                      15))),
                          padding: EdgeInsets.all(12),
                          child: InkWell(
                            onTap:(){
                              // Get.back();
                            },
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment
                                  .end,
                              children: [
                                Icon(
                                    Icons.close),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment
                                      .center,
                                  children: [
                                    Image.asset(
                                        "asset/icons/ic_thumb.png")
                                  ],
                                ),
                                Icon(
                                  Icons.close,
                                  color: Colors
                                      .transparent,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),

                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                            padding: const EdgeInsets
                                .fromLTRB(
                                0, 10, 0, 0),
                            child: Text(
                              "Based on your Profile and \nDocuments, You are eligible for loan \n upto "
                                  "\$11500. Thank You",
                              textAlign:
                              TextAlign.center,
                              style: AppStyle
                                  .DmSansFont
                                  .copyWith(
                                  fontSize: getFontSize(18),
                                  color: ColorConstant
                                      .darkBlue),
                            )),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: getHorizontalSize(40)),
                          child: AppElevatedButton(
                              buttonColor: ColorConstant.primaryLightGreen,
                              buttonName: 'Done',
                              radius: 10,
                              onPressed: () {
                                Get.to(()=>SelectLoanTypeScreen());
                              },),
                        ),
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
  }

  bool isAdult(String birthDateString) {
    String datePattern = "dd/MM/yyyy";

    DateTime birthDate = DateFormat(datePattern).parse(birthDateString);
    DateTime today = DateTime.now();

    int yearDiff = today.year - birthDate.year;
    int monthDiff = today.month - birthDate.month;
    int dayDiff = today.day - birthDate.day;

    return yearDiff > 18 || yearDiff == 18 && monthDiff >= 0 && dayDiff >= 0;
  }

  Future<void> getStateList() async {
    ApiService()
        .callGetApi(
            body: FormData({}),
            headerWithToken: false,
            url: ApiEndPoints.GET_STATE)
        .then((value) {
      print(value);
      if (value['status']) {
        stateList.value = value['data'] ?? [];
        // selectedState.value=stateList.value[0];
        print(stateList);
        // loanModel.value = GetLoanTypeResponseModel.fromJson(value);
        // loanList.value = loanModel.value.data ?? [];
      } else {
        UIUtils.showSnakBar(
            bodyText: value['message'], headerText: StringConstants.ERROR);
      }
    });
  }

  void setSelectedState(String string) {
    selectedState.value = string;
    selectedStateFordropdown = string;
    stateList.refresh();
  }
}
