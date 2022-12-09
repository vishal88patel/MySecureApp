import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:secureapp/routes/app_routes.dart';

import '../../../ApiServices/api_service.dart';
import '../../../App Configurations/api_endpoints.dart';
import '../../../utils/ConstantsFiles/string_constants.dart';
import '../../../utils/HelperFiles/ui_utils.dart';
import '../../loader_screen.dart';

class EnterAddressScreenController extends GetxController {
  TextEditingController address01Controller = TextEditingController();
  TextEditingController address02Controller = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController zipCodeController = TextEditingController();
  var stateList=[].obs;
  var selectedState="Select State".obs;
  String? selectedStateFordropdown;


  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onInit() {
    Future.delayed(Duration(milliseconds: 50),(){
      getStateList();
    });
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  onTapOfNextButton() {
    if (address01Controller.text.isEmpty) {
      UIUtils.showSnakBar(
          bodyText: "Please enter first address",
          headerText: StringConstants.ERROR);
    }  else if (cityController.text.isEmpty) {
      UIUtils.showSnakBar(
          bodyText: "Please enter city", headerText: StringConstants.ERROR);
    } else if (selectedState.value.isEmpty) {
      UIUtils.showSnakBar(
          bodyText: "Please enter state", headerText: StringConstants.ERROR);
    } else if (zipCodeController.text.isEmpty) {
      UIUtils.showSnakBar(
          bodyText: "Please enter zipcode", headerText: StringConstants.ERROR);
    }else if (zipCodeController.text.length!=5) {
      UIUtils.showSnakBar(bodyText: "Please 5 digit zip code", headerText: StringConstants.ERROR);
    } else {
      // Get.toNamed(AppRoutes.enterPersonalDetailScreen);
      Get.to(()=> LoaderScreen(AppRoutes.enterPersonalDetailScreen),
          transition: Transition.rightToLeft);
    }
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

        stateList.value=value['data']??[];
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
    selectedState.value=string;
    selectedStateFordropdown=string;
    stateList.refresh();
  }
}
