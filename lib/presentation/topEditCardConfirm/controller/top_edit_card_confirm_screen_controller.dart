import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../routes/app_routes.dart';
import '../../../utils/ConstantsFiles/string_constants.dart';
import '../../../utils/HelperFiles/pref_utils.dart';
import '../../LoginScreen/models/login_response_model.dart';
import '../../NormalScreen/WelcomeScreen.dart';
import '../../topAddCard1/controller/top_add_card1_screen_controller.dart';

class TopEditCardConfirmController extends GetxController {
  var cardController = Get.put(TopAddCard1Controller());
  TextEditingController nameController = TextEditingController();
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController expDateController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  var readOnly = true.obs;
  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onInit() {
    setData();

    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void setData(){
    nameController.text=cardController.nameController.text.toString();
    cardNumberController.text=cardController.cardNumberController.text.toString();
    expDateController.text=cardController.expDateController.text.toString();
    cvvController.text=cardController.cvvController.text.toString();
  }

}
