import 'package:get/get.dart';

import '../../../ApiServices/api_service.dart';
import '../../../App Configurations/api_endpoints.dart';
import '../../../routes/app_routes.dart';
import '../../../utils/ConstantsFiles/string_constants.dart';
import '../../../utils/HelperFiles/pref_utils.dart';
import '../../../utils/HelperFiles/ui_utils.dart';
import '../../LoginScreen/models/login_response_model.dart';
import '../../NormalScreen/WelcomeScreen.dart';
import '../../PersonalDetails/model/get_loan_type_response_model.dart';

class SelectLoanTypeScreenController extends GetxController {
  var isKycDone = false.obs;
  var loanModel = GetLoanTypeResponseModel().obs;
  var loanList = [].obs;
  var maximumAvailableLoan = 500000.obs;
  var interestRate = "".obs;
  var selectedLoanAmount = "".obs;
  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onInit() {
    getStoredData();


    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
  Future<void> getStoredData() async {
    if (PrefUtils.getString(StringConstants.IS_KYC_DONE) != "0") {
      isKycDone.value = true;
      Future.delayed(Duration(milliseconds: 50), () {
        getLoanTypeApi();
      });
    } else {
      isKycDone.value = false;
    }
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

}
