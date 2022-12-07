import 'package:get/get.dart';
import 'package:my_secure_app/routes/app_routes.dart';

import '../../../ApiServices/api_service.dart';
import '../../../App Configurations/api_endpoints.dart';
import '../../../utils/ConstantsFiles/string_constants.dart';
import '../../../utils/HelperFiles/ui_utils.dart';
import '../Model/getUuidDetail.dart';
import '../Model/getWallet.dart';



class HistoryScreenController extends GetxController {
  var walletModel=GetWallet().obs;
  var uuidModel=GetUuidDetail().obs;
  RxList transactionList=[].obs;
  var pageNumber=1.obs;
  var lastPage=0.obs;
  var balance="".obs;
  var uuid="".obs;
  var isPin=0.obs;
  var qrCodeResult="".obs;



  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onInit() {
    callGetWalletApi(pageNo: 1);

    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
  Future<void> callGetWalletApi({required int pageNo}) async {
    ApiService()
        .callGetApi(
        body: await getWalletApiBody(),
        headerWithToken: true,
        showLoader: false,
        url: ApiEndPoints.GET_WALLET+"?page=$pageNo")
        .then((value) {
      print(value);
      if (value!=null&&value['status']) {
        walletModel.value = GetWallet.fromJson(value);
        isPin.value= walletModel.value.data!.isPin!;
        lastPage.value= walletModel.value.data!.lastPage!;
        balance.value= walletModel.value.data!.walletBalance!;
        transactionList.addAll(walletModel.value.data!.userTransaction??[]);
        uuid.value= walletModel.value.data!.uuid!??"";

      } else {
        UIUtils.hideProgressDialog();
        // UIUtils.showSnakBar(
        //     bodyText: value['message']??'', headerText: StringConstants.ERROR);
      }
    });
  }

  Future<FormData> getWalletApiBody() async {
    final form = FormData({});
    return form;
  }


  onClickOfNotificationTile(String routeName) {
    switch (routeName) {
      case "SCAN_PAY":
        Get.offAllNamed(AppRoutes.dashBoardScreen,
            arguments: {"bottomTabCount": 2});
        break;
      case "PI":
      // do something else
        break;
    }
  }


}
