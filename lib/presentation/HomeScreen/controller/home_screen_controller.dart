import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:my_secure_app/presentation/EnterPasswordScreen/models/login_response_model.dart';

import '../../../ApiServices/api_service.dart';
import '../../../App Configurations/api_endpoints.dart';
import '../../../utils/ConstantsFiles/string_constants.dart';
import '../../../utils/HelperFiles/pref_utils.dart';
import '../../../utils/HelperFiles/ui_utils.dart';
import '../model/get_linked_bank.dart';
import '../model/home_page_response_model.dart';



class HomeScreenController extends GetxController {
  LoginResponseModel? loginResponseModel=LoginResponseModel();
  var homeModel = HomePageResponseModel().obs;
  var getLinkedBankModel = GrtLinkedBank().obs;
  var homePageHeadeName="".obs;
  var profilePicture="".obs;
  var showNotiFiBadge=false.obs;
  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onInit() {
    getStoredData();
    callHomePageApi();
    callGetLinkedBankApi();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> getStoredData() async {
     loginResponseModel = (await PrefUtils.getLoginModelData(StringConstants.LOGIN_RESPONSE));
     homePageHeadeName.value=loginResponseModel!.data!.firstName!+" "+loginResponseModel!.data!.lastName.toString();
     profilePicture.value=loginResponseModel!.data!.profilePhotoPath.toString();
     if(PrefUtils.getString(StringConstants.IS_KYC_DONE)=="0"){
       showNotiFiBadge.value=true;
     }else{
       showNotiFiBadge.value=false;
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
      if (value['status']??false) {
        homeModel.value = HomePageResponseModel.fromJson(value);
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
      if (value['status']??false ) {
        getLinkedBankModel.value = GrtLinkedBank.fromJson(value);
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

}
