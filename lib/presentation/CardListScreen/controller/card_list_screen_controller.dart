
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../ApiServices/api_service.dart';
import '../../../App Configurations/api_endpoints.dart';
import '../../../utils/ConstantsFiles/string_constants.dart';
import '../../../utils/HelperFiles/ui_utils.dart';
import '../model/card_list_response_model.dart';



class CardListScreenController extends GetxController {
  var cardListModel=CardListResponseModel().obs;
  RxList mainCardList=[].obs;
  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onInit() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> callGetBankListApi({required int pageNo}) async {
    ApiService()
        .callGetApi(
        body: await getCardApiBody(),
        headerWithToken: true,
        showLoader: true,
        url: ApiEndPoints.GET_CARDLIST)
        .then((value) {
      print(value);
      if (value['status']) {
        cardListModel.value = CardListResponseModel.fromJson(value);
        for (int i = 0; i < cardListModel.value.data!.length; i++) {
          mainCardList.value.add(cardListModel.value.data![i]);
        }

      } else {
        UIUtils.showSnakBar(
            bodyText: value['message'], headerText: StringConstants.ERROR);
      }
    });
  }

  Future<FormData> getCardApiBody() async {
    final form = FormData({});
    return form;
  }

}
